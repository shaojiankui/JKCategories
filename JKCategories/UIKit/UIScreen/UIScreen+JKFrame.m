//
//  UIScreen+JKFrame.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIScreen+JKFrame.h"

@implementation UIScreen (JKFrame)
+ (CGSize)jk_size
{
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGFloat)jk_width
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)jk_height
{
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGSize)jk_orientationSize
{
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion]
                             doubleValue];
    BOOL isLand =   UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    return (systemVersion>8.0 && isLand) ? jk_SizeSWAP([UIScreen jk_size]) : [UIScreen jk_size];
}

+ (CGFloat)jk_orientationWidth
{
    return [UIScreen jk_orientationSize].width;
}

+ (CGFloat)jk_orientationHeight
{
    return [UIScreen jk_orientationSize].height;
}

+ (CGSize)jk_DPISize
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}


/**
 *  交换高度与宽度
 */
static inline CGSize jk_SizeSWAP(CGSize size) {
    return CGSizeMake(size.height, size.width);
}
@end
