//
//  NSDictionary+JKJSONString.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSDictionary+JKJSONString.h"

@implementation NSDictionary (JKJSONString)

// 原理：NSDictionary -> NSData -> NSString
- (NSString *)jk_JSONString {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (!jsonData) {
#ifdef DEBUG
        NSLog(@"%@, NSDictionary 转换成 JSON 字符串错误，Error:%@", @(__PRETTY_FUNCTION__), error);
#endif
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
