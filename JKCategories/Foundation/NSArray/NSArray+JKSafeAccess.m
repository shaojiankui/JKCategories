//
//  NSArray+JKSafeAccess.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSArray+JKSafeAccess.h"

@implementation NSArray (JKSafeAccess)

- (id)jk_objectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

- (id)jk_objectAtIndex:(NSUInteger)index class:(Class)aClass {
    id value = [self jk_objectAtIndex:index];
    if ([value isKindOfClass:aClass]) {
        return value;
    }
    return nil;
}

- (char)jk_charAtIndex:(NSUInteger)index{
    id value = [self jk_objectAtIndex:index];
    
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}

- (short)jk_shortAtIndex:(NSUInteger)index {
    id value = [self jk_objectAtIndex:index];
    
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value shortValue];
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

- (int)jk_intAtIndex:(NSUInteger)index {
    id value = [self jk_objectAtIndex:index];
    
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

- (long)jk_longAtIndex:(NSUInteger)index {
    id value = [self jk_objectAtIndex:index];
    
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value longValue];
    }
    return 0;
}

- (float)jk_floatAtIndex:(NSUInteger)index {
    id value = [self jk_objectAtIndex:index];
    
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    }
    return 0;
}

- (double)jk_doubleAtIndex:(NSUInteger)index {
    id value = [self jk_objectAtIndex:index];
    
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value doubleValue];
    }
    return 0;
}

- (bool)jk_boolAtIndex:(NSUInteger)index {
    id value = [self jk_objectAtIndex:index];
    
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
    return NO;
}

- (NSInteger)jk_integerAtIndex:(NSUInteger)index {
    id value = [self jk_objectAtIndex:index];
    
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value integerValue];
    }
    return 0;
}

- (NSUInteger)jk_unsignedIntegerAtIndex:(NSUInteger)index {
    id value = [self jk_objectAtIndex:index];
    
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value unsignedIntegerValue];
    }
    return 0;
}

- (NSString *)jk_stringAtIndex:(NSUInteger)index {
    id value = [self jk_objectAtIndex:index];
    
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }
    if ([value respondsToSelector:@selector(stringValue)]) {
        return [value stringValue];
    }
    return nil;
}

- (NSNumber *)jk_numberAtIndex:(NSUInteger)index {
    id value = [self jk_objectAtIndex:index];
    
    if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *formatter = [NSNumberFormatter new];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        return [formatter numberFromString:(NSString *)value];
    }
    
    return nil;
}

- (NSDecimalNumber *)jk_decimalNumberAtIndex:(NSUInteger)index{
    id value = [self jk_objectAtIndex:index];
    
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    } else if ([value isKindOfClass:[NSString class]]) {
        NSString *string = (NSString*)value;
        return [string isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:string];
    }
    return nil;
}

- (NSArray *)jk_arrayAtIndex:(NSUInteger)index {
    return [self jk_objectAtIndex:index class:[NSArray class]];
}

- (NSDictionary *)jk_dictionaryAtIndex:(NSUInteger)index {
    return [self jk_objectAtIndex:index class:[NSDictionary class]];
}

- (NSMutableArray*)jk_mutableArrayAtIndex:(NSUInteger)index {
    return [self jk_objectAtIndex:index class:[NSMutableArray class]];
}

- (NSMutableDictionary*)jk_mutableDictionaryAtIndex:(NSUInteger)index {
    return [self jk_objectAtIndex:index class:[NSMutableDictionary class]];
}

- (NSData *)jk_dataAtIndex:(NSUInteger)index {
    return [self jk_objectAtIndex:index class:[NSData class]];
}

- (NSDate *)jk_dateAtIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat {
    if ([dateFormat isEqualToString:@""]) {
        return nil;
    }

    id value = [self jk_objectAtIndex:index];
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""]) {
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];
        formater.dateFormat = dateFormat;
        return [formater dateFromString:value];
    }
    return nil;
}

- (CGFloat)jk_CGFloatAtIndex:(NSUInteger)index {
    id value = [self jk_objectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    }
    return 0;
}

- (CGPoint)jk_pointAtIndex:(NSUInteger)index {
    NSString *string = [self jk_stringAtIndex:index];
    if (![string isEqualToString:@""]) {
        return CGPointFromString(string);
    }
    return CGPointZero;
}

- (CGSize)jk_sizeAtIndex:(NSUInteger)index {
    NSString *string = [self jk_stringAtIndex:index];
    if (![string isEqualToString:@""]) {
        return CGSizeFromString(string);
    }
    return CGSizeZero;
}

- (CGRect)jk_rectAtIndex:(NSUInteger)index {
    NSString *string = [self jk_stringAtIndex:index];
    if (![string isEqualToString:@""]) {
        return CGRectFromString(string);
    }
    return CGRectZero;
}

@end

@implementation NSMutableArray (JKSafeAccess)

- (void)jk_addObject:(id)anObject {
    if (anObject) {
        [self addObject:anObject];
    }
}

- (void)jk_addChar:(char)aChar {
    [self addObject:@(aChar)];
}

- (void)jk_addInt:(int)aInt {
    [self addObject:@(aInt)];
}

- (void)jk_addFloat:(float)aFloat {
    [self addObject:@(aFloat)];
}

- (void)jk_addBool:(BOOL)aBool {
    [self addObject:@(aBool)];
}

- (void)jk_addInteger:(NSInteger)aInteger {
    [self addObject:@(aInteger)];
}

- (void)jk_addUnsignedInteger:(NSUInteger)aUInteger {
    [self addObject:@(aUInteger)];
}

- (void)jk_addString:(NSString *)aString {
    if (aString) {
        [self addObject:aString];
    }
}

- (void)jk_addCGFloat:(CGFloat)aCGFloat {
   [self addObject:@(aCGFloat)];
}

- (void)jk_addPoint:(CGPoint)aCGPoint {
    [self addObject:NSStringFromCGPoint(aCGPoint)];
}

- (void)jk_addSize:(CGSize)aCGSize {
   [self addObject:NSStringFromCGSize(aCGSize)];
}

- (void)jk_addRect:(CGRect)aCGRect {
    [self addObject:NSStringFromCGRect(aCGRect)];
}

- (void)jk_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject && index <= self.count) {
        [self insertObject:anObject atIndex:index];
    }
}

- (void)jk_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (anObject && index <= self.count) {
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}

- (void)jk_removeObjectAtIndex:(NSUInteger)index {
    if (index <= self.count) {
        [self removeObjectAtIndex:index];
    }
}

- (void)jk_removeObject:(id)anObject {
    if (anObject != nil) {
        [self removeObject:anObject];
    }
}

@end

