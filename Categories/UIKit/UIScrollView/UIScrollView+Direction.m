//
//  UIScrollView+Direction.m
//  Beta
//
//  Created by Joe on 10/18/13.
//  Copyright (c) 2013 mergesort. All rights reserved.
//

#import "UIScrollView+Direction.h"


@implementation UIScrollView (Direction)

- (ScrollDirection)scrollDirection
{
    ScrollDirection direction;
    
    if ([self.panGestureRecognizer translationInView:self.superview].y > 0.0f)
    {
        direction = ScrollDirectionUp;
    }
    else if ([self.panGestureRecognizer translationInView:self.superview].y < 0.0f)
    {
        direction = ScrollDirectionDown;
    }
    else if ([self.panGestureRecognizer translationInView:self].x < 0.0f)
    {
        direction = ScrollDirectionLeft;
    }
    else if ([self.panGestureRecognizer translationInView:self].x > 0.0f)
    {
        direction = ScrollDirectionRight;
    }
    else
    {
        direction = ScrollDirectionWTF;
    }
    
    return direction;
}

@end
