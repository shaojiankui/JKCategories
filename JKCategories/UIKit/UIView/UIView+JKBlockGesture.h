//
//  UIView+UIView_BlockGesture.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^JKGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (JKBlockGesture)

/// 添加 Tag 手势
- (void)jk_addTapActionWithBlock:(JKGestureActionBlock)block;

/// 添加长按手势
- (void)jk_addLongPressActionWithBlock:(JKGestureActionBlock)block;

@end
