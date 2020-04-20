//
//  NSDictionary+JKBlock.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary<__covariant KeyType, __covariant ObjectType> (JKBlock)

#pragma mark - RX
- (void)jk_each:(void (^)(KeyType k, ObjectType v))block;
- (void)jk_eachKey:(void (^)(KeyType k))block;
- (void)jk_eachValue:(void (^)(ObjectType v))block;
- (NSArray *)jk_map:(id (^)(KeyType key, ObjectType value))block;
- (NSDictionary <KeyType, id>*)jk_mapValues:(id (^)(ObjectType value))block;
- (NSDictionary *)jk_pick:(NSArray *)keys;
- (NSDictionary *)jk_omit:(NSArray *)key;

@end
