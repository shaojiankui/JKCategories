//
//  UIScrollView+JKAddition.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIScrollView+JKAddition.h"

@implementation UIScrollView (JKAddition)
//frame
- (CGFloat)jk_contentWidth {
    return self.contentSize.width;
}
- (void)setJk_contentWidth:(CGFloat)width {
    self.contentSize = CGSizeMake(width, self.frame.size.height);
}
- (CGFloat)jk_contentHeight {
    return self.contentSize.height;
}
- (void)setJk_contentHeight:(CGFloat)height {
    self.contentSize = CGSizeMake(self.frame.size.width, height);
}
- (CGFloat)jk_contentOffsetX {
    return self.contentOffset.x;
}
- (void)setJk_contentOffsetX:(CGFloat)x {
    self.contentOffset = CGPointMake(x, self.contentOffset.y);
}
- (CGFloat)jk_contentOffsetY {
    return self.contentOffset.y;
}
- (void)setJk_contentOffsetY:(CGFloat)y {
    self.contentOffset = CGPointMake(self.contentOffset.x, y);
}
//


- (CGPoint)jk_topContentOffset
{
    return CGPointMake(0.0f, -self.contentInset.top);
}
- (CGPoint)jk_bottomContentOffset
{
    return CGPointMake(0.0f, self.contentSize.height + self.contentInset.bottom - self.bounds.size.height);
}
- (CGPoint)jk_leftContentOffset
{
    return CGPointMake(-self.contentInset.left, 0.0f);
}
- (CGPoint)jk_rightContentOffset
{
    return CGPointMake(self.contentSize.width + self.contentInset.right - self.bounds.size.width, 0.0f);
}
- (JKScrollDirection)jk_ScrollDirection
{
    JKScrollDirection direction;
    
    if ([self.panGestureRecognizer translationInView:self.superview].y > 0.0f)
    {
        direction = JKScrollDirectionUp;
    }
    else if ([self.panGestureRecognizer translationInView:self.superview].y < 0.0f)
    {
        direction = JKScrollDirectionDown;
    }
    else if ([self.panGestureRecognizer translationInView:self].x < 0.0f)
    {
        direction = JKScrollDirectionLeft;
    }
    else if ([self.panGestureRecognizer translationInView:self].x > 0.0f)
    {
        direction = JKScrollDirectionRight;
    }
    else
    {
        direction = JKScrollDirectionWTF;
    }
    
    return direction;
}
- (BOOL)jk_isScrolledToTop
{
    return self.contentOffset.y <= [self jk_topContentOffset].y;
}
- (BOOL)jk_isScrolledToBottom
{
    return self.contentOffset.y >= [self jk_bottomContentOffset].y;
}
- (BOOL)jk_isScrolledToLeft
{
    return self.contentOffset.x <= [self jk_leftContentOffset].x;
}
- (BOOL)jk_isScrolledToRight
{
    return self.contentOffset.x >= [self jk_rightContentOffset].x;
}
- (void)jk_scrollToTopAnimated:(BOOL)animated
{
    [self setContentOffset:[self jk_topContentOffset] animated:animated];
}
- (void)jk_scrollToBottomAnimated:(BOOL)animated
{
    [self setContentOffset:[self jk_bottomContentOffset] animated:animated];
}
- (void)jk_scrollToLeftAnimated:(BOOL)animated
{
    [self setContentOffset:[self jk_leftContentOffset] animated:animated];
}
- (void)jk_scrollToRightAnimated:(BOOL)animated
{
    [self setContentOffset:[self jk_rightContentOffset] animated:animated];
}
- (NSUInteger)jk_verticalPageIndex
{
    return (self.contentOffset.y + (self.frame.size.height * 0.5f)) / self.frame.size.height;
}
- (NSUInteger)jk_horizontalPageIndex
{
    return (self.contentOffset.x + (self.frame.size.width * 0.5f)) / self.frame.size.width;
}
- (void)jk_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(0.0f, self.frame.size.height * pageIndex) animated:animated];
}
- (void)jk_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.frame.size.width * pageIndex, 0.0f) animated:animated];
}


@end
