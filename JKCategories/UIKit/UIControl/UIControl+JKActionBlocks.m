//
//  UIControl+JKActionBlocks.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIControl+JKActionBlocks.h"
#import <objc/runtime.h>

static const void *UIControlJKActionBlockArray = &UIControlJKActionBlockArray;

@implementation UIControlJKActionBlockWrapper

- (void)jk_invokeBlock:(id)sender {
    if (self.jk_actionBlock) {
        self.jk_actionBlock(sender);
    }
}
@end


@implementation UIControl (JKActionBlocks)
-(void)jk_handleControlEvents:(UIControlEvents)controlEvents withBlock:(UIControlJKActionBlock)actionBlock {
    NSMutableArray *actionBlocksArray = [self jk_actionBlocksArray];
    
    UIControlJKActionBlockWrapper *blockActionWrapper = [[UIControlJKActionBlockWrapper alloc] init];
    blockActionWrapper.jk_actionBlock = actionBlock;
    blockActionWrapper.jk_controlEvents = controlEvents;
    [actionBlocksArray addObject:blockActionWrapper];
    
    [self addTarget:blockActionWrapper action:@selector(jk_invokeBlock:) forControlEvents:controlEvents];
}


- (void)jk_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents {
    NSMutableArray *actionBlocksArray = [self jk_actionBlocksArray];
    NSMutableArray *wrappersToRemove = [NSMutableArray arrayWithCapacity:[actionBlocksArray count]];
    
    [actionBlocksArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIControlJKActionBlockWrapper *wrapperTmp = obj;
        if (wrapperTmp.jk_controlEvents == controlEvents) {
            [wrappersToRemove addObject:wrapperTmp];
            [self removeTarget:wrapperTmp action:@selector(jk_invokeBlock:) forControlEvents:controlEvents];
        }
    }];
    
    [actionBlocksArray removeObjectsInArray:wrappersToRemove];
}


- (NSMutableArray *)jk_actionBlocksArray {
    NSMutableArray *actionBlocksArray = objc_getAssociatedObject(self, UIControlJKActionBlockArray);
    if (!actionBlocksArray) {
        actionBlocksArray = [NSMutableArray array];
        objc_setAssociatedObject(self, UIControlJKActionBlockArray, actionBlocksArray, OBJC_ASSOCIATION_RETAIN);
    }
    return actionBlocksArray;
}
@end
