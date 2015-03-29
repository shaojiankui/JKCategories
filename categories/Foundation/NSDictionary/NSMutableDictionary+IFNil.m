//
//  NSMutableDictionary+IFNil.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSMutableDictionary+IFNil.h"

@implementation NSMutableDictionary (IFNil)
- (void)setValueIfNotNil:(id)value forKey:(NSString *)key {
    if (value != nil) {
        [self setValue:value forKey:key];
    }
}
@end
