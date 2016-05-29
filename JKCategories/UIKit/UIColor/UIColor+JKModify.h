//
//  UIColor+Modify.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/2.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JKModify)
- (UIColor *)jk_invertedColor;
- (UIColor *)jk_colorForTranslucency;
- (UIColor *)jk_lightenColor:(CGFloat)lighten;
- (UIColor *)jk_darkenColor:(CGFloat)darken;
@end
