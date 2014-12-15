//
//  NSData+Encrypt.m
//  categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSData+Encrypt.h"
#import <CommonCrypto/CommonCryptor.h>


NSUInteger Base64encode_len(NSUInteger len);
NSInteger Base64encode(char * coded_dst, const char *plain_src, NSUInteger len_plain_src);

NSUInteger Base64decode_len(const char * coded_src);
NSInteger Base64decode(char * plain_dst, const char *coded_src);

static const char Base64EncodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";


@implementation NSData (Encrypt)
- (NSData *)AES256EncryptWithKey:(NSString *)key {
    // 'key' should be 32 bytes for AES256, will be null-padded otherwise
    char keyPtr[kCCKeySizeAES256 + 1];   // room for terminator (unused)
    
    bzero(keyPtr, sizeof(keyPtr));     // fill with zeroes (for padding)
    // fetch key data
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    // See the doc: For block ciphers, the output size will always be less than or
    // equal to the input size plus the size of one block.
    // That's why we need to add the size of one block here
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        
        // the returned NSData takes ownership of the buffer and will free it on deallocation
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer);
    
    return nil;
}

- (NSData *)AES256DecryptWithKey:(NSString *)key {
    char keyPtr[kCCKeySizeAES256 + 1];
    
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    
    // See the doc: For block ciphers, the output size will always be less than or
    // equal to the input size plus the size of one block.
    // That's why we need to add the size of one block here
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    
    free(buffer);
    
    return nil;
}

-(NSString *)stringByBase64EncodingData{
    if ([self length] == 0)
        return @"";
    
    char *characters = malloc((([self length] + 2) / 3) * 4);
    if (characters == NULL)
        return nil;
    NSUInteger length = 0;
    
    NSUInteger i = 0;
    while (i < [self length])
    {
        char buffer[3] = {0,0,0};
        short bufferLength = 0;
        while (bufferLength < 3 && i < [self length])
            buffer[bufferLength++] = ((char *)[self bytes])[i++];
        
        //  Encode the bytes in the buffer to four characters, including padding "=" characters if necessary.
        characters[length++] = Base64EncodingTable[(buffer[0] & 0xFC) >> 2];
        characters[length++] = Base64EncodingTable[((buffer[0] & 0x03) << 4) | ((buffer[1] & 0xF0) >> 4)];
        if (bufferLength > 1)
            characters[length++] = Base64EncodingTable[((buffer[1] & 0x0F) << 2) | ((buffer[2] & 0xC0) >> 6)];
        else characters[length++] = '=';
        if (bufferLength > 2)
            characters[length++] = Base64EncodingTable[buffer[2] & 0x3F];
        else characters[length++] = '=';
    }
    
    return [[NSString alloc] initWithBytesNoCopy:characters length:length encoding:NSASCIIStringEncoding freeWhenDone:YES];
}

-(NSString *)stringByBase64DecodingData{
    const void *inBytes = [self bytes];
    
    NSUInteger outLength = Base64decode_len(inBytes);
    void *outBytes = malloc(outLength);
    Base64decode(outBytes, inBytes);
    
    NSData *outData = [NSData dataWithBytesNoCopy:outBytes length:outLength freeWhenDone:YES];
    return [[NSString alloc] initWithData:outData encoding:NSASCIIStringEncoding];
}

-(NSString *)UTF8String{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

@end

#include <string.h>

static const unsigned char Base64_pr2six[256] =
{
    /* ASCII table */
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 62, 64, 64, 64, 63,
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 64, 64, 64, 64, 64, 64,
    64,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 64, 64, 64, 64, 64,
    64, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64
};

NSUInteger Base64decode_len(const char *bufcoded)
{
    NSInteger nbytesdecoded;
    register const unsigned char *bufin;
    register NSInteger nprbytes;
    
    bufin = (const unsigned char *) bufcoded;
    while (Base64_pr2six[*(bufin++)] <= 63);
    
    nprbytes = (bufin - (const unsigned char *) bufcoded) - 1;
    nbytesdecoded = ((nprbytes + 3) / 4) * 3;
    
    return nbytesdecoded + 1;
}

NSInteger Base64decode(char *bufplain, const char *bufcoded)
{
    NSInteger nbytesdecoded;
    register const unsigned char *bufin;
    register unsigned char *bufout;
    register NSInteger nprbytes;
    
    bufin = (const unsigned char *) bufcoded;
    while (Base64_pr2six[*(bufin++)] <= 63);
    nprbytes = (bufin - (const unsigned char *) bufcoded) - 1;
    nbytesdecoded = ((nprbytes + 3) / 4) * 3;
    
    bufout = (unsigned char *) bufplain;
    bufin = (const unsigned char *) bufcoded;
    
    while (nprbytes > 4) {
        *(bufout++) =
        (unsigned char) (Base64_pr2six[*bufin] << 2 | Base64_pr2six[bufin[1]] >> 4);
        *(bufout++) =
        (unsigned char) (Base64_pr2six[bufin[1]] << 4 | Base64_pr2six[bufin[2]] >> 2);
        *(bufout++) =
        (unsigned char) (Base64_pr2six[bufin[2]] << 6 | Base64_pr2six[bufin[3]]);
        bufin += 4;
        nprbytes -= 4;
    }
    
    /* Note: (nprbytes == 1) would be an error, so just ingore that case */
    if (nprbytes > 1) {
        *(bufout++) =
        (unsigned char) (Base64_pr2six[*bufin] << 2 | Base64_pr2six[bufin[1]] >> 4);
    }
    if (nprbytes > 2) {
        *(bufout++) =
        (unsigned char) (Base64_pr2six[bufin[1]] << 4 | Base64_pr2six[bufin[2]] >> 2);
    }
    if (nprbytes > 3) {
        *(bufout++) =
        (unsigned char) (Base64_pr2six[bufin[2]] << 6 | Base64_pr2six[bufin[3]]);
    }
    
    *(bufout++) = '\0';
    nbytesdecoded -= (4 - nprbytes) & 3;
    return nbytesdecoded;
}

static const char Base64_basis64[] =
"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

NSUInteger Base64encode_len(NSUInteger len)
{
    return ((len + 2) / 3 * 4) + 1;
}

NSInteger Base64encode(char *encoded, const char *string, NSUInteger len)
{
    int i;
    char *p;
    
    p = encoded;
    for (i = 0; i < len - 2; i += 3) {
        *p++ = Base64_basis64[(string[i] >> 2) & 0x3F];
        *p++ = Base64_basis64[((string[i] & 0x3) << 4) |
                              ((int) (string[i + 1] & 0xF0) >> 4)];
        *p++ = Base64_basis64[((string[i + 1] & 0xF) << 2) |
                              ((int) (string[i + 2] & 0xC0) >> 6)];
        *p++ = Base64_basis64[string[i + 2] & 0x3F];
    }
    if (i < len) {
        *p++ = Base64_basis64[(string[i] >> 2) & 0x3F];
        if (i == (len - 1)) {
            *p++ = Base64_basis64[((string[i] & 0x3) << 4)];
            *p++ = '=';
        }
        else {
            *p++ = Base64_basis64[((string[i] & 0x3) << 4) |
                                  ((int) (string[i + 1] & 0xF0) >> 4)];
            *p++ = Base64_basis64[((string[i + 1] & 0xF) << 2)];
        }
        *p++ = '=';
    }
    
    *p++ = '\0';
    return p - encoded;
}
