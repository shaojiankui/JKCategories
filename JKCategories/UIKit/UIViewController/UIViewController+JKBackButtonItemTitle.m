//
//  UIViewController+BackButtonItemTitle.m
//  Author ： https://github.com/KevinHM
//
//  Created by KevinHM on 15/8/6.
//  Copyright (c) 2015年 KevinHM. All rights reserved.
//

#import "UIViewController+JKBackButtonItemTitle.h"

@implementation UIViewController (JKBackButtonItemTitle)

@end

@implementation UINavigationController (JKNavigationItemBackBtnTile)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item {
    
    UIViewController * viewController = self.viewControllers.count > 1 ? \
                    [self.viewControllers objectAtIndex:self.viewControllers.count - 2] : nil;
    
    if (!viewController) {
        return YES;
    }
    
    NSString *backButtonTitle = nil;
    if ([viewController respondsToSelector:@selector(jk_navigationItemBackBarButtonTitle)]) {
        backButtonTitle = [viewController jk_navigationItemBackBarButtonTitle];
    }
    
    if (!backButtonTitle) {
        backButtonTitle = viewController.title;
    }
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:backButtonTitle
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil action:nil];
    viewController.navigationItem.backBarButtonItem = backButtonItem;
    
    return YES;
}

@end