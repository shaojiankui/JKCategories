//
//  UIScreen+JKFrame.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (JKFrame)
+ (CGSize)jk_size;
+ (CGFloat)jk_width;
+ (CGFloat)jk_height;

+ (CGSize)jk_orientationSize;
+ (CGFloat)jk_orientationWidth;
+ (CGFloat)jk_orientationHeight;
+ (CGSize)jk_DPISize;

@end
