//
//  UILabel+AutomaticWriting.h
//  UILabel-AutomaticWriting
//
//  Created by alexruperez on 10/3/15.
//  Copyright (c) 2015 alexruperez. All rights reserved.
//  https://github.com/alexruperez/UILabel-AutomaticWriting

#import <UIKit/UIKit.h>

//! Project version number for UILabel-AutomaticWriting.
FOUNDATION_EXPORT double UILabelAutomaticWritingVersionNumber;

//! Project version string for UILabel-AutomaticWriting.
FOUNDATION_EXPORT const unsigned char UILabelAutomaticWritingVersionString[];

extern NSTimeInterval const UILabelAWDefaultDuration;

extern unichar const UILabelAWDefaultCharacter;

typedef NS_ENUM(NSInteger, UILabelJKlinkingMode)
{
    UILabelJKlinkingModeNone,
    UILabelJKlinkingModeUntilFinish,
    UILabelJKlinkingModeUntilFinishKeeping,
    UILabelJKlinkingModeWhenFinish,
    UILabelJKlinkingModeWhenFinishShowing,
    UILabelJKlinkingModeAlways
};

@interface UILabel (JKAutomaticWriting)

@property (strong, nonatomic) NSOperationQueue *jk_automaticWritingOperationQueue;
@property (assign, nonatomic) UIEdgeInsets jk_edgeInsets;

- (void)jk_setTextWithAutomaticWritingAnimation:(NSString *)text;

- (void)jk_setText:(NSString *)text automaticWritingAnimationWithBlinkingMode:(UILabelJKlinkingMode)blinkingMode;

- (void)jk_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration;

- (void)jk_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelJKlinkingMode)blinkingMode;

- (void)jk_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelJKlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter;

- (void)jk_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelJKlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter completion:(void (^)(void))completion;

@end