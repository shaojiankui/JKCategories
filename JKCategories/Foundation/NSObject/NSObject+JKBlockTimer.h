//
//  NSObject+MKBlockTimer.h
//  MKBlockTimerDemo
//
//  Created by Mugunth Kumar (@mugunthkumar) on 4/4/13
//  Copyright (C) 2011-2020 by Steinlogic Consulting And Training Pte Ltd.
//

/**
 Reference:<http://stackoverflow.com/questions/741830/getting-the-time-elapsed-objective-c>
 */
#import <Foundation/Foundation.h>

@interface NSObject (JKBlockTimer)
-(void)jk_logTimeTakenToRunBlock:(void (^)(void)) block withPrefix:(NSString*) prefixString;
@end
