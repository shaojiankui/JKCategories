//
//  CATransaction+AnimateWithDuration.m
//  ShapesExample
//
//  Created by Denys Telezhkin on 20.09.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "CATransaction+JKAnimateWithDuration.h"

@implementation CATransaction (JKAnimateWithDuration)

+ (void)jk_animateWithDuration:(NSTimeInterval)duration
                   animations:(void (^)(void))animations
                   completion:(void (^)(void))completion
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:duration];
    
    if (completion) {
        [CATransaction setCompletionBlock:completion];
    }
    
    if (animations) {
        animations();
    }
    
    [CATransaction commit];
}

@end
