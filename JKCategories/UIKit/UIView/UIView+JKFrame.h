//
//  UIView+JKFrame.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JKFrame)

/// frame.origin.x
@property (nonatomic) CGFloat jk_left;

/// frame.origin.x + frame.size.width
@property (nonatomic) CGFloat jk_right;

/// frame.origin.y
@property (nonatomic) CGFloat jk_top;

/// frame.origin.y + frame.size.height
@property (nonatomic) CGFloat jk_bottom;

/// frame.size.width
@property (nonatomic) CGFloat jk_width;

/// frame.size.height
@property (nonatomic) CGFloat jk_height;

/// center.x
@property (nonatomic) CGFloat jk_centerX;

/// center.y
@property (nonatomic) CGFloat jk_centerY;

/// frame.origin
@property (nonatomic, assign) CGPoint jk_origin;

/// frame.size
@property (nonatomic, assign) CGSize jk_size;

@end
