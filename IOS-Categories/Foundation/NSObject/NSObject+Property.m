//
//  NSObject+Property.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/20.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSObject+Property.h"
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@implementation NSObject (Property)
-(NSDictionary *)propertyDictionary
{
    //创建可变字典
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    unsigned int outCount;
    objc_property_t *props = class_copyPropertyList([self class], &outCount);
    for(int i=0;i<outCount;i++){
        objc_property_t prop = props[i];
        NSString *propName = [[NSString alloc]initWithCString:property_getName(prop) encoding:NSUTF8StringEncoding];
        id propValue = [self valueForKey:propName];
        if(propValue){
            [dict setObject:propValue forKey:propName];
        }
    }
    free(props);
    return dict;
}

+ (NSArray *)classPropertyList {
    NSMutableArray *allProperties = [[NSMutableArray alloc] init];
    
    unsigned int outCount;
    objc_property_t *props = class_copyPropertyList(self, &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t prop = props[i];
        
        NSString *propName = [[NSString alloc]initWithCString:property_getName(prop) encoding:NSUTF8StringEncoding];

        if (propName) {
            [allProperties addObject:propName];
        }
    }
    free(props);
    return [NSArray arrayWithArray:allProperties];
}
@end
