//
//  NSString+UrlEncode.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//


#import "NSString+JKURLEncode.h"

@implementation NSString (JKURLEncode)
/**
 *  @brief  urlEncode
 *
 *  @return urlEncode 后的字符串
 */
- (NSString *)jk_urlEncode {
    return [self jk_urlEncodeUsingEncoding:NSUTF8StringEncoding];
}
/**
 *  @brief  urlEncode
 *
 *  @param encoding encoding模式
 *
 *  @return urlEncode 后的字符串
 */
- (NSString *)jk_urlEncodeUsingEncoding:(NSStringEncoding)encoding {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

/**
 *  @brief  urlDecode
 *
 *  @return urlDecode 后的字符串
 */
- (NSString *)jk_urlDecode {
    return [self jk_urlDecodeUsingEncoding:NSUTF8StringEncoding];
}

/**
 *  @brief  urlDecode
 *
 *  @param encoding encoding模式
 *
 *  @return urlDecode 后的字符串
 */
- (NSString *)jk_urlDecodeUsingEncoding:(NSStringEncoding)encoding {
    return [self stringByRemovingPercentEncoding];
}

/**
 *  @brief  url query 转成 NSDictionary
 *
 *  @return NSDictionary
 */
- (NSDictionary *)jk_dictionaryFromURLParameters {
    NSArray *pairs = [self componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val = [[kv objectAtIndex:1] stringByRemovingPercentEncoding];
        [params setObject:val forKey:[kv objectAtIndex:0]];
    }
    return params;
}

@end
