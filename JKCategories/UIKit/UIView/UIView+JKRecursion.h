//
//  UIView+Recursion.h
//  JKCategories
//
//  Created by Jakey on 15/6/23.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^JKSubviewBlock) (UIView* view);
typedef void (^JKSuperviewBlock) (UIView* superview);
@interface UIView (JKRecursion)

/**
 *  @brief  寻找子视图
 *
 *  @param recurse 回调
 *
 *  @return  Return YES from the block to recurse into the subview.
 Set stop to YES to return the subview.
 */
- (UIView*)jk_findViewRecursively:(BOOL(^)(UIView* subview, BOOL* stop))recurse;


-(void)jk_runBlockOnAllSubviews:(JKSubviewBlock)block;
-(void)jk_runBlockOnAllSuperviews:(JKSuperviewBlock)block;
-(void)jk_enableAllControlsInViewHierarchy;
-(void)jk_disableAllControlsInViewHierarchy;
@end
