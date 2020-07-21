//
//  UIView+Find.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JKFind)
/**
 *  @brief  找到指定类名的SubView对象
 *
 *  @param clazz SubView类名
 *
 *  @return view对象
 */
- (id)jk_findSubViewWithSubViewClass:(Class)clazz;
/**
 *  @brief  找到指定类名的SuperView对象
 *
 *  @param clazz SuperView类名
 *
 *  @return view对象
 */
- (id)jk_findSuperViewWithSuperViewClass:(Class)clazz;

/**
 *  @brief  找到并且释放第一响应者
 *
 *  @return 结果
 */
- (BOOL)jk_findAndResignFirstResponder;
/**
 *  @brief  找到第一响应者
 *
 *  @return 第一响应者
 */
- (UIView *)jk_findFirstResponder;

/**
 *  @brief  找到当前view所在的viewcontroler
 */
@property (readonly) UIViewController *jk_viewController;

/**
 * @brief 找到当前view所在的navigationController
 */
@property (readonly) UINavigationController *jk_navigationController;

/**
 * @brief 找到当前view所在的tabBarController
 */
@property (readonly) UITabBarController *jk_tabBarController;

@end
