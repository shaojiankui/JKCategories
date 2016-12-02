//
//  NSDictionary+JKXML.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/8/7.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//  https://github.com/shaojiankui/NSDictionary-JKXML

// 在线XML、JSON数据互转
// http://www.bejson.com/xml2json/

//XML 新手入门基础知识
//http://www.ibm.com/developerworks/cn/xml/x-newxml/
#import <Foundation/Foundation.h>

@interface NSDictionary (JKXML)
/**
 *  @brief  将NSDictionary转换成XML字符串 不带XML声明 不带根节点
 *
 *  @return XML 字符串
 */
- (NSString *)jk_XMLString;
/**
 *  @brief  将NSDictionary转换成XML字符串, 默认 <?xml version=\"1.0\" encoding=\"utf-8\"?> 声明   自定义根节点
 *
 *  @param rootElement 根节点
 *
 *  @return XML 字符串
 */
- (NSString *)jk_XMLStringDefaultDeclarationWithRootElement:(NSString*)rootElement;
/**
 *  @brief  将NSDictionary转换成XML字符串, 自定义根节点  自定义xml声明
 *
 *  @param rootElement 根节点
 *
 *  @param declaration xml声明
 *
 *  @return 标准合法 XML 字符串
 */
- (NSString *)jk_XMLStringWithRootElement:(NSString*)rootElement declaration:(NSString*)declaration;
/**
 *  @brief  将NSDictionary转换成Plist字符串
 *
 *  @return Plist 字符串
 */
- (NSString *)jk_plistString;
/**
 *  @brief  将NSDictionary转换成Plist data
 *
 *  @return Plist data
 */
- (NSData *)jk_plistData;

@end
