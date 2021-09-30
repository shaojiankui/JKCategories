//
//  NSTimer+JKBlocks.h
//
//  Created by Jiva DeVoe on 1/14/11.
//  Copyright 2011 Random Ideas, LLC. All rights reserved.
//
// Copyright (C) 2011 by Random Ideas, LLC
//

/**
 Reference: <https://github.com/jivadevoe/NSTimer-Blocks>
 */
#import <Foundation/Foundation.h>

@interface NSTimer (JKBlocks)
+(id)jk_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats;
+(id)jk_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats;
@end
