//
//  NSString+JKDictionary.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14-6-13.
//  Copyright (c) 2014年 jakey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JKDictionaryValue)

/// 将 JSON String 转换为 NSDictionary
- (NSDictionary *)jk_dictionaryValue;

@end
