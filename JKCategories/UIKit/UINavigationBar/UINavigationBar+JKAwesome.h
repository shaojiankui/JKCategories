//
//  UINavigationBar+Awesome.h
//  LTNavigationBar
//
//  Created by ltebean on 15-2-15.
//  Copyright (c) 2015 ltebean. All rights reserved.
//  https://github.com/ltebean/LTNavigationBar

#import <UIKit/UIKit.h>

@interface UINavigationBar (JKAwesome)
- (void)jk_setBackgroundColor:(UIColor *)backgroundColor;
- (void)jk_setElementsAlpha:(CGFloat)alpha;
- (void)jk_setTranslationY:(CGFloat)translationY;
- (void)jk_reset;
@end