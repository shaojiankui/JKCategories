//
//  UIWebView+style.h
//  JKCategories
//
//  Created by jakey on 14-3-11.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (JKStyle)
/**
 *  @brief  是否显示阴影
 *
 *  @param hidden 是否显示阴影
 */
- (void)jk_shadowViewHidden:(BOOL)hidden;

/**
 *  @brief  是否显示水平滑动指示器
 *
 *  @param hidden 是否显示水平滑动指示器
 */
- (void)jk_showsHorizontalScrollIndicator:(BOOL)hidden;
/**
 *  @brief  是否显示垂直滑动指示器
 *
 *  @param hidden 是否显示垂直滑动指示器
 */
- (void)jk_showsVerticalScrollIndicator:(BOOL)hidden;

/**
 *  @brief  网页透明
 */
-(void)jk_makeTransparent;
/**
 *  @brief  网页透明移除+阴影
 */
-(void)jk_makeTransparentAndRemoveShadow;
@end
