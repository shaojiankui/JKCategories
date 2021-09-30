//
//  NSArray+Block.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray<__covariant ObjectType> (JKBlock)
- (void)jk_each:(void (^)(ObjectType object))block;
- (void)jk_eachWithIndex:(void (^)(ObjectType object, NSUInteger index))block;
- (NSArray *)jk_map:(id (^)(ObjectType object))block;
- (NSArray *)jk_filter:(BOOL (^)(ObjectType object))block;
- (NSArray <ObjectType>*)jk_reject:(BOOL (^)(ObjectType object))block;
- (ObjectType)jk_detect:(BOOL (^)(ObjectType object))block;
- (id)jk_reduce:(id (^)(id accumulator, ObjectType object))block;
- (id)jk_reduce:(id)initial withBlock:(id (^)(id accumulator, ObjectType object))block;
@end
