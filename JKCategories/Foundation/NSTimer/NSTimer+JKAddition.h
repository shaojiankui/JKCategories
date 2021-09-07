//
//  NSTimer+JKAddition.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (JKAddition)

/// 开始 NSTimer
- (void)jk_resumeTimer;

/// 暂停 NSTimer
- (void)jk_pauseTimer;

/// 延迟开始 NSTimer
- (void)jk_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
