//
//  NSDateFormatter+Make.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//  mobile.dzone.com/news/ios-threadsafe-date-formatting

#import <Foundation/Foundation.h>

@interface NSDateFormatter (JKMake)
+(NSDateFormatter *)jk_dateFormatterWithFormat:(NSString *)format;
+(NSDateFormatter *)jk_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone;
+(NSDateFormatter *)jk_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;
+(NSDateFormatter *)jk_dateFormatterWithDateStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)jk_dateFormatterWithDateStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;
+(NSDateFormatter *)jk_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)jk_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;
@end
