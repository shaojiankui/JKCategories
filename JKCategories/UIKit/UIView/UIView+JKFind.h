//
//  UIView+Find.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JKFind)

/// 返回当前视图所在的 ViewController
@property (readonly) UIViewController *jk_viewController;

/// 返回当前视图所在的 NavigationController
@property (readonly) UINavigationController *jk_navigationController;

/// 返回当前视图所在的 TabBarController
@property (readonly) UITabBarController *jk_tabBarController;

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

@end
