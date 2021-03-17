//
//  NSDate+InternetDateTime.h
//  MWFeedParser
//
//  Created by Michael Waterfall on 07/10/2010.
//  Copyright 2010 Michael Waterfall. All rights reserved.
//

#import <Foundation/Foundation.h>

// 时间格式枚举类型
typedef enum {
    DateFormatHintNone, 
    DateFormatHintRFC822, 
    DateFormatHintRFC3339
} DateFormatHint;

/// 一个分析互联网日期和时间字符串的扩展
@interface NSDate (JKInternetDateTime)

// Get date from RFC3339 or RFC822 string
// - A format/specification hint can be used to speed up, 
//   otherwise both will be attempted in order to get a date
+ (NSDate *)jk_dateFromInternetDateTimeString:(NSString *)dateString
                                formatHint:(DateFormatHint)hint;

// Get date from a string using a specific date specification
+ (NSDate *)jk_dateFromRFC3339String:(NSString *)dateString;
+ (NSDate *)jk_dateFromRFC822String:(NSString *)dateString;

@end
