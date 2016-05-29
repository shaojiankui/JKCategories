//
//  UIView+Recursion.m
//  JKCategories
//
//  Created by Jakey on 15/6/23.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import "UIView+JKRecursion.h"

@implementation UIView (JKRecursion)
/**
 *  @brief  寻找子视图
 *
 *  @param recurse 回调
 *
 *  @return  Return YES from the block to recurse into the subview.
 Set stop to YES to return the subview.
 */
- (UIView*)jk_findViewRecursively:(BOOL(^)(UIView* subview, BOOL* stop))recurse
{
    for( UIView* subview in self.subviews ) {
        BOOL stop = NO;
        if( recurse( subview, &stop ) ) {
            return [subview jk_findViewRecursively:recurse];
        } else if( stop ) {
            return subview;
        }
    }
    
    return nil;
}


-(void)jk_runBlockOnAllSubviews:(JKSubviewBlock)block
{
    block(self);
    for (UIView* view in [self subviews])
    {
        [view jk_runBlockOnAllSubviews:block];
    }
}

-(void)jk_runBlockOnAllSuperviews:(JKSuperviewBlock)block
{
    block(self);
    if (self.superview)
    {
        [self.superview jk_runBlockOnAllSuperviews:block];
    }
}

-(void)jk_enableAllControlsInViewHierarchy
{
    [self jk_runBlockOnAllSubviews:^(UIView *view) {
        
        if ([view isKindOfClass:[UIControl class]])
        {
            [(UIControl *)view setEnabled:YES];
        }
        else if ([view isKindOfClass:[UITextView class]])
        {
            [(UITextView *)view setEditable:YES];
        }
    }];
}

-(void)jk_disableAllControlsInViewHierarchy
{
    [self jk_runBlockOnAllSubviews:^(UIView *view) {
        
        if ([view isKindOfClass:[UIControl class]])
        {
            [(UIControl *)view setEnabled:NO];
        }
        else if ([view isKindOfClass:[UITextView class]])
        {
            [(UITextView *)view setEditable:NO];
        }
    }];
}
@end
