//
//  UIButton+Block.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIButton+JKBlock.h"
#import <objc/runtime.h>
static const void *jk_UIButtonBlockKey = &jk_UIButtonBlockKey;

@implementation UIButton (jk_Block)
-(void)jk_addActionHandler:(JKTouchedButtonBlock)touchHandler{
    objc_setAssociatedObject(self, jk_UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(jk_blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)jk_blockActionTouched:(UIButton *)btn{
    JKTouchedButtonBlock block = objc_getAssociatedObject(self, jk_UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}
@end

