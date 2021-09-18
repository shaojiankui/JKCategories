//
//  UIColor+Random.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIColor+JKRandom.h"

@implementation UIColor (JKRandom)

+ (UIColor *)jk_randomColor {
    // arc4random()%255/255.0 表示生成 [0, 255] 之间的随机数
    UIColor *randomColor = [UIColor colorWithDisplayP3Red:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return randomColor;
}

@end
