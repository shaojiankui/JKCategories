//
//  NSString+JKDictionary.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14-6-13.
//  Copyright (c) 2014年 jakey. All rights reserved.
//

#import "NSString+JKDictionaryValue.h"

@implementation NSString (JKDictionaryValue)

// 原理：NSString -> NSData -> NSDictionary
- (NSDictionary *)jk_dictionaryValue{
    NSError *error;
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    if (!jsonDict) {
#ifdef DEBUG
        NSLog(@"%@, NSString 转换成 NSDictionary 错误, Error:%@", @(__PRETTY_FUNCTION__), error);
#endif
    }
    return jsonDict;
}

@end
