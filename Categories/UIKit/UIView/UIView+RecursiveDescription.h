//
//  UIView+RecursiveDescription.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RecursiveDescription)
/**
 *  @brief  打印视图层级
 *
 *  @return 打印视图层级字符串
 */
-(NSString*)recursiveView;
/**
 *  @brief  打印约束
 *
 *  @return 打印约束字符串
 */
-(NSString*)constraintsDescription;
/**
 *  @brief  打印整个autolayout树的字符串
 *
 *  @return 打印整个autolayout树的字符串
 */
-(NSString*)autolayoutTraceDescription;

@end
