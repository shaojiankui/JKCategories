//
//  NSData+Encrypt.h
//  categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Encrypt)
- (NSData *)AES256EncryptWithKey:(NSString *)key;   // Encrypt
- (NSData *)AES256DecryptWithKey:(NSString *)key;   // Decrypt

- (NSString *)stringByBase64EncodingData;
- (NSString *)stringByBase64DecodingData;

- (NSString *)UTF8String;
@end
