//
//  NSObject+JKReflection.h
//  NSObject-JKReflection
//
//  Created by Jakey on 15/12/22.
//  Copyright © 2015年 Jakey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JKReflection)
//类名
- (NSString *)jk_className;
+ (NSString *)jk_className;
//父类名称
- (NSString *)jk_superClassName;
+ (NSString *)jk_superClassName;

//实例属性字典
-(NSDictionary *)jk_propertyDictionary;

//属性名称列表
- (NSArray*)jk_propertyKeys;
+ (NSArray *)jk_propertyKeys;

//属性详细信息列表
- (NSArray *)jk_propertiesInfo;
+ (NSArray *)jk_propertiesInfo;

//格式化后的属性列表
+ (NSArray *)jk_propertiesWithCodeFormat;

//方法列表
-(NSArray*)jk_methodList;
+(NSArray*)jk_methodList;

-(NSArray*)jk_methodListInfo;

//创建并返回一个指向所有已注册类的指针列表
+ (NSArray *)jk_registedClassList;
//实例变量
+ (NSArray *)jk_instanceVariable;

//协议列表
-(NSDictionary *)jk_protocolList;
+ (NSDictionary *)jk_protocolList;


- (BOOL)jk_hasPropertyForKey:(NSString*)key;
- (BOOL)jk_hasIvarForKey:(NSString*)key;

@end
