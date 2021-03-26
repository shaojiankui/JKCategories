//
//  NSDictionary+RemoveNullValue.m
//  JKCategories
//
//  Created by Qilin Hu on 2021/3/26.
//  Copyright © 2021 www.skyfox.org. All rights reserved.
//

#import "NSDictionary+RemoveNullValue.h"

@implementation NSDictionary (RemoveNullValue)

- (NSDictionary *)jk_removeNullValue {
    NSMutableDictionary *prunedDict = [self mutableCopy];
    
    NSArray *keysForNullValue = [self allKeysForObject:[NSNull null]];
    [prunedDict removeObjectForKey:keysForNullValue];
    
    NSArray *keysForEmptyValye = [self allKeysForObject:@""];
    [prunedDict removeObjectForKey:keysForEmptyValye];
    
    return [prunedDict copy];
}

@end
