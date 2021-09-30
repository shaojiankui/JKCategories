//
//  UIColor+Modify.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/2.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 HLS 模型
 
 Hue (色调)：取值为：0 - 360，0 (或 360) 表示红色，120 表示绿色，240 表示蓝色，也可取其他数值来指定颜色。
 Saturation (饱和度)：取值为：0.0% - 100.0%，它通常指颜色的鲜艳程度。
 Lightness (亮度)：取值为：0.0% - 100.0%，黑色的亮度为 0。
 */
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
