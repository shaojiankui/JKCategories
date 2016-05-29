//
//  UIView+CustomBorder.h
//  Categories
//
//  Created by luomeng on 15/11/3.
//  Copyright © 2015年 luomeng. All rights reserved.
//
/**
 * 视图添加边框
 */

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, JKExcludePoint) {
    JKExcludeStartPoint = 1 << 0,
    JKExcludeEndPoint = 1 << 1,
    JKExcludeAllPoint = ~0UL
};


@interface UIView (JKCustomBorder)

- (void)jk_addTopBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;
- (void)jk_addLeftBorderWithColor: (UIColor *) color width:(CGFloat) borderWidth;
- (void)jk_addBottomBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;
- (void)jk_addRightBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;

- (void)jk_removeTopBorder;
- (void)jk_removeLeftBorder;
- (void)jk_removeBottomBorder;
- (void)jk_removeRightBorder;


- (void)jk_addTopBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(JKExcludePoint)edge;
- (void)jk_addLeftBorderWithColor: (UIColor *) color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(JKExcludePoint)edge;
- (void)jk_addBottomBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(JKExcludePoint)edge;
- (void)jk_addRightBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(JKExcludePoint)edge;
@end
