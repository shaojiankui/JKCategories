//
//  UIImageView+GeometryConversion.h
//
//  Created by Dominique d'Argent on 18.04.12.
//  Copyright (c) 2012. All rights reserved.
//

/**
 Reference: <https://github.com/nubbel/UIImageView-GeometryConversion>
 将图像中的点（point）和尺寸（rect）转换为视图坐标点
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImageView (JKGeometryConversion)

- (CGPoint)jk_convertPointFromImage:(CGPoint)imagePoint;
- (CGRect)jk_convertRectFromImage:(CGRect)imageRect;

- (CGPoint)jk_convertPointFromView:(CGPoint)viewPoint;
- (CGRect)jk_convertRectFromView:(CGRect)viewRect;

@end
