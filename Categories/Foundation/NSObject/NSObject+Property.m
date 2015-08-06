//
//  NSObject+Property.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
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


- (NSDictionary*)dictionaryValue
{
    return [self dictionaryWithValuesForKeys:[self allPropertyKeys]];
}
- (NSArray*)allPropertyKeys
{
    unsigned int propertyCount = 0;
    objc_property_t * properties = class_copyPropertyList([self class], &propertyCount);
    NSMutableArray * propertyNames = [NSMutableArray array];
    for (unsigned int i = 0; i < propertyCount; ++i) {
        objc_property_t property = properties[i];
        const char * name = property_getName(property);
        [propertyNames addObject:[NSString stringWithUTF8String:name]];
    }
    free(properties);
    return propertyNames;
}
- (NSArray*)allPropertyKeyPaths
{
    NSMutableArray *allKeyPaths = [NSMutableArray array];
    for (NSString* key in [self allPropertyKeys])
    {
        id obj = [self valueForKey:key];
        [allKeyPaths addObject:key];
        [allKeyPaths addObjectsFromArray:[obj allPropertyKeyPathsWithBaseKeyPath:key]];
    }
    return [NSArray arrayWithArray:allKeyPaths];
}
- (NSArray*)allPropertyKeyPathsWithBaseKeyPath:(NSString*)baseKeyPath
{
    NSMutableArray *allKeyPaths = [NSMutableArray array];
    for (NSString* key in [self allPropertyKeys])
    {
        id obj = [self valueForKey:key];
        NSString *newBasePath = [baseKeyPath stringByAppendingFormat:@".%@", key];
        [allKeyPaths addObject:newBasePath];
        [allKeyPaths addObjectsFromArray:[obj allPropertyKeyPathsWithBaseKeyPath:newBasePath]];
    }
    return [NSArray arrayWithArray:allKeyPaths];
}
- (NSArray*)allBasePropertyKeyPaths
{
    NSMutableArray *allKeyPaths = [NSMutableArray array];
    for (NSString* key in [self allPropertyKeys])
    {
        id obj = [self valueForKey:key];
        //NSLog(@"%@:%@", key, obj);
        id subKeys = [obj allBasePropertyKeyPathsWithBaseKeyPath:key];
        if	([subKeys count] > 0)
        {
            [allKeyPaths addObjectsFromArray:subKeys];
        }
        else
        {
            [allKeyPaths addObject:key];
        }
    }
    return [NSArray arrayWithArray:allKeyPaths];
}
- (NSArray*)allBasePropertyKeyPathsWithBaseKeyPath:(NSString*)baseKeyPath
{
    NSMutableArray *allKeyPaths = [NSMutableArray array];
    for (NSString* key in [self allPropertyKeys])
    {
        id obj = [self valueForKey:key];
        NSString *newBasePath = [baseKeyPath stringByAppendingFormat:@".%@", key];
        id subKeys = [obj allBasePropertyKeyPathsWithBaseKeyPath:newBasePath];
        if	([subKeys count] > 0)
        {
            [allKeyPaths addObjectsFromArray:subKeys];
        }
        else
        {
            [allKeyPaths addObject:newBasePath];
        }
    }
    return [NSArray arrayWithArray:allKeyPaths];
}
- (BOOL)hasPropertyForKey:(NSString*)key
{
    objc_property_t property = class_getProperty([self class], [key UTF8String]);
    return (BOOL)property;
}
- (BOOL)hasIvarForKey:(NSString*)key
{
    Ivar ivar = class_getInstanceVariable([self class], [key UTF8String]);
    return (BOOL)ivar;
}
- (id)valueForArrayIndexedKeyPath:(NSString *)keyPath
{
    NSArray *keys = [keyPath componentsSeparatedByString:@"."];
    id object = nil;
    for (NSString* key in keys)
    {
        if ([object isKindOfClass:[NSArray class]])
        {
            NSRange range = [key rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
            if (range.location != NSNotFound)
            {
                NSString *digitKey = [key substringWithRange:range];
                NSInteger index = [digitKey integerValue];
                BOOL validIndex = (index < [object count])&&(index >= 0);
                if (!validIndex)
                {
                    NSString* error = [NSString stringWithFormat:@"Index:%zd out of bounds for valueAtKeyPath:@\"%@\" for array:0x%p.count = %zd", index, keyPath, &object, [object count]];
                    NSAssert(validIndex, error);
                }
                object = [object objectAtIndex:index];
            }
        }
        else
        {
            object = [self valueForKey:key];
        }
    }
    return object;
}

@end
