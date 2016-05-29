//
//  NSArray+Block.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (JKBlock)
- (void)jk_each:(void (^)(id object))block;
- (void)jk_eachWithIndex:(void (^)(id object, NSUInteger index))block;
- (NSArray *)jk_map:(id (^)(id object))block;
- (NSArray *)jk_filter:(BOOL (^)(id object))block;
- (NSArray *)jk_reject:(BOOL (^)(id object))block;
- (id)jk_detect:(BOOL (^)(id object))block;
- (id)jk_reduce:(id (^)(id accumulator, id object))block;
- (id)jk_reduce:(id)initial withBlock:(id (^)(id accumulator, id object))block;
@end
