//
//  UISplitViewController+QuickAccess.h
//
//  Created by Timothy Sanders on 6/28/12.
//  Copyright (c) 2012 HiddenJester Software.
//

#import <UIKit/UIKit.h>

/*
 Reference: <https://github.com/HiddenJester/UISplitViewController-QuickAccess>
 
 I often want the "left content view controller" or the "right content view controller".
 Many times the UIViewControllers in viewControllers are actually UINavigationControllers and then
 I want to get the topViewController from that. So these methods pull the left or right VC and then
 check if they are UINavigationControllers. If they are then they go ahead and return the controller's
 topViewController property.
 */
@interface UISplitViewController (JKQuickAccess)

@property (weak, readonly, nonatomic) UIViewController *jk_leftController;
@property (weak, readonly, nonatomic) UIViewController *jk_rightController;

@end
