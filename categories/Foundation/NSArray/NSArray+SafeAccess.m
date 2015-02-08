//
//  NSArray+SafeAccess.m
//  IOS-Categories
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSArray+SafeAccess.h"

@implementation NSArray (SafeAccess)
-(id)objectWithIndex:(NSUInteger)index{
    if (index <self.count) {
        return self[index];
    }else{
        return nil;
    }
}
@end
