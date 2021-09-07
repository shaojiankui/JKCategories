//
//  NSObject+MKBlockTimer.h
//  MKBlockTimerDemo
//
//  Created by Mugunth Kumar (@mugunthkumar) on 4/4/13
//  Copyright (C) 2011-2020 by Steinlogic Consulting And Training Pte Ltd.
//

#import "NSObject+JKBlockTimer.h"


@implementation NSObject (JKBlockTimer)

-(void)jk_logTimeTakenToRunBlock:(void (^)(void)) block withPrefix:(NSString*) prefixString {
	
	double a = CFAbsoluteTimeGetCurrent();
	block();
	double b = CFAbsoluteTimeGetCurrent();
	
	unsigned int m = ((b-a) * 1000.0f); // convert from seconds to milliseconds
	
	NSLog(@"%@: %d ms", prefixString ? prefixString : @"Time taken", m);
}
@end
