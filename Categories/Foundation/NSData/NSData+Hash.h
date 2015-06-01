//
//  NSData+Hash.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/6/1.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Hash)
@property (readonly) NSData *md5Data;
@property (readonly) NSData *sha1Data;
@property (readonly) NSData *sha256Data;
@property (readonly) NSData *sha512Data;

- (NSData *)hmacMD5DataWithKey:(NSData *)key;
- (NSData *)hmacSHA1DataWithKey:(NSData *)key;
- (NSData *)hmacSHA256DataWithKey:(NSData *)key;
- (NSData *)hmacSHA512DataWithKey:(NSData *)key;
@end
