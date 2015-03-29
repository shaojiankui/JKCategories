//
//  UIColor+Web.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/22.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Web)
// 获取canvas用的颜色字符串
- (NSString *)canvasColorString;
//获取网页颜色字串
- (NSString *)webColorString;
@end
