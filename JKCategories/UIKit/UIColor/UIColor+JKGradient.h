//
//  UIColor+Gradient.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 定义渐变的样式和方向
typedef NS_ENUM(NSUInteger, UIGradientColorStyle) {
    UIGradientColorStyleLeftToRight, // 从左到右渐变
    UIGradientColorStyleRadial,      // 从中心向四周扩散渐变，支持最多2种颜色
    UIGradientColorStyleTopToBottom  // 从上到下渐变
};

@interface UIColor (JKGradient)

/// 创建并返回一个 alpha 值为 1.0 的渐变颜色
/// Reference: <https://github.com/vicc/chameleon/UIColor+Chameleon.h>
///
/// @param gradientStyle 渐变色样式
/// @param frame 矩形区域
/// @param colors 包含 UIColor 对象的数组
+ (UIColor *)jk_colorWithGradientStyle:(UIGradientColorStyle)gradientStyle
                             withFrame:(CGRect)frame
                             andColors:(NSArray *)colors;

@end
