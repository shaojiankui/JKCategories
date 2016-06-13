//
//  UIView+Animation.h
//  CoolUIViewAnimations
//
//  Created by Peter de Tagyos on 12/10/11.
//  Copyright (c) 2011 PT Software Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

float jk_radiansForDegrees(int degrees);

@interface UIView (JKAnimation)

// Moves
- (void)jk_moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;
- (void)jk_moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option delegate:(id)delegate callback:(SEL)method;
- (void)jk_raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack;
- (void)jk_raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack delegate:(id)delegate callback:(SEL)method;

// Transforms
- (void)jk_rotate:(int)degrees secs:(float)secs delegate:(id)delegate callback:(SEL)method;
- (void)jk_scale:(float)secs x:(float)scaleX y:(float)scaleY delegate:(id)delegate callback:(SEL)method;
- (void)jk_spinClockwise:(float)secs;
- (void)jk_spinCounterClockwise:(float)secs;

// Transitions
- (void)jk_curlDown:(float)secs;
- (void)jk_curlUpAndAway:(float)secs;
- (void)jk_drainAway:(float)secs;

// Effects
- (void)jk_changeAlpha:(float)newAlpha secs:(float)secs;
- (void)jk_pulse:(float)secs continuously:(BOOL)continuously;

//add subview
- (void)jk_addSubviewWithFadeAnimation:(UIView *)subview;

@end
