//
//  UIScrollView+JKAddition.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, JKScrollDirection) {
    JKScrollDirectionUp,
    JKScrollDirectionDown,
    JKScrollDirectionLeft,
    JKScrollDirectionRight,
    JKScrollDirectionWTF
};

@interface UIScrollView (JKAddition)
@property(nonatomic) CGFloat jk_contentWidth;
@property(nonatomic) CGFloat jk_contentHeight;
@property(nonatomic) CGFloat jk_contentOffsetX;
@property(nonatomic) CGFloat jk_contentOffsetY;

- (CGPoint)jk_topContentOffset;
- (CGPoint)jk_bottomContentOffset;
- (CGPoint)jk_leftContentOffset;
- (CGPoint)jk_rightContentOffset;

- (JKScrollDirection)jk_ScrollDirection;

- (BOOL)jk_isScrolledToTop;
- (BOOL)jk_isScrolledToBottom;
- (BOOL)jk_isScrolledToLeft;
- (BOOL)jk_isScrolledToRight;
- (void)jk_scrollToTopAnimated:(BOOL)animated;
- (void)jk_scrollToBottomAnimated:(BOOL)animated;
- (void)jk_scrollToLeftAnimated:(BOOL)animated;
- (void)jk_scrollToRightAnimated:(BOOL)animated;

- (NSUInteger)jk_verticalPageIndex;
- (NSUInteger)jk_horizontalPageIndex;

- (void)jk_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
- (void)jk_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
@end
