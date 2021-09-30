//
//  NSDictionary+JKURL.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/8/7.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import "NSDictionary+JKURL.h"

@implementation NSDictionary (JKURI)

+ (NSDictionary *)jk_dictionaryWithURLQuery:(NSString *)query {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSArray *parameters = [query componentsSeparatedByString:@"&"];
    for(NSString *parameter in parameters) {
        NSArray *contents = [parameter componentsSeparatedByString:@"="];
        if([contents count] == 2) {
            NSString *key = [contents objectAtIndex:0];
            NSString *value = [contents objectAtIndex:1];
            // 通过删除百分比编码字符串
            value = [value stringByRemovingPercentEncoding];
            if (key && value) {
                [dict setObject:value forKey:key];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}

- (NSString *)jk_URLQueryString2 {
    NSMutableString *string = [NSMutableString string];
    for (NSString *key in [self allKeys]) {
        if ([string length]) {
            [string appendString:@"&"];
        }
        NSString *value = [self objectForKey:key];
        value = [value stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        [string appendFormat:@"%@=%@", key, value];
    }
    return string;
}

@end
