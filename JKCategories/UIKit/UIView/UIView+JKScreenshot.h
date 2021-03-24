//
//  UIView+Screenshot.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/10.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JKScreenshot)

/// 截图
- (UIImage *)jk_screenshot;

/// 截图一个view中所有视图，包括旋转缩放效果
/// @param maxWidth 限制缩放的最大宽度 保持默认传0
- (UIImage *)jk_screenshot:(CGFloat)maxWidth;

@end
