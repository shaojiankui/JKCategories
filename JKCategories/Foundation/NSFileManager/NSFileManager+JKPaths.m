//
//  NSFileManager+Paths.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSFileManager+JKPaths.h"
#include <sys/xattr.h>

@implementation NSFileManager (JKPaths)
+ (NSURL *)jk_URLForDirectory:(NSSearchPathDirectory)directory
{
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}

+ (NSString *)jk_pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+ (NSURL *)jk_documentsURL
{
    return [self jk_URLForDirectory:NSDocumentDirectory];
}

+ (NSString *)jk_documentsPath
{
    return [self jk_pathForDirectory:NSDocumentDirectory];
}

+ (NSURL *)jk_libraryURL
{
    return [self jk_URLForDirectory:NSLibraryDirectory];
}

+ (NSString *)jk_libraryPath
{
    return [self jk_pathForDirectory:NSLibraryDirectory];
}

+ (NSURL *)jk_cachesURL
{
    return [self jk_URLForDirectory:NSCachesDirectory];
}

+ (NSString *)jk_cachesPath
{
    return [self jk_pathForDirectory:NSCachesDirectory];
}

+ (BOOL)jk_addSkipBackupAttributeToFile:(NSString *)path
{
    return [[NSURL.alloc initFileURLWithPath:path] setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:nil];
}

+ (double)jk_availableDiskSpace
{
    NSDictionary *attributes = [self.defaultManager attributesOfFileSystemForPath:self.jk_documentsPath error:nil];
    
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}
@end
