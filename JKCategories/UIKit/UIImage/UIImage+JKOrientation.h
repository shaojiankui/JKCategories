//
//  UIImage+JKOrientation.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/4.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JKOrientation)

/// 修正图片方向
/// @param srcImg 图片
+ (UIImage *)jk_fixOrientation:(UIImage *)srcImg;

/// 旋转图片
/// @param degrees 旋转角度
- (UIImage *)jk_imageRotatedByDegrees:(CGFloat)degrees;

/// 旋转图片
/// @param radians 旋转弧度
- (UIImage *)jk_imageRotatedByRadians:(CGFloat)radians;

/// 垂直翻转图片
- (UIImage *)jk_flipVertical;

/// 水平翻转图片
- (UIImage *)jk_flipHorizontal;

/// 便捷方法，角度转弧度
+ (CGFloat)jk_degreesToRadians:(CGFloat)degrees;

/// 便捷方法，弧度转角度
+ (CGFloat)jk_radiansToDegrees:(CGFloat)radians;

@end
