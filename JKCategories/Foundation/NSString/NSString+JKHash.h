//
//  NSString+JKHash.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSString (JKHash)
@property (readonly) NSString *jk_md5String;
@property (readonly) NSString *jk_sha1String;
@property (readonly) NSString *jk_sha256String;
@property (readonly) NSString *jk_sha512String;

- (NSString *)jk_hmacMD5StringWithKey:(NSString *)key;
- (NSString *)jk_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)jk_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)jk_hmacSHA512StringWithKey:(NSString *)key;
@end