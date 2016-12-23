//
//  NSData+JKEncrypt.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//
// 加密解密工具 http://tool.chacuo.net/cryptdes

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSData (JKEncrypt)

/**
 *  利用AES加密数据
 *
 *  @param key  key 长度一般为16（AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)jk_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  @brief  利用AES解密据
 *
 *  @param key key 长度一般为16 （AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
- (NSData *)jk_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  利用DES加密数据
 *
 *  @param key key 长度一般为8
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)jk_encryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  @brief   利用DES解密数据
 *
 *  @param key key 长度一般为8
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
- (NSData *)jk_decryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  利用3DES加密数据
 *
 *  @param key key 长度一般为24
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)jk_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  @brief   利用3DES解密数据
 *
 *  @param key key 长度一般为24
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
- (NSData *)jk_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;


- (NSData *)jk_CCCryptData:(NSData *)data
                 algorithm:(CCAlgorithm)algorithm
                 operation:(CCOperation)operation
                       key:(NSString *)key
                        iv:(NSData *)iv;
/**
 *  @brief  NSData 转成UTF8 字符串
 *
 *  @return 转成UTF8 字符串
 */
- (NSString *)jk_UTF8String;
@end
