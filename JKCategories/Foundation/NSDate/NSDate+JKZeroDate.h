//
//  NSDate+JKZeroDate.h
//  Jakey
//
//  Created by Jakey on 15/5/9.
//  Copyright (c) 2015年 Jakey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JKZeroDate)
/// 时间设置为000000
+ (NSDate *)jk_zeroTodayDate;
/// 时间设置为235900
+ (NSDate *)jk_zero24TodayDate;

/// 时间设置为0000
- (NSDate *)jk_zeroDate;
/// 时间设置为235900
- (NSDate *)jk_zero24Date;
@end
