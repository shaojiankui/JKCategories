//
//  NSURL+Param.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (JKParam)

/// url参数转字典
- (NSDictionary *)jk_parameters;

/// 根据参数名 取参数值
/// @param parameterKey 参数名的key
- (NSString *)jk_valueForParameter:(NSString *)parameterKey;

@end
