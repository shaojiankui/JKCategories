//
//  UIPopoverController+iPhone.h
//  IOS-Categories
//
//  Created by Jakey on 15/7/12.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//
// Runtime implementation to allow UIPopoverController on iPhone apps.

#import <UIKit/UIKit.h>

@interface UIPopoverController (iPhone)
+ (BOOL)_popoversDisabled;
@end
