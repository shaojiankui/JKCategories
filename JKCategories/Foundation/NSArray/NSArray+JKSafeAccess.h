//
//  NSArray+JKSafeAccess.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (JKSafeAccess)
-(id)jk_objectWithIndex:(NSUInteger)index;

- (NSString*)jk_stringWithIndex:(NSUInteger)index;

- (NSNumber*)jk_numberWithIndex:(NSUInteger)index;

- (NSDecimalNumber *)jk_decimalNumberWithIndex:(NSUInteger)index;

- (NSArray*)jk_arrayWithIndex:(NSUInteger)index;

- (NSDictionary*)jk_dictionaryWithIndex:(NSUInteger)index;

- (NSInteger)jk_integerWithIndex:(NSUInteger)index;

- (NSUInteger)jk_unsignedIntegerWithIndex:(NSUInteger)index;

- (BOOL)jk_boolWithIndex:(NSUInteger)index;

- (int16_t)jk_int16WithIndex:(NSUInteger)index;

- (int32_t)jk_int32WithIndex:(NSUInteger)index;

- (int64_t)jk_int64WithIndex:(NSUInteger)index;

- (char)jk_charWithIndex:(NSUInteger)index;

- (short)jk_shortWithIndex:(NSUInteger)index;

- (float)jk_floatWithIndex:(NSUInteger)index;

- (double)jk_doubleWithIndex:(NSUInteger)index;

- (NSDate *)jk_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;
//CG
- (CGFloat)jk_CGFloatWithIndex:(NSUInteger)index;

- (CGPoint)jk_pointWithIndex:(NSUInteger)index;

- (CGSize)jk_sizeWithIndex:(NSUInteger)index;

- (CGRect)jk_rectWithIndex:(NSUInteger)index;
@end


#pragma --mark NSMutableArray setter

@interface NSMutableArray(JKSafeAccess)

-(void)jk_addObj:(id)i;

-(void)jk_addString:(NSString*)i;

-(void)jk_addBool:(BOOL)i;

-(void)jk_addInt:(int)i;

-(void)jk_addInteger:(NSInteger)i;

-(void)jk_addUnsignedInteger:(NSUInteger)i;

-(void)jk_addCGFloat:(CGFloat)f;

-(void)jk_addChar:(char)c;

-(void)jk_addFloat:(float)i;

-(void)jk_addPoint:(CGPoint)o;

-(void)jk_addSize:(CGSize)o;

-(void)jk_addRect:(CGRect)o;
@end