//
//  UIApplication+JKApplicationSize.m
//  testSize
//
//  Created by Ignazio Calo on 23/01/15.
//  Copyright (c) 2015 IgnazioC. All rights reserved.
//

#import "UIApplication+JKApplicationSize.h"

@implementation UIApplication (JKApplicationSize)

- (NSString *)jk_applicationSize {
    unsigned long long docSize   =  [self jk_sizeOfFolder:[self jk_documentPath]];
    unsigned long long libSize   =  [self jk_sizeOfFolder:[self jk_libraryPath]];
    unsigned long long cacheSize =  [self jk_sizeOfFolder:[self jk_cachePath]];
    
    unsigned long long total = docSize + libSize + cacheSize;
    
    NSString *folderSizeStr = [NSByteCountFormatter stringFromByteCount:total countStyle:NSByteCountFormatterCountStyleFile];
    return folderSizeStr;
}


- (NSString *)jk_documentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}

- (NSString *)jk_libraryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}

- (NSString *)jk_cachePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}



-(unsigned long long)jk_sizeOfFolder:(NSString *)folderPath
{
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
    NSEnumerator *contentsEnumurator = [contents objectEnumerator];
    
    NSString *file;
    unsigned long long folderSize = 0;
    
    while (file = [contentsEnumurator nextObject]) {
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:file] error:nil];
        folderSize += [[fileAttributes objectForKey:NSFileSize] intValue];
    }
    return folderSize;
}
@end
