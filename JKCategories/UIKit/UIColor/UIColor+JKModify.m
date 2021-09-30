//
//  UIColor+Modify.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/2.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIColor+JKModify.h"

@implementation UIColor (JKModify)

- (UIColor *)jk_invertedColor{
    NSArray *components = [self jk_componentArray];
    return [UIColor colorWithRed:1-[components[0] doubleValue] green:1-[components[1] doubleValue] blue:1-[components[2] doubleValue] alpha:[components[3] doubleValue]];
}

- (UIColor *)jk_colorForTranslucency {
    CGFloat hue = 0, saturation = 0, brightness = 0, alpha = 0;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    return [UIColor colorWithHue:hue saturation:saturation*1.158 brightness:brightness*0.95 alpha:alpha];
}

- (UIColor *)jk_lightenByPercentage:(CGFloat)percentage {
    
    // 定义 HSBA 值
    CGFloat h, s, b, a;
    
    // 检查 HSBA 值是否存在
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a]) {
        // 确保百分比 > 0
        if (percentage > 0) {
            b = MIN(b + percentage, 1.0);
        }
        
        // 返回较浅的颜色
        return [UIColor colorWithHue:h saturation:s brightness:b alpha:a];
    }
    
    return nil;
}

- (UIColor *)jk_darkenByPercentage:(CGFloat)percentage {
    
    // 定义 HSBA 值
    CGFloat h, s, b, a;
    
    // 检查 HSBA 值是否存在
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a]) {
        // 确保百分比 > 0
        if (percentage > 0) {
            b = MIN(b - percentage, 1.0);
        }
        
        // 返回较深的颜色
        return [UIColor colorWithHue:h saturation:s brightness:b alpha:a];
    }
    
    return nil;
}

- (UIColor * _Nullable)jk_desaturateByPercentage:(CGFloat)percentage {
    
    // 定义 HSBA 值
    CGFloat h, s, b, a;
    
    // 检查 HSBA 值是否存在
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a]) {
        
        // 确保百分比 > 0
        if (percentage > 0) {
            s = MIN(s - percentage, 1.0);
        }
        
        // 返回较浅的颜色
        return [UIColor colorWithHue:h saturation:s brightness:b alpha:a];
    }
    
    return nil;
}

- (UIColor * _Nullable)jk_saturateByPercentage:(CGFloat)percentage {
    
    // 定义 HSBA 值
    CGFloat h, s, b, a;
    
    // 检查 HSBA 值是否存在
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a]) {
        
        // 确保百分比 > 0
        if (percentage > 0) {
           s = MIN(s + percentage, 1.0);
        }
        
        // 返回较深的颜色
        return [UIColor colorWithHue:h saturation:s brightness:b alpha:a];
    }
    
    return nil;
}

- (NSArray *)jk_componentArray {
    CGFloat red, green, blue, alpha;
    const CGFloat *components = CGColorGetComponents([self CGColor]);
    if(CGColorGetNumberOfComponents([self CGColor]) == 2){
        red = components[0];
        green = components[0];
        blue = components[0];
        alpha = components[1];
    }else{
        red = components[0];
        green = components[1];
        blue = components[2];
        alpha = components[3];
    }
    return @[@(red), @(green), @(blue), @(alpha)];
}

@end
