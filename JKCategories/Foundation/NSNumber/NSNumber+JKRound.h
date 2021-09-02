//
//  NSNumber+Round.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (JKRound)

/// 展示
- (NSString*)jk_toDisplayNumberWithDigit:(NSInteger)digit;
- (NSString*)jk_toDisplayPercentageWithDigit:(NSInteger)digit;

/// 四舍五入
/// @param digit 限制最大位数
- (NSNumber*)jk_doRoundWithDigit:(NSUInteger)digit;

/// 向上取整
/// @param digit 限制最大位数
- (NSNumber*)jk_doCeilWithDigit:(NSUInteger)digit;

/// 向下取整
/// @param digit 限制最大位数
- (NSNumber*)jk_doFloorWithDigit:(NSUInteger)digit;

@end
