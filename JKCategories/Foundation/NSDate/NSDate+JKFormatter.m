//
//  NSDate+Formatter.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSDate+JKFormatter.h"

@implementation NSDate (JKFormatter)
+(NSDateFormatter *)jk_formatter {
    
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [formatter setDoesRelativeDateFormatting:YES];
    });
    
    return formatter;
}

+(NSDateFormatter *)jk_formatterWithoutTime {
    
    static NSDateFormatter *formatterWithoutTime = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        formatterWithoutTime = [[NSDate jk_formatter] copy];
        [formatterWithoutTime setTimeStyle:NSDateFormatterNoStyle];
    });
    
    return formatterWithoutTime;
}

+(NSDateFormatter *)jk_formatterWithoutDate {
    
    static NSDateFormatter *formatterWithoutDate = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        formatterWithoutDate = [[NSDate jk_formatter] copy];
        [formatterWithoutDate setDateStyle:NSDateFormatterNoStyle];
    });
    
    return formatterWithoutDate;
}

#pragma mark -
#pragma mark Formatter with date & time
-(NSString *)jk_formatWithUTCTimeZone {
    return [self jk_formatWithTimeZoneOffset:0];
}

-(NSString *)jk_formatWithLocalTimeZone {
    return [self jk_formatWithTimeZone:[NSTimeZone localTimeZone]];
}

-(NSString *)jk_formatWithTimeZoneOffset:(NSTimeInterval)offset {
    return [self jk_formatWithTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:offset]];
}

-(NSString *)jk_formatWithTimeZone:(NSTimeZone *)timezone {
    NSDateFormatter *formatter = [NSDate jk_formatter];
    [formatter setTimeZone:timezone];
    return [formatter stringFromDate:self];
}

#pragma mark -
#pragma mark Formatter without time
-(NSString *)jk_formatWithUTCTimeZoneWithoutTime {
    return [self jk_formatWithTimeZoneOffsetWithoutTime:0];
}

-(NSString *)jk_formatWithLocalTimeZoneWithoutTime {
    return [self jk_formatWithTimeZoneWithoutTime:[NSTimeZone localTimeZone]];
}

-(NSString *)jk_formatWithTimeZoneOffsetWithoutTime:(NSTimeInterval)offset {
    return [self jk_formatWithTimeZoneWithoutTime:[NSTimeZone timeZoneForSecondsFromGMT:offset]];
}

-(NSString *)jk_formatWithTimeZoneWithoutTime:(NSTimeZone *)timezone {
    NSDateFormatter *formatter = [NSDate jk_formatterWithoutTime];
    [formatter setTimeZone:timezone];
    return [formatter stringFromDate:self];
}

#pragma mark -
#pragma mark Formatter without date
-(NSString *)jk_formatWithUTCWithoutDate {
    return [self jk_formatTimeWithTimeZone:0];
}
-(NSString *)jk_formatWithLocalTimeWithoutDate {
    return [self jk_formatTimeWithTimeZone:[NSTimeZone localTimeZone]];
}

-(NSString *)jk_formatWithTimeZoneOffsetWithoutDate:(NSTimeInterval)offset {
    return [self jk_formatTimeWithTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:offset]];
}

-(NSString *)jk_formatTimeWithTimeZone:(NSTimeZone *)timezone {
    NSDateFormatter *formatter = [NSDate jk_formatterWithoutDate];
    [formatter setTimeZone:timezone];
    return [formatter stringFromDate:self];
}
#pragma mark -
#pragma mark Formatter  date
+ (NSString *)jk_currentDateStringWithFormat:(NSString *)format
{
    NSDate *chosenDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *date = [formatter stringFromDate:chosenDate];
    return date;
}
+ (NSDate *)jk_dateWithSecondsFromNow:(NSInteger)seconds {
    NSDate *date = [NSDate date];
    NSDateComponents *components = [NSDateComponents new];
    [components setSecond:seconds];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *dateSecondsAgo = [calendar dateByAddingComponents:components toDate:date options:0];
    return dateSecondsAgo;
}


- (NSString *)jk_dateWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *date = [formatter stringFromDate:self];
    return date;
}
@end
