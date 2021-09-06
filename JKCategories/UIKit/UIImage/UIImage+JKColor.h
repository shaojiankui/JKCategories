//
//  UIImage+Color.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JKColor)

/// 根据颜色生成纯色图片
+ (UIImage *)jk_imageWithColor:(UIColor *)color;

/// 取图片某一点的颜色
- (UIColor *)jk_colorAtPoint:(CGPoint )point;

/// 取某一像素的颜色
- (UIColor *)jk_colorAtPixel:(CGPoint)point;

/// 获得灰度图
+ (UIImage *)jk_covertToGrayImageFromImage:(UIImage*)sourceImage;

/// 渲染图片，添加一层指定的遮罩颜色
- (UIImage *)jk_imageMaskedWithColor:(UIColor *)maskColor;

@end
