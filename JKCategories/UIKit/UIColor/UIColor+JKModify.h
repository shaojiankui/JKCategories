//
//  UIColor+Modify.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/2.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JKModify)

- (UIColor *)jk_invertedColor;
- (UIColor *)jk_colorForTranslucency;
/// 降低亮度
- (UIColor * _Nullable)jk_lightenByPercentage:(CGFloat)percentage;
/// 提高亮度
- (UIColor * _Nullable)jk_darkenByPercentage:(CGFloat)percentage;
/// 降低饱和度
- (UIColor * _Nullable)jk_desaturateByPercentage:(CGFloat)percentage;
/// 提高饱和度
- (UIColor * _Nullable)jk_saturateByPercentage:(CGFloat)percentage;

@end

NS_ASSUME_NONNULL_END
