//
//  NSDictionary+JKBlock.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JKBlock)

#pragma mark - RX
- (void)jk_each:(void (^)(id k, id v))block;
- (void)jk_eachKey:(void (^)(id k))block;
- (void)jk_eachValue:(void (^)(id v))block;
- (NSArray *)jk_map:(id (^)(id key, id value))block;
- (NSDictionary *)jk_pick:(NSArray *)keys;
- (NSDictionary *)jk_omit:(NSArray *)key;

@end
