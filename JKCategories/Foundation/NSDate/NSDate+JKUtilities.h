//
//  NSDate+Utilities.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//
// https://github.com/erica/NSDate-Extensions
#import <Foundation/Foundation.h>
#define JK_D_MINUTE	60
#define JK_D_HOUR	3600
#define JK_D_DAY	86400
#define JK_D_WEEK	604800
#define JK_D_YEAR	31556926
@interface NSDate (JKUtilities)
+ (NSCalendar *)jk_currentCalendar; // avoid bottlenecks
#pragma mark ---- Decomposing dates 分解的日期
@property (readonly) NSInteger jk_nearestHour;
@property (readonly) NSInteger jk_hour;
@property (readonly) NSInteger jk_minute;
@property (readonly) NSInteger jk_seconds;
@property (readonly) NSInteger jk_day;
@property (readonly) NSInteger jk_month;
@property (readonly) NSInteger jk_week;
@property (readonly) NSInteger jk_weekday;
@property (readonly) NSInteger jk_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger jk_year;

#pragma mark ----short time 格式化的时间
@property (nonatomic, readonly) NSString *jk_shortString;
@property (nonatomic, readonly) NSString *jk_shortDateString;
@property (nonatomic, readonly) NSString *jk_shortTimeString;
@property (nonatomic, readonly) NSString *jk_mediumString;
@property (nonatomic, readonly) NSString *jk_mediumDateString;
@property (nonatomic, readonly) NSString *jk_mediumTimeString;
@property (nonatomic, readonly) NSString *jk_longString;
@property (nonatomic, readonly) NSString *jk_longDateString;
@property (nonatomic, readonly) NSString *jk_longTimeString;

///使用dateStyle timeStyle格式化时间
- (NSString *)jk_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
///给定format格式化时间
- (NSString *)jk_stringWithFormat:(NSString *)format;

#pragma mark ---- 从当前日期相对日期时间
///明天
+ (NSDate *)jk_dateTomorrow;
///昨天
+ (NSDate *)jk_dateYesterday;
///今天后几天
+ (NSDate *)jk_dateWithDaysFromNow:(NSInteger)days;
///今天前几天
+ (NSDate *)jk_dateWithDaysBeforeNow:(NSInteger)days;
///当前小时后dHours个小时
+ (NSDate *)jk_dateWithHoursFromNow:(NSInteger)dHours;
///当前小时前dHours个小时
+ (NSDate *)jk_dateWithHoursBeforeNow:(NSInteger)dHours;
///当前分钟后dMinutes个分钟
+ (NSDate *)jk_dateWithMinutesFromNow:(NSInteger)dMinutes;
///当前分钟前dMinutes个分钟
+ (NSDate *)jk_dateWithMinutesBeforeNow:(NSInteger)dMinutes;


#pragma mark ---- Comparing dates 比较时间
///比较年月日是否相等
- (BOOL)jk_isEqualToDateIgnoringTime:(NSDate *)aDate;
///是否是今天
- (BOOL)jk_isToday;
///是否是明天
- (BOOL)jk_isTomorrow;
///是否是昨天
- (BOOL)jk_isYesterday;

///是否是同一周
- (BOOL)jk_isSameWeekAsDate:(NSDate *)aDate;
///是否是本周
- (BOOL)jk_isThisWeek;
///是否是本周的下周
- (BOOL)jk_isNextWeek;
///是否是本周的上周
- (BOOL)jk_isLastWeek;

///是否是同一月
- (BOOL)jk_isSameMonthAsDate:(NSDate *)aDate;
///是否是本月
- (BOOL)jk_isThisMonth;
///是否是本月的下月
- (BOOL)jk_isNextMonth;
///是否是本月的上月
- (BOOL)jk_isLastMonth;

///是否是同一年
- (BOOL)jk_isSameYearAsDate:(NSDate *)aDate;
///是否是今年
- (BOOL)jk_isThisYear;
///是否是今年的下一年
- (BOOL)jk_isNextYear;
///是否是今年的上一年
- (BOOL)jk_isLastYear;

///是否提前aDate
- (BOOL)jk_isEarlierThanDate:(NSDate *)aDate;
///是否晚于aDate
- (BOOL)jk_isLaterThanDate:(NSDate *)aDate;
///是否晚是未来
- (BOOL)jk_isInFuture;
///是否晚是过去
- (BOOL)jk_isInPast;


///是否是工作日
- (BOOL)jk_isTypicallyWorkday;
///是否是周末
- (BOOL)jk_isTypicallyWeekend;

#pragma mark ---- Adjusting dates 调节时间
///增加dYears年
- (NSDate *)jk_dateByAddingYears:(NSInteger)dYears;
///减少dYears年
- (NSDate *)jk_dateBySubtractingYears:(NSInteger)dYears;
///增加dMonths月
- (NSDate *)jk_dateByAddingMonths:(NSInteger)dMonths;
///减少dMonths月
- (NSDate *)jk_dateBySubtractingMonths:(NSInteger)dMonths;
///增加dDays天
- (NSDate *)jk_dateByAddingDays:(NSInteger)dDays;
///减少dDays天
- (NSDate *)jk_dateBySubtractingDays:(NSInteger)dDays;
///增加dHours小时
- (NSDate *)jk_dateByAddingHours:(NSInteger)dHours;
///减少dHours小时
- (NSDate *)jk_dateBySubtractingHours:(NSInteger)dHours;
///增加dMinutes分钟
- (NSDate *)jk_dateByAddingMinutes:(NSInteger)dMinutes;
///减少dMinutes分钟
- (NSDate *)jk_dateBySubtractingMinutes:(NSInteger)dMinutes;


#pragma mark ---- 时间间隔
///比aDate晚多少分钟
- (NSInteger)jk_minutesAfterDate:(NSDate *)aDate;
///比aDate早多少分钟
- (NSInteger)jk_minutesBeforeDate:(NSDate *)aDate;
///比aDate晚多少小时
- (NSInteger)jk_hoursAfterDate:(NSDate *)aDate;
///比aDate早多少小时
- (NSInteger)jk_hoursBeforeDate:(NSDate *)aDate;
///比aDate晚多少天
- (NSInteger)jk_daysAfterDate:(NSDate *)aDate;
///比aDate早多少天
- (NSInteger)jk_daysBeforeDate:(NSDate *)aDate;

///与anotherDate间隔几天
- (NSInteger)jk_distanceDaysToDate:(NSDate *)anotherDate;
///与anotherDate间隔几月
- (NSInteger)jk_distanceMonthsToDate:(NSDate *)anotherDate;
///与anotherDate间隔几年
- (NSInteger)jk_distanceYearsToDate:(NSDate *)anotherDate;
@end
