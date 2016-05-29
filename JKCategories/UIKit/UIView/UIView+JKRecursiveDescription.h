//
//  UIView+RecursiveDescription.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JKRecursiveDescription)
/**
 *  @brief  打印视图层级
 *
 *  @return 打印视图层级字符串
 */
-(NSString*)jk_recursiveView;
/**
 *  @brief  打印约束
 *
 *  @return 打印约束字符串
 */
-(NSString*)jk_constraintsDescription;
/**
 *  @brief  打印整个autolayout树的字符串
 *
 *  @return 打印整个autolayout树的字符串
 */
-(NSString*)jk_autolayoutTraceDescription;

@end
