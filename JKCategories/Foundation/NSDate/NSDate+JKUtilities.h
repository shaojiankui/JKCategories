//
//  NSDate+Utilities.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#define D_MINUTE	60
#define D_HOUR	3600
#define D_DAY	86400
#define D_WEEK	604800
#define D_YEAR	31556926
@interface NSDate (JKUtilities)

+ (NSCalendar *)jk_currentCalendar; // avoid bottlenecks

// Relative dates from the current date
+ (NSDate *)jk_dateTomorrow;
+ (NSDate *)jk_dateYesterday;
+ (NSDate *)jk_dateWithDaysFromNow: (NSInteger) days;
+ (NSDate *)jk_dateWithDaysBeforeNow: (NSInteger) days;
+ (NSDate *)jk_dateWithHoursFromNow: (NSInteger) dHours;
+ (NSDate *)jk_dateWithHoursBeforeNow: (NSInteger) dHours;
+ (NSDate *)jk_dateWithMinutesFromNow: (NSInteger) dMinutes;
+ (NSDate *)jk_dateWithMinutesBeforeNow: (NSInteger) dMinutes;

// Short string utilities
- (NSString *)jk_stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle;
- (NSString *)jk_stringWithFormat: (NSString *) format;

@property (nonatomic, readonly) NSString *jk_shortString;
@property (nonatomic, readonly) NSString *jk_shortDateString;
@property (nonatomic, readonly) NSString *jk_shortTimeString;
@property (nonatomic, readonly) NSString *jk_mediumString;
@property (nonatomic, readonly) NSString *jk_mediumDateString;
@property (nonatomic, readonly) NSString *jk_mediumTimeString;
@property (nonatomic, readonly) NSString *jk_longString;
@property (nonatomic, readonly) NSString *jk_longDateString;
@property (nonatomic, readonly) NSString *jk_longTimeString;



// Comparing dates
- (BOOL)jk_isEqualToDateIgnoringTime: (NSDate *) aDate;

- (BOOL)jk_isToday;
- (BOOL)jk_isTomorrow;
- (BOOL)jk_isYesterday;

- (BOOL)jk_isSameWeekAsDate: (NSDate *) aDate;
- (BOOL)jk_isThisWeek;
- (BOOL)jk_isNextWeek;
- (BOOL)jk_isLastWeek;

- (BOOL)jk_isSameMonthAsDate: (NSDate *) aDate;
- (BOOL)jk_isThisMonth;
- (BOOL)jk_isNextMonth;
- (BOOL)jk_isLastMonth;

- (BOOL)jk_isSameYearAsDate: (NSDate *) aDate;
- (BOOL)jk_isThisYear;
- (BOOL)jk_isNextYear;
- (BOOL)jk_isLastYear;

- (BOOL)jk_isEarlierThanDate: (NSDate *) aDate;
- (BOOL)jk_isLaterThanDate: (NSDate *) aDate;

- (BOOL)jk_isInFuture;
- (BOOL)jk_isInPast;

// Date roles
- (BOOL)jk_isTypicallyWorkday;
- (BOOL)jk_isTypicallyWeekend;

// Adjusting dates
- (NSDate *) jk_dateByAddingYears: (NSInteger) dYears;
- (NSDate *) jk_dateBySubtractingYears: (NSInteger) dYears;
- (NSDate *) jk_dateByAddingMonths: (NSInteger) dMonths;
- (NSDate *) jk_dateBySubtractingMonths: (NSInteger) dMonths;
- (NSDate *) jk_dateByAddingDays: (NSInteger) dDays;
- (NSDate *) jk_dateBySubtractingDays: (NSInteger) dDays;
- (NSDate *) jk_dateByAddingHours: (NSInteger) dHours;
- (NSDate *) jk_dateBySubtractingHours: (NSInteger) dHours;
- (NSDate *) jk_dateByAddingMinutes: (NSInteger) dMinutes;
- (NSDate *) jk_dateBySubtractingMinutes: (NSInteger) dMinutes;

// Date extremes
- (NSDate *) jk_dateAtStartOfDay;
- (NSDate *) jk_dateAtEndOfDay;

// Retrieving intervals
- (NSInteger) jk_minutesAfterDate: (NSDate *) aDate;
- (NSInteger) jk_minutesBeforeDate: (NSDate *) aDate;
- (NSInteger) jk_hoursAfterDate: (NSDate *) aDate;
- (NSInteger) jk_hoursBeforeDate: (NSDate *) aDate;
- (NSInteger) jk_daysAfterDate: (NSDate *) aDate;
- (NSInteger) jk_daysBeforeDate: (NSDate *) aDate;
- (NSInteger) jk_distanceInDaysToDate:(NSDate *)anotherDate;

// Decomposing dates
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
@end