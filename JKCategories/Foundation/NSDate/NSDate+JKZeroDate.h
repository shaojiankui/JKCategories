//
//  NSDate+JKZeroDate.h
//  Jakey
//
//  Created by Jakey on 15/5/9.
//  Copyright (c) 2015年 Jakey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JKZeroDate)
+ (NSDate *)jk_zeroTodayDate;
+ (NSDate *)jk_zero24TodayDate;

- (NSDate *)jk_zeroDate;
- (NSDate *)jk_zero24Date;
@end
