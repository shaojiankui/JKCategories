//
//  NSString+JKEncrypt.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/26.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSString+JKEncrypt.h"
#import "NSData+JKEncrypt.h"
#import "NSData+JKBase64.h"

@implementation NSString (JKEncrypt)
-(NSString*)jk_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] jk_encryptedWithAESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted jk_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)jk_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData jk_dataWithBase64EncodedString:self] jk_decryptedWithAESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

- (NSString*)jk_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] jk_encryptedWith3DESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted jk_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)jk_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData jk_dataWithBase64EncodedString:self] jk_decryptedWith3DESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

@end
