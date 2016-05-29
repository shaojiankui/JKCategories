//
//  UIButton+BackgroundColor.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by 符现超 on 15/5/9.
//  Copyright (c) 2015年 http://weibo.com/u/1655766025 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JKBackgroundColor)
/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)jk_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
@end
