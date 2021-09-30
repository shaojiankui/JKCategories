//
//  UIColor+JKDarkMode.h
//  JKCategories
//
//  Created by Qilin Hu on 2021/9/6.
//  Copyright © 2020 Qilin Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JKDarkMode)

+ (UIColor *)jk_colorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;

+ (UIColor *)jk_systemRedColor;
+ (UIColor *)jk_systemGreenColor;
+ (UIColor *)jk_systemBlueColor;
+ (UIColor *)jk_systemOrangeColor;
+ (UIColor *)jk_systemYelloColor;
+ (UIColor *)jk_systemPurpleColor;
+ (UIColor *)jk_systemGrayColor;

+ (UIColor *)jk_systemBackgroundColor;

@end

NS_ASSUME_NONNULL_END
