//
//  UIViewController+BackButtonTouched.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//
#import <UIKit/UIKit.h>
typedef void (^JKBackButtonHandler)(UIViewController *vc);
@interface UIViewController (JKBackButtonTouched)
/**
 *  @author JKCategories
 *
 *  navgation 返回按钮回调
 *
 *  @param backButtonHandler <#backButtonHandler description#>
 */
-(void)jk_backButtonTouched:(JKBackButtonHandler)backButtonHandler;
@end
