//
//  UIView+RecursiveDescription.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIView+JKRecursiveDescription.h"

@implementation UIView (JKRecursiveDescription)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
/**
 *  @brief  打印视图层级
 *
 *  @return 打印视图层级字符串
 */
-(NSString*)jk_recursiveView
{
    NSString *description = [NSString stringWithFormat:@"%s [Line %d] \r\r %@",
                          __PRETTY_FUNCTION__, __LINE__,
                          [self performSelector:@selector(recursiveDescription)]];
    return description;
}
/**
 *  @brief  打印约束
 *
 *  @return 打印约束字符串
 */
-(NSString*)jk_constraintsDescription{
    NSString *description = [NSString stringWithFormat:@"%s [Line %d] \r\r %@ \r\r",
                             __PRETTY_FUNCTION__, __LINE__,
                             [[self constraints] description]];
    return description;
}
/**
 *  @brief  打印整个autolayout树的字符串
 *
 *  @return 打印整个autolayout树的字符串
 */
-(NSString*)jk_autolayoutTraceDescription{
    NSString *description = [NSString stringWithFormat:@"%s [Line %d] \r\r %@",
                             __PRETTY_FUNCTION__, __LINE__,
                             [self performSelector:@selector(_autolayoutTrace)]];
    return description;
}
#pragma clang diagnostic pop
@end
