//
//  UIImage+ObtainRGBA.h
//  IOS-Categories
//
//  Created by KevinHM on 15/8/2.
//  Copyright (c) 2015年 KevinHM. All rights reserved.
//  Author: https://github.com/KevinHM

#import <UIKit/UIKit.h>

@interface UIImage (ObtainRGBA)

/*! 随意输入图片上的一个点,获取对应点pixel的颜色*/
- (UIColor *)obtainColorByPoint:(CGPoint)touchPoint;

@end
