//
//  UIScrollView+JKPages.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (JKPages)
- (NSInteger)jk_pages;
- (NSInteger)jk_currentPage;
- (CGFloat)jk_scrollPercent;

- (CGFloat)jk_pagesY;
- (CGFloat)jk_pagesX;
- (CGFloat)jk_currentPageY;
- (CGFloat)jk_currentPageX;
- (void)jk_setPageY:(CGFloat)page;
- (void)jk_setPageX:(CGFloat)page;
- (void)jk_setPageY:(CGFloat)page animated:(BOOL)animated;
- (void)jk_setPageX:(CGFloat)page animated:(BOOL)animated;
@end
