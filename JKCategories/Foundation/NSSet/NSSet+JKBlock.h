//
//  NSSet+Block.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet<__covariant ObjectType> (JKBlock)
- (void)jk_each:(void (^)(ObjectType))block;
- (void)jk_eachWithIndex:(void (^)(ObjectType object, int idx))block;
- (NSArray *)jk_map:(id (^)(ObjectType object))block;
- (NSArray <ObjectType>*)jk_select:(BOOL (^)(ObjectType object))block;
- (NSArray <ObjectType>*)jk_reject:(BOOL (^)(ObjectType object))block;
- (NSArray <ObjectType>*)jk_sort;
- (id)jk_reduce:(id(^)(id accumulator, ObjectType object))block;
- (id)jk_reduce:(id)initial withBlock:(id(^)(id accumulator, id ObjectType))block;
@end
