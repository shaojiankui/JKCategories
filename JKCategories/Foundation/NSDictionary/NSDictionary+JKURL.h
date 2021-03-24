//
//  NSDictionary+JKURL.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/8/7.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JKURL)

/// 将url参数转换成 NSDictionary
/// @param query url参数
+ (NSDictionary *)jk_dictionaryWithURLQuery:(NSString *)query;

/// 将 NSDictionary 转换成url参数字符串
- (NSString *)jk_URLQueryString2;

@end
