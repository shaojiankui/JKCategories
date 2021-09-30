//
//  UIButton+JKTouchAreaInsets.h
//  JKCategories
//
//  Created by Qilin Hu on 2020/4/30.
//  Copyright © 2020 Qilin Hu. All rights reserved.
//

#import <objc/runtime.h>
#import "UIButton+JKTouchAreaInsets.h"

@implementation UIButton (JKTouchAreaInsets)

- (UIEdgeInsets)jk_touchAreaInsets
{
	return [objc_getAssociatedObject(self, @selector(jk_touchAreaInsets)) UIEdgeInsetsValue];
}

- (void)setJk_touchAreaInsets:(UIEdgeInsets)touchAreaInsets
{
    NSValue *value = [NSValue valueWithUIEdgeInsets:touchAreaInsets];
	objc_setAssociatedObject(self, @selector(jk_touchAreaInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    UIEdgeInsets touchAreaInsets = self.jk_touchAreaInsets;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - touchAreaInsets.left,
                        bounds.origin.y - touchAreaInsets.top,
                        bounds.size.width + touchAreaInsets.left + touchAreaInsets.right,
                        bounds.size.height + touchAreaInsets.top + touchAreaInsets.bottom);
	return CGRectContainsPoint(bounds, point);
}

@end
