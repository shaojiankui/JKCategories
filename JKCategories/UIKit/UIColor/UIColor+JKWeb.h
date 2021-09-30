//
//  UIColor+Web.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/22.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JKWeb)

/// 获取 Canvas 用的颜色字符串
- (NSString *)jk_canvasColorString;

/// 获取网页颜色字串
- (NSString *)jk_webColorString;

@end
