//
// NSDate+Reporting.h
//
// Created by Mel Sampat on 5/11/12.
// Copyright (c) 2012 Mel Sampat.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSDate (JKReporting)

// Return a date with a specified year, month and day.  00:00:00
+ (NSDate *)jk_dateWithYear:(int)year month:(int)month day:(int)day;

// Return midnight on the specified date.
+ (NSDate *)jk_midnightOfDate:(NSDate *)date;

// Return midnight today.
+ (NSDate *)jk_midnightToday;

// Return midnight tomorrow.
+ (NSDate *)jk_midnightTomorrow;

// Returns a date that is exactly 1 day after the specified date. Does *not*
// zero out the time components. For example, if the specified date is
// April 15 2012 10:00 AM, the return value will be April 16 2012 10:00 AM.
+ (NSDate *)jk_oneDayAfter:(NSDate *)date;

// Returns midnight of the first day of the current, previous or next Month.
// Note: firstDayOfNextMonth returns midnight of the first day of next month,
// which is effectively the same as the "last moment" of the current month.
+ (NSDate *)jk_firstDayOfCurrentMonth;
+ (NSDate *)jk_firstDayOfPreviousMonth;
+ (NSDate *)jk_firstDayOfNextMonth;

// Returns midnight of the first day of the current, previous or next Quarter.
// Note: firstDayOfNextQuarter returns midnight of the first day of next quarter,
// which is effectively the same as the "last moment" of the current quarter.
+ (NSDate *)jk_firstDayOfCurrentQuarter;
+ (NSDate *)jk_firstDayOfPreviousQuarter;
+ (NSDate *)jk_firstDayOfNextQuarter;

// Returns midnight of the first day of the current, previous or next Year.
// Note: firstDayOfNextYear returns midnight of the first day of next year,
// which is effectively the same as the "last moment" of the current year.
+ (NSDate *)jk_firstDayOfCurrentYear;
+ (NSDate *)jk_firstDayOfPreviousYear;
+ (NSDate *)jk_firstDayOfNextYear;


- (NSDate *)jk_dateFloor;
- (NSDate *)jk_dateCeil;

- (NSDate *)jk_startOfWeek;
- (NSDate *)jk_endOfWeek;

- (NSDate *)jk_startOfMonth;
- (NSDate *)jk_endOfMonth;

- (NSDate *)jk_startOfYear;
- (NSDate *)jk_endOfYear;

- (NSDate *)jk_previousDay;
- (NSDate *)jk_nextDay;

- (NSDate *)jk_previousWeek;
- (NSDate *)jk_nextWeek;

- (NSDate *)jk_previousMonth;
- (NSDate *)jk_previousMonth:(NSUInteger) monthsToMove;
- (NSDate *)jk_nextMonth;
- (NSDate *)jk_nextMonth:(NSUInteger) monthsToMove;

#ifdef DEBUG
// For testing only. A helper function to format and display a date
// with an optional comment. For example:
//     NSDate *test = [NSDate firstDayOfCurrentMonth];
//     [test logWithComment:@"First day of current month: "];
- (void)jk_logWithComment:(NSString *)comment;
#endif

@end
