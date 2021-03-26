//
//  NSDictionary+JKJSONString.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JKJSONString)

/// 将 NSDictionary 转换为 JSON String
- (NSString *)jk_JSONString;

@end
