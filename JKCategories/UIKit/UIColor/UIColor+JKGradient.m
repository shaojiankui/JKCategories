//
//  UIColor+Gradient.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIColor+JKGradient.h"

@implementation UIColor (JKGradient)

+ (UIColor *)jk_colorWithGradientStyle:(UIGradientColorStyle)gradientStyle
                             withFrame:(CGRect)frame
                             andColors:(NSArray *)colors
{
    if (colors.count == 0) {
        return nil;
    }
    
    // 创建一个渐变图层 CAGradientLayer
    // CAGradientLayer 是 CALayer 的子类，专门用于创建渐变图层，而且绘制时使用硬件加速！
    CAGradientLayer *backgroundGradientLayer = [CAGradientLayer layer];
    backgroundGradientLayer.frame = frame;
    
    // 转换颜色数组对象，UIColor -> CGColor
    // CAGradientLayer 接受的是 CGColorRef 类型的值，因此需要通过 __bridge 桥接
    NSMutableArray *cgColors = [NSMutableArray arrayWithCapacity:colors.count];
    [colors enumerateObjectsUsingBlock:^(UIColor *color, NSUInteger idx, BOOL * _Nonnull stop) {
        [cgColors addObject:(__bridge id)[color CGColor]];
    }];
    
    switch (gradientStyle) {
        case UIGradientColorStyleLeftToRight: {
            // 设置渐变数组
            backgroundGradientLayer.colors = cgColors;
            
            // 渐变的 startPoint 和 endPoint 属性决定了渐变的方向
            backgroundGradientLayer.startPoint = CGPointMake(0.0, 0.5);
            backgroundGradientLayer.endPoint = CGPointMake(1.0, 0.5);
            
            // 将 CALayer 对象转化为 UIImage 对象
            UIGraphicsBeginImageContextWithOptions(backgroundGradientLayer.bounds.size, NO, [UIScreen mainScreen].scale);
            [backgroundGradientLayer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            return [UIColor colorWithPatternImage:backgroundColorImage];
        }
        case UIGradientColorStyleRadial: {
            UIGraphicsBeginImageContextWithOptions(frame.size, NO, [UIScreen mainScreen].scale);
            
            // 渐变色的空间分布（目前这个渐变只取 2 个位置）
            CGFloat locations[2] = {0.0, 1.0};
            
            // 默认的 RGB 色彩空间
            CGColorSpaceRef colorspaceRef = CGColorSpaceCreateDeviceRGB();
            CFArrayRef arrayRef = (__bridge CFArrayRef)cgColors;
            
            // 渐变属性：颜色空间、颜色、位置、有效数量
            // CGGradientCreateWithColorComponents: 创建包含渐变的 CGGradientRef 对象
            CGGradientRef gradientRef = CGGradientCreateWithColors(colorspaceRef, arrayRef, locations);
            
            // 将 0-1 范围的输入归一化为图像的宽度
            CGPoint centrePoint = CGPointMake(0.5 * frame.size.width, 0.5 * frame.size.height);
            float radius = MIN(frame.size.width, frame.size.height) * 1.0;
            
            // 绘制辐射渐变色
            CGContextDrawRadialGradient(UIGraphicsGetCurrentContext(), gradientRef, centrePoint, 0, centrePoint, radius, kCGGradientDrawsAfterEndLocation);
            
            UIImage *backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext();
            
            // 清理
            CGColorSpaceRelease(colorspaceRef);
            CGGradientRelease(gradientRef);
            UIGraphicsEndImageContext();
            
            return [UIColor colorWithPatternImage:backgroundColorImage];
        }
        case UIGradientColorStyleTopToBottom: {
            backgroundGradientLayer.colors = cgColors;
            
            // 将 CALayer 对象转化为 UIImage 对象
            UIGraphicsBeginImageContextWithOptions(backgroundGradientLayer.bounds.size, NO, [UIScreen mainScreen].scale);
            [backgroundGradientLayer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            return [UIColor colorWithPatternImage:backgroundColorImage];
        }
    }
}

@end
