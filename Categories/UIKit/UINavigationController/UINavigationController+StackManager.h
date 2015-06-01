//
//  UINavigationController+StackManager.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (StackManager)
- (id)findViewController:(NSString*)className;
- (BOOL)isOnlyContainRootViewController;
- (UIViewController *)rootViewController;
- (NSArray *)popToViewControllerWithClassName:(NSString*)className animated:(BOOL)animated;
- (NSArray *)popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated;
@end
