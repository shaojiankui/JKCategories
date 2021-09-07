//
//  NSDictionary+JKSafeAccess.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

/**
 Reference:
   * <https://github.com/alibaba/LazyScrollView/TMUtils/NSDictionary+TMSafeUtils.h>
   * <https://github.com/Anonymous-Monk/MSCrashProtector>
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (JKSafeAccess)

- (id)jk_objectForKey:(id)key;
- (id)jk_objectForKey:(id)key class:(Class)aClass;

- (char)jk_charForKey:(id)key;
- (short)jk_shortForKey:(id)key;
- (int)jk_intForKey:(id)key;
- (long)jk_longForKey:(id)key;
- (float)jk_floatForKey:(id)key;
- (double)jk_doubleForKey:(id)key;
- (BOOL)jk_boolForKey:(id)key;

- (NSInteger)jk_integerForKey:(id)key;
- (NSUInteger)jk_unsignedIntegerForKey:(id)key;

- (NSString *)jk_stringForKey:(id)key;
- (NSNumber *)jk_numberForKey:(id)key;
- (NSDecimalNumber *)jk_decimalNumberForKey:(id)key;

- (NSArray *)jk_arrayForKey:(id)key;
- (NSDictionary *)jk_dictionaryForKey:(id)key;
- (NSMutableArray *)jk_mutableArrayForKey:(id)key;
- (NSMutableDictionary *)jk_mutableDictionaryForKey:(id)key;

- (NSData *)jk_dataForKey:(id)key;
- (NSDate *)jk_dateForKey:(id)key dateFormat:(NSString *)dateFormat;

- (CGFloat)jk_CGFloatForKey:(id)key;
- (CGPoint)jk_pointForKey:(id)key;
- (CGSize)jk_sizeForKey:(id)key;
- (CGRect)jk_rectForKey:(id)key;

@end

#pragma mark - NSMutableDictionary setter

@interface NSMutableDictionary(SafeAccess)

- (void)jk_setObject:(id)anObject forKey:(NSString *)key;
- (void)jk_removeObjectForKey:(NSString *)key;

- (void)jk_setChar:(char)aChar forKey:(NSString *)key;
- (void)jk_setInt:(int)aInt forKey:(NSString *)key;
- (void)jk_setFloat:(float)aFloat forKey:(NSString *)key;
- (void)jk_setDouble:(double)aDouble forKey:(NSString *)key;
- (void)jk_setLong:(long)aLong forKey:(NSString *)key;
- (void)jk_setBool:(BOOL)aBool forKey:(NSString *)key;

- (void)jk_setInteger:(NSInteger)aInteger forKey:(NSString *)key;
- (void)jk_setUnsignedInteger:(NSUInteger)aUInteger forKey:(NSString *)key;

- (void)jk_setString:(NSString *)aString forKey:(NSString *)key;

- (void)jk_setCGFloat:(CGFloat)aFloat forKey:(NSString* )key;
- (void)jk_setPoint:(CGPoint)aPoint forKey:(NSString *)key;
- (void)jk_setSize:(CGSize)aSize forKey:(NSString *)key;
- (void)jk_setRect:(CGRect)aRect forKey:(NSString *)key;

@end
