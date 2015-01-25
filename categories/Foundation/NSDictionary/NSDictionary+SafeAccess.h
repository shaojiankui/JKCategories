//
//  NSDictionary+SafeAccess.h
//  IOS-Categories
//
//  Created by Jakey on 15/1/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SafeAccess)
- (NSString*)stringForKey:(NSString*)key;

- (NSNumber*)numberForKey:(NSString*)key;

- (NSArray*)arrayForKey:(NSString*)key;

- (NSDictionary*)dictionaryForKey:(NSString*)key;

- (NSInteger)integerForKey:(id)key;

- (BOOL)boolForKey:(id)key;

- (int16_t)int16ForKey:(id)key;

- (int32_t)int32ForKey:(id)key;

- (int64_t)int64ForKey:(id)key;

- (short)shortForKey:(id)key;

- (float)floatForKey:(id)key;

- (double)doubleForKey:(id)key;

@end
