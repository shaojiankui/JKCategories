//
//  NSDate+JKLunarCalendar.h
//  JKCategories-Demo
//
//  Created by runlin on 2017/10/24.
//  Copyright © 2017年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
///农历大写日期
@interface NSDate (JKLunarCalendar)
+ (NSCalendar *)jk_chineseCalendar;
//例如 五月初一
+ (NSString*)jk_currentMDDateString;
//例如 乙未年五月初一
+ (NSString*)jk_currentYMDDateString;
//例如 星期一
+ (NSString *)jk_currentWeek:(NSDate*)date;
//例如 星期一
+ (NSString *)jk_currentWeekWithDateString:(NSString*)datestring;
//例如 五月一
+ (NSString*)jk_currentCapitalDateString;
@end
