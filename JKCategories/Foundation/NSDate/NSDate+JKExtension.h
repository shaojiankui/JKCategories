//
//  NSDate+Extension.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JKExtension)


/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)jk_day;
- (NSUInteger)jk_month;
- (NSUInteger)jk_year;
- (NSUInteger)jk_hour;
- (NSUInteger)jk_minute;
- (NSUInteger)jk_second;
+ (NSUInteger)jk_day:(NSDate *)date;
+ (NSUInteger)jk_month:(NSDate *)date;
+ (NSUInteger)jk_year:(NSDate *)date;
+ (NSUInteger)jk_hour:(NSDate *)date;
+ (NSUInteger)jk_minute:(NSDate *)date;
+ (NSUInteger)jk_second:(NSDate *)date;

/**
 * 获取一年中的总天数
 */
- (NSUInteger)jk_daysInYear;
+ (NSUInteger)jk_daysInYear:(NSDate *)date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)jk_isLeapYear;
+ (BOOL)jk_isLeapYear:(NSDate *)date;

/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)jk_weekOfYear;
+ (NSUInteger)jk_weekOfYear:(NSDate *)date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)jk_formatYMD;
+ (NSString *)jk_formatYMD:(NSDate *)date;

/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)jk_weeksOfMonth;
+ (NSUInteger)jk_weeksOfMonth:(NSDate *)date;

/**
 * 获取该月的第一天的日期
 */
- (NSDate *)jk_begindayOfMonth;
+ (NSDate *)jk_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)jk_lastdayOfMonth;
+ (NSDate *)jk_lastdayOfMonth:(NSDate *)date;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)jk_dateAfterDay:(NSUInteger)day;
+ (NSDate *)jk_dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)jk_dateAfterMonth:(NSUInteger)month;
+ (NSDate *)jk_dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)jk_offsetYears:(int)numYears;
+ (NSDate *)jk_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)jk_offsetMonths:(int)numMonths;
+ (NSDate *)jk_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)jk_offsetDays:(int)numDays;
+ (NSDate *)jk_offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)jk_offsetHours:(int)hours;
+ (NSDate *)jk_offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/**
 * 距离该日期前几天
 */
- (NSUInteger)jk_daysAgo;
+ (NSUInteger)jk_daysAgo:(NSDate *)date;

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)jk_weekday;
+ (NSInteger)jk_weekday:(NSDate *)date;

/**
 *  获取星期几(名称)
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString *)jk_dayFromWeekday;
+ (NSString *)jk_dayFromWeekday:(NSDate *)date;

/**
 *  日期是否相等
 *
 *  @param anotherDate The another date to compare as NSDate
 *  @return Return YES if is same day, NO if not
 */
- (BOOL)jk_isSameDay:(NSDate *)anotherDate;

/**
 *  是否是今天
 *
 *  @return Return if self is today
 */
- (BOOL)jk_isToday;

 

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)jk_monthWithMonthNumber:(NSInteger)month;

/**
 * 根据日期返回字符串
 */
+ (NSString *)jk_stringWithDate:(NSDate *)date format:(NSString *)format;
- (NSString *)jk_stringWithFormat:(NSString *)format;
+ (NSDate *)jk_dateWithString:(NSString *)string format:(NSString *)format;

/**
 * 获取指定月份的天数
 */
- (NSUInteger)jk_daysInMonth:(NSUInteger)month;
+ (NSUInteger)jk_daysInMonth:(NSDate *)date month:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)jk_daysInMonth;
+ (NSUInteger)jk_daysInMonth:(NSDate *)date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)jk_timeInfo;
+ (NSString *)jk_timeInfoWithDate:(NSDate *)date;
+ (NSString *)jk_timeInfoWithDateString:(NSString *)dateString;

/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)jk_ymdFormat;
- (NSString *)jk_hmsFormat;
- (NSString *)jk_ymdHmsFormat;
+ (NSString *)jk_ymdFormat;
+ (NSString *)jk_hmsFormat;
+ (NSString *)jk_ymdHmsFormat;


@end
