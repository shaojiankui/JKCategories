
#import <Foundation/Foundation.h>

#import <zlib.h>
#import <dlfcn.h>
#import "NSData+JKzlib.h"

static const uInt CHUNK_SIZE = 65536;

NSString *const JKZlibErrorDomain = @"se.bitba.JKZlibErrorDomain";
NSString *const JKZlibErrorInfoKey = @"zerror";

@implementation NSData (JKzlib)
static void *jk_zlibOpen()
{
    static void *libz;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        libz = dlopen("/usr/lib/libz.dylib", RTLD_LAZY);
    });
    return libz;
}

- (NSData *)jk_dataByInflatingWithError:(NSError *__autoreleasing *)error
{
    if (![self length]) return [self copy];
    NSMutableData *outData = [NSMutableData data];
    [self jk_inflate:^(NSData *toAppend) {
        [outData appendData:toAppend];
    }
            error:error];
    return outData;
}

- (NSData *)jk_dataByDeflatingWithError:(NSError *__autoreleasing *)error
{
    if (![self length]) return [self copy];
    NSMutableData *outData = [NSMutableData data];
    [self jk_deflate:^(NSData *toAppend) {
        [outData appendData:toAppend];
    }
            error:error];
    return outData;
}

// Adapted from http://www.zlib.net/zpipe.c
- (BOOL)jk_inflate:(void (^)(NSData *))processBlock
          error:(NSError *__autoreleasing *)error
{
    void *libz = jk_zlibOpen();
//    int (*deflateInit2_)(z_streamp, int, int, int, int, int, const char *, int) =
//    (int (*)(z_streamp, int, int, int, int, int, const char *, int))dlsym(libz, "deflateInit2_");
//    int (*deflateInit_)(z_streamp, int, const char *, int) =
//    (int (*)(z_streamp, int, const char *, int))dlsym(libz, "deflateInit_");
    
    int (*inflateInit_)(z_streamp,const char *, int) =
    (int (*)(z_streamp,  const char *, int))dlsym(libz, "inflateInit_");
    int (*inflate)(z_streamp, int) = (int (*)(z_streamp, int))dlsym(libz, "inflate");
//    int (*deflate)(z_streamp, int) = (int (*)(z_streamp, int))dlsym(libz, "deflate");
//    int (*deflateEnd)(z_streamp) = (int (*)(z_streamp))dlsym(libz, "deflateEnd");
    int (*inflateEnd)(z_streamp) = (int (*)(z_streamp))dlsym(libz, "inflateEnd");

    
    z_stream stream;
    stream.zalloc = Z_NULL;
    stream.zfree = Z_NULL;
    stream.opaque = Z_NULL;
    stream.avail_in = 0;
    stream.next_in = Z_NULL;

    int ret = inflateInit(&stream);
    if (ret != Z_OK) {
        if (error) *error = [NSError errorWithDomain:JKZlibErrorDomain
                                                code:JKZlibErrorCodeInflationError
                                            userInfo:@{JKZlibErrorInfoKey : @(ret)}];
        return NO;
    }
    Bytef *source = (Bytef *)[self bytes]; // yay
    uInt offset = 0;
    uInt len = (uInt)[self length];

    do {
        stream.avail_in = MIN(CHUNK_SIZE, len - offset);
        if (stream.avail_in == 0) break;
        stream.next_in = source + offset;
        offset += stream.avail_in;
        do {
            Bytef out[CHUNK_SIZE];
            stream.avail_out = CHUNK_SIZE;
            stream.next_out = out;
            ret = inflate(&stream, Z_NO_FLUSH);
            switch (ret) {
                case Z_NEED_DICT:
                case Z_DATA_ERROR:
                case Z_MEM_ERROR:
                case Z_STREAM_ERROR:
                    inflateEnd(&stream);
                    if (error) *error = [NSError errorWithDomain:JKZlibErrorDomain
                                                            code:JKZlibErrorCodeInflationError
                                                        userInfo:@{JKZlibErrorInfoKey : @(ret)}];
                    return NO;
            }
            processBlock([NSData dataWithBytesNoCopy:out
                                              length:CHUNK_SIZE - stream.avail_out
                                        freeWhenDone:NO]);
        } while (stream.avail_out == 0);
    } while (ret != Z_STREAM_END);

    inflateEnd(&stream);
    return YES;
}

// Adapted from http://www.zlib.net/zpipe.c
- (BOOL)jk_deflate:(void (^)(NSData *))processBlock
          error:(NSError *__autoreleasing *)error
{
    void *libz = jk_zlibOpen();
//    int (*deflateInit2_)(z_streamp, int, int, int, int, int, const char *, int) =
//    (int (*)(z_streamp, int, int, int, int, int, const char *, int))dlsym(libz, "deflateInit2_");
    int (*deflateInit_)(z_streamp, int, const char *, int) =
    (int (*)(z_streamp, int, const char *, int))dlsym(libz, "deflateInit_");
    
//    int (*inflate)(z_streamp, int) = (int (*)(z_streamp, int))dlsym(libz, "inflate");
    int (*deflate)(z_streamp, int) = (int (*)(z_streamp, int))dlsym(libz, "deflate");
    int (*deflateEnd)(z_streamp) = (int (*)(z_streamp))dlsym(libz, "deflateEnd");
//    int (*inflateEnd)(z_streamp) = (int (*)(z_streamp))dlsym(libz, "inflateEnd");

    
    z_stream stream;
    stream.zalloc = Z_NULL;
    stream.zfree = Z_NULL;
    stream.opaque = Z_NULL;

    int ret = deflateInit(&stream, 9);
    
    if (ret != Z_OK) {
        if (error) *error = [NSError errorWithDomain:JKZlibErrorDomain
                                                code:JKZlibErrorCodeDeflationError
                                            userInfo:@{JKZlibErrorInfoKey : @(ret)}];
        return NO;
    }
    Bytef *source = (Bytef *)[self bytes]; // yay
    uInt offset = 0;
    uInt len = (uInt)[self length];
    int flush;

    do {
        stream.avail_in = MIN(CHUNK_SIZE, len - offset);
        stream.next_in = source + offset;
        offset += stream.avail_in;
        flush = offset > len - 1 ? Z_FINISH : Z_NO_FLUSH;
        do {
            Bytef out[CHUNK_SIZE];
            stream.avail_out = CHUNK_SIZE;
            stream.next_out = out;
            ret = deflate(&stream, flush);
            if (ret == Z_STREAM_ERROR) {
                if (error) *error = [NSError errorWithDomain:JKZlibErrorDomain
                                                        code:JKZlibErrorCodeDeflationError
                                                    userInfo:@{JKZlibErrorInfoKey : @(ret)}];
                return NO;
            }
            processBlock([NSData dataWithBytesNoCopy:out
                                              length:CHUNK_SIZE - stream.avail_out
                                        freeWhenDone:NO]);
        } while (stream.avail_out == 0);
    } while (flush != Z_FINISH);
    deflateEnd(&stream);
    return YES;
}

- (BOOL)jk_writeDeflatedToFile:(NSString *)path
                          error:(NSError *__autoreleasing *)error
{
    NSFileHandle *f = jk_createOrOpenFileAtPath(path, error);
    if (!f) return NO;
    BOOL success = YES;
    if ([self length]) {
        success = [self jk_deflate:
                   ^(NSData *toAppend) {
                       [f writeData:toAppend];
                   }
                          error:error];
    } else {
        [f writeData:self];
    }
    [f closeFile];
    return success;
}

- (BOOL)jk_writeInflatedToFile:(NSString *)path
                          error:(NSError *__autoreleasing *)error
{
    NSFileHandle *f = jk_createOrOpenFileAtPath(path, error);
    if (!f) return NO;
    BOOL success = YES;
    if ([self length]) {
        success = [self jk_inflate:
                   ^(NSData *toAppend) {
                       [f writeData:toAppend];
                   }
                          error:error];
    } else {
        [f writeData:self];
    }
    [f closeFile];
    return success;
}

static NSFileHandle *jk_createOrOpenFileAtPath(NSString *path, NSError *__autoreleasing *error)
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        BOOL success = [[NSFileManager defaultManager] createFileAtPath:path
                                                               contents:nil
                                                             attributes:nil];
        if (!success) {
            if (error) *error = [NSError errorWithDomain:JKZlibErrorDomain
                                                    code:JKZlibErrorCodeCouldNotCreateFileError
                                                userInfo:nil];
            return nil;
        }
    }
    return [NSFileHandle fileHandleForWritingAtPath:path];
}

@end
