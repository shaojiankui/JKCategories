//
//  NSSet+Block.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSSet+Block.h"

@implementation NSSet (Block)
- (void)each:(void (^)(id))block
{
    for (id obj in self) {
        block(obj);
    }
}

- (NSSet *)select:(BOOL (^)(id))block
{
    NSMutableSet *rslt = [NSMutableSet set];
    for (id obj in self) {
        if (block(obj)) {
            [rslt addObject:obj];
        }
    }
    return rslt;
}

- (NSSet *)map:(id (^)(id))block
{
    NSMutableSet *rslt = [NSMutableSet set];
    for (id obj in self) {
        [rslt addObject:block(obj)];
    }
    return rslt;
}

- (id)reduce:(id)initial withBlock:(id (^)(id,id))block
{
    id rslt = initial;
    for (id obj in self) {
        rslt = block(rslt, obj);
    }
    return rslt;
    
}
@end
