//
//  NSObject+JKAssociatedObject.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/11.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSObject+JKAssociatedObject.h"
#import  <objc/runtime.h>

@implementation NSObject (JKAssociatedObject)

- (void)jk_associateValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN);
}

- (void)jk_weaklyAssociateValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (id)jk_associatedValueForKey:(void *)key {
    return objc_getAssociatedObject(self, key);
}

@end

