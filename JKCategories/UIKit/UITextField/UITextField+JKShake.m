//
//  UITextField+Shake.m
//  UITextField+Shake
//
//  Created by Andrea Mazzini on 08/02/14.
//  Copyright (c) 2014 Fancy Pixel. All rights reserved.
//

#import "UITextField+JKShake.h"

@implementation UITextField (JKShake)

- (void)jk_shake {
    [self jk_shake:10 withDelta:5 completion:nil];
}

- (void)jk_shake:(int)times withDelta:(CGFloat)delta {
    [self jk_shake:times withDelta:delta completion:nil];
}

- (void)jk_shake:(int)times withDelta:(CGFloat)delta completion:(void(^)())handler {
    [self _jk_shake:times direction:1 currentTimes:0 withDelta:delta speed:0.03 shakeDirection:JKShakedDirectionHorizontal completion:handler];
}

- (void)jk_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval {
    [self jk_shake:times withDelta:delta speed:interval completion:nil];
}

- (void)jk_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(void(^)())handler {
    [self _jk_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:JKShakedDirectionHorizontal completion:handler];
}

- (void)jk_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(JKShakedDirection)shakeDirection {
    [self jk_shake:times withDelta:delta speed:interval shakeDirection:shakeDirection completion:nil];
}

- (void)jk_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(JKShakedDirection)shakeDirection completion:(void(^)())handler {
    [self _jk_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:shakeDirection completion:handler];
}

- (void)_jk_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(JKShakedDirection)shakeDirection completion:(void(^)())handler {
    [UIView animateWithDuration:interval animations:^{
        self.transform = (shakeDirection == JKShakedDirectionHorizontal) ? CGAffineTransformMakeTranslation(delta * direction, 0) : CGAffineTransformMakeTranslation(0, delta * direction);
    } completion:^(BOOL finished) {
        if(current >= times) {
            [UIView animateWithDuration:interval animations:^{
                self.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                if (handler) {
                    handler();
                }
            }];
            return;
        }
        [self _jk_shake:(times - 1)
           direction:direction * -1
        currentTimes:current + 1
           withDelta:delta
               speed:interval
      shakeDirection:shakeDirection
          completion:handler];
    }];
}

@end
