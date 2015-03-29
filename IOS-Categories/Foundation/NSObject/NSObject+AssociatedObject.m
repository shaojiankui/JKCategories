//
//  NSObject+AssociatedObject.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/11.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSObject+AssociatedObject.h"
#import  <objc/runtime.h>
@implementation NSObject (AssociatedObject)
- (void)associateValue:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN);
}

- (void)weaklyAssociateValue:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (id)associatedValueForKey:(void *)key
{
    return objc_getAssociatedObject(self, key);
}
@end

