//
//  UIView+JKFrame.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JKFrame)

/// Shortcut for frame.origin.x
@property (nonatomic) CGFloat jk_left;

/// Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat jk_right;

/// Shortcut for frame.origin.y
@property (nonatomic) CGFloat jk_top;

/// Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat jk_bottom;

/// Shortcur for frame.size.width
@property (nonatomic) CGFloat jk_width;

/// Shortcut for frame.size.height
@property (nonatomic) CGFloat jk_height;

/// Shortcut for center.x
@property (nonatomic) CGFloat jk_centerX;

/// Shortcut for center.y
@property (nonatomic) CGFloat jk_centerY;

/// Shortcut for frame.origin
@property (nonatomic, assign) CGPoint jk_origin;

/// Shortcut for frame.size
@property (nonatomic, assign) CGSize jk_size;

@end
