//
//  NSArray+JKSafeAccess.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

/**
 Reference:<https://github.com/alibaba/LazyScrollView/TMUtils/NSArray+TMSafeUtils.h>
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (JKSafeAccess)

- (id)jk_objectAtIndex:(NSUInteger)index;
- (id)jk_objectAtIndex:(NSUInteger)index class:(Class)aClass;

- (char)jk_charAtIndex:(NSUInteger)index;
- (short)jk_shortAtIndex:(NSUInteger)index;
- (int)jk_intAtIndex:(NSUInteger)index;
- (long)jk_longAtIndex:(NSUInteger)index;
- (float)jk_floatAtIndex:(NSUInteger)index;
- (double)jk_doubleAtIndex:(NSUInteger)index;
- (bool)jk_boolAtIndex:(NSUInteger)index;

- (NSInteger)jk_integerAtIndex:(NSUInteger)index;
- (NSUInteger)jk_unsignedIntegerAtIndex:(NSUInteger)index;
- (NSString *)jk_stringAtIndex:(NSUInteger)index;
- (NSNumber *)jk_numberAtIndex:(NSUInteger)index;
- (NSDecimalNumber *)jk_decimalNumberAtIndex:(NSUInteger)index;

- (NSArray*)jk_arrayAtIndex:(NSUInteger)index;
- (NSDictionary*)jk_dictionaryAtIndex:(NSUInteger)index;
- (NSMutableArray*)jk_mutableArrayAtIndex:(NSUInteger)index;
- (NSMutableDictionary*)jk_mutableDictionaryAtIndex:(NSUInteger)index;

- (NSData *)jk_dataAtIndex:(NSUInteger)index;
- (NSDate *)jk_dateAtIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;

- (CGFloat)jk_CGFloatAtIndex:(NSUInteger)index;
- (CGPoint)jk_pointAtIndex:(NSUInteger)index;
- (CGSize)jk_sizeAtIndex:(NSUInteger)index;
- (CGRect)jk_rectAtIndex:(NSUInteger)index;

@end

@interface NSMutableArray(JKSafeAccess)

- (void)jk_addObject:(id)anObject;

- (void)jk_addChar:(char)aChar;
- (void)jk_addInt:(int)aInt;
- (void)jk_addFloat:(float)aFloat;
- (void)jk_addBool:(BOOL)aBool;

- (void)jk_addInteger:(NSInteger)aInteger;
- (void)jk_addUnsignedInteger:(NSUInteger)aUInteger;

- (void)jk_addString:(NSString *)aString;

- (void)jk_addCGFloat:(CGFloat)aCGFloat;
- (void)jk_addPoint:(CGPoint)aCGPoint;
- (void)jk_addSize:(CGSize)aCGSize;
- (void)jk_addRect:(CGRect)aCGRect;

- (void)jk_insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)jk_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

- (void)jk_removeObjectAtIndex:(NSUInteger)index;
- (void)jk_removeObject:(id)anObject;

@end
