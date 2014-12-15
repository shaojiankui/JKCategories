//
//  UIWebView+style.m
//  vw-vip
//
//  Created by jakey on 14-3-11.
//  Copyright (c) 2014年 zhangkongli. All rights reserved.
//

#import "UIWebView+Style.h"

@implementation UIWebView (Style)

- (void)setShadowView:(BOOL)b{
    for (UIView *aView in [self subviews])
    {
        if ([aView isKindOfClass:[UIScrollView class]])
        {
            [(UIScrollView *)aView setShowsHorizontalScrollIndicator:NO];
            for (UIView *shadowView in aView.subviews)
            {
                if ([shadowView isKindOfClass:[UIImageView class]])
                {
                    shadowView.hidden = b;  //上下滚动出边界时的黑色的图片 也就是拖拽后的上下阴影
                }
            }
        }
    }
}
- (void)setShowsHorizontalScrollIndicator:(BOOL)b{
    for (UIView *aView in [self subviews])
    {
        if ([aView isKindOfClass:[UIScrollView class]])
        {
            [(UIScrollView *)aView setShowsHorizontalScrollIndicator:b];
        }
    }
}
- (void)setShowsVerticalScrollIndicator:(BOOL)b{
    for (UIView *aView in [self subviews])
    {
        if ([aView isKindOfClass:[UIScrollView class]])
        {
            [(UIScrollView *)aView setShowsVerticalScrollIndicator:b];
        }
    }
}
@end
