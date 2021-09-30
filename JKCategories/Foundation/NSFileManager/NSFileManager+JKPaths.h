//
//  NSFileManager+Paths.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (JKPaths)

+ (NSURL *)jk_documentsURL;
+ (NSString *)jk_documentsPath;

+ (NSURL *)jk_libraryURL;
+ (NSString *)jk_libraryPath;

+ (NSURL *)jk_cachesURL;
+ (NSString *)jk_cachesPath;

/// Adds a special filesystem flag to a file to avoid iCloud backup it.
+ (BOOL)jk_addSkipBackupAttributeToFile:(NSString *)path;

/// Get available disk space.
+ (double)jk_availableDiskSpace;

@end
