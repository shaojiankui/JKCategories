//
//  UIImage+Merge.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JKMerge)

/// 使用 CoreGraphics 框架合成图片。
/// Tips: 具体使用还是需要根据场景自定义，需要根据需求定义图片绘制的尺寸和位置、图片翻转、图片混合模式等参数。
/// 
/// @param backImage 背景图片
/// @param frontImage 前景图片
+ (UIImage *)jk_mergeImage:(UIImage *)backImage frontImage:(UIImage *)frontImage;

@end
