//
//  CAMediaTimingFunction+AdditionalEquations.h
//
//  Created by Heiko Dreyer on 02.04.12.
//  Copyright (c) 2012 boxedfolder.com. All rights reserved.
//  https://github.com/bfolder/UIView-Visuals

#import <QuartzCore/QuartzCore.h>

@interface CAMediaTimingFunction (JKAdditionalEquations)


///---------------------------------------------------------------------------------------
/// @name Circ Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)jk_easeInCirc;
+(CAMediaTimingFunction *)jk_easeOutCirc;
+(CAMediaTimingFunction *)jk_easeInOutCirc;

///---------------------------------------------------------------------------------------
/// @name Cubic Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)jk_easeInCubic;
+(CAMediaTimingFunction *)jk_easeOutCubic;
+(CAMediaTimingFunction *)jk_easeInOutCubic;

///---------------------------------------------------------------------------------------
/// @name Expo Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)jk_easeInExpo;
+(CAMediaTimingFunction *)jk_easeOutExpo;
+(CAMediaTimingFunction *)jk_easeInOutExpo;

///---------------------------------------------------------------------------------------
/// @name Quad Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)jk_easeInQuad;
+(CAMediaTimingFunction *)jk_easeOutQuad;
+(CAMediaTimingFunction *)jk_easeInOutQuad;

///---------------------------------------------------------------------------------------
/// @name Quart Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)jk_easeInQuart;
+(CAMediaTimingFunction *)jk_easeOutQuart;
+(CAMediaTimingFunction *)jk_easeInOutQuart;

///---------------------------------------------------------------------------------------
/// @name Quint Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)jk_easeInQuint;
+(CAMediaTimingFunction *)jk_easeOutQuint;
+(CAMediaTimingFunction *)jk_easeInOutQuint;

///---------------------------------------------------------------------------------------
/// @name Sine Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)jk_easeInSine;
+(CAMediaTimingFunction *)jk_easeOutSine;
+(CAMediaTimingFunction *)jk_easeInOutSine;

///---------------------------------------------------------------------------------------
/// @name Back Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)jk_easeInBack;
+(CAMediaTimingFunction *)jk_easeOutBack;
+(CAMediaTimingFunction *)jk_easeInOutBack;

@end
