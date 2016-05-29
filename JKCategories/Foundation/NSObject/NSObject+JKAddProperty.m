//
//  NSObject+JKAddProperty.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSObject+JKAddProperty.h"
#import <objc/runtime.h>

//objc_getAssociatedObject和objc_setAssociatedObject都需要指定一个固定的地址，这个固定的地址值用来表示属性的key，起到一个常量的作用。
static const void *JKStringProperty = &JKStringProperty;
static const void *JKIntegerProperty = &JKIntegerProperty;
//static char IntegerProperty;
@implementation NSObject (JKAddProperty)

@dynamic jk_stringProperty;
@dynamic jk_integerProperty;

//set
/**
 *  @brief  catgory runtime实现get set方法增加一个字符串属性
 */
-(void)setJk_stringProperty:(NSString *)jk_stringProperty{
    //use that a static const as the key
    objc_setAssociatedObject(self, JKStringProperty, jk_stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //use that property's selector as the key:
    //objc_setAssociatedObject(self, @selector(stringProperty), stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//get
-(NSString *)jk_stringProperty{
    return objc_getAssociatedObject(self, JKStringProperty);
}

//set
/**
 *  @brief  catgory runtime实现get set方法增加一个NSInteger属性
 */
-(void)setJk_integerProperty:(NSInteger)jk_integerProperty{
    NSNumber *number = [[NSNumber alloc]initWithInteger:jk_integerProperty];
    objc_setAssociatedObject(self,JKIntegerProperty, number, OBJC_ASSOCIATION_ASSIGN);
}
//get
-(NSInteger)jk_integerProperty{
    return [objc_getAssociatedObject(self, JKIntegerProperty) integerValue];
}

@end
