//
//  UIScrollView+Direction.h
//  Beta
//
//  Created by Joe on 10/18/13.
//  Copyright (c) 2013 mergesort. All rights reserved.
//  https://github.com/mergesort/UIScrollView-Direction

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ScrollDirection) {
    ScrollDirectionUp,
    ScrollDirectionDown,
    ScrollDirectionLeft,
    ScrollDirectionRight,
    ScrollDirectionWTF
};


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface UIScrollView (Direction)

- (ScrollDirection)scrollDirection;

@end
