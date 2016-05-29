//
//  NSTimer+JKAddition.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (JKAddition)
/**
 *  @brief  暂停NSTimer
 */
- (void)jk_pauseTimer;
/**
 *  @brief  开始NSTimer
 */
- (void)jk_resumeTimer;
/**
 *  @brief  延迟开始NSTimer
 */
- (void)jk_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end
