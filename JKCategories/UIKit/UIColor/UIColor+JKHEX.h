//
//  UIColor+HEX.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JKHEX)
+ (UIColor *)jk_colorWithHex:(UInt32)hex;
+ (UIColor *)jk_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)jk_colorWithHexString:(NSString *)hexString;
- (NSString *)jk_HEXString;
///值不需要除以255.0
+ (UIColor *)jk_colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
                         alpha:(CGFloat)alpha;
///值不需要除以255.0
+ (UIColor *)jk_colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue;
@end
