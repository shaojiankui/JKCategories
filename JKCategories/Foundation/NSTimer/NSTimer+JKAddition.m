//
//  NSTimer+JKAddition.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSTimer+JKAddition.h"

@implementation NSTimer (JKAddition)

- (void)jk_resumeTimer {
    if (![self isValid]) { return; }
    
    [self setFireDate:[NSDate date]];
}

- (void)jk_pauseTimer {
    if (![self isValid]) { return; }
    
    [self setFireDate:[NSDate distantFuture]];
}

- (void)jk_resumeTimerAfterTimeInterval:(NSTimeInterval)interval {
    if (![self isValid]) { return; }
    
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
