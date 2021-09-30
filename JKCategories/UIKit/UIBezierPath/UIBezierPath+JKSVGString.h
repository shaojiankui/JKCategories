//
//  UIBezierPath+JKSVGString.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (JKSVGString)

/// UIBezierPath 转换为 SVG
- (NSString*)jk_SVGString;

@end
