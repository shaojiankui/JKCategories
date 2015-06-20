//
//  UIViewController+ScrollingStatusBar.h
//  UIViewControllerScrollingStatusBar
//
//  Created by Anton Domashnev on 25.06.14.
//  Copyright (c) 2014 Anton Domashnev. All rights reserved.
//  https://github.com/Antondomashnev/UIViewController-ScrollingStatusBar
//  Category for UIViewController with UIScrollView to scroll statusBar along scrollView

#import <UIKit/UIKit.h>

@interface UIViewController (ScrollingStatusBar)

- (void)enableStatusBarScrollingAlongScrollView:(UIScrollView *)scrollView;
- (void)disableStatusBarScrollingAlongScrollView:(UIScrollView *)scrollView;

@end
