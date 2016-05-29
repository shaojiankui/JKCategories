//
//  UIBarButtonItem+JKAction.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

char * const UIBarButtonItemJKActionBlock = "UIBarButtonItemJKActionBlock";
#import "UIBarButtonItem+JKAction.h"
#import <objc/runtime.h>

@implementation UIBarButtonItem (JKAction)

- (void)jk_performActionBlock {
    
    dispatch_block_t block = self.jk_actionBlock;
    
    if (block)
        block();
    
}

- (BarButtonJKActionBlock)jk_actionBlock {
    return objc_getAssociatedObject(self, UIBarButtonItemJKActionBlock);
}

- (void)setJk_actionBlock:(BarButtonJKActionBlock)actionBlock
 {
    
    if (actionBlock != self.jk_actionBlock) {
        [self willChangeValueForKey:@"jk_actionBlock"];
        
        objc_setAssociatedObject(self,
                                 UIBarButtonItemJKActionBlock,
                                 actionBlock,
                                 OBJC_ASSOCIATION_COPY);
        
        // Sets up the action.
        [self setTarget:self];
        [self setAction:@selector(jk_performActionBlock)];
        
        [self didChangeValueForKey:@"jk_actionBlock"];
    }
}
@end
