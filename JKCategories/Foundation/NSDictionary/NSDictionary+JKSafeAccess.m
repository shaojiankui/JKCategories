//
//  NSDictionary+JKSafeAccess.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSDictionary+JKSafeAccess.h"

@implementation NSDictionary (JKSafeAccess)

- (id)jk_objectForKey:(id)key {
    if (key == nil) { return nil; }
    id value = [self objectForKey:key];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

- (id)jk_objectForKey:(id)key class:(Class)aClass {
    id value = [self jk_objectForKey:key];
    if (value && [value isKindOfClass:aClass]) {
        return value;
    }
    return nil;
}

- (char)jk_charForKey:(id)key {
    id value = [self jk_objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value charValue];
    }
    return 0;
}

- (short)jk_shortForKey:(id)key {
    id value = [self jk_objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

- (int)jk_intForKey:(id)key {
    id value = [self jk_objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

- (long)jk_longForKey:(id)key {
    id value = [self jk_objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value longValue];
    }
    return 0;
}

- (float)jk_floatForKey:(id)key {
    id value = [self jk_objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    }
    return 0;
}

- (double)jk_doubleForKey:(id)key {
    id value = [self jk_objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value doubleValue];
    }
    return 0;
}

- (BOOL)jk_boolForKey:(id)key {
    id value = [self jk_objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value boolValue];
    }
    return NO;
}

- (NSInteger)jk_integerForKey:(id)key {
    id value = [self jk_objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value integerValue];
    }
    return 0;
}

- (NSUInteger)jk_unsignedIntegerForKey:(id)key{
    id value = [self jk_objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value unsignedIntegerValue];
    }
    return 0;
}

- (NSString*)jk_stringForKey:(id)key {
    id value = [self jk_objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }
    if ([value respondsToSelector:@selector(stringValue)]) {
        return [value stringValue];
    }
    return nil;
}

- (NSNumber*)jk_numberForKey:(id)key {
    id value = [self jk_objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)value;
    }
    if ([value respondsToSelector:@selector(stringValue)]) {
        NSNumberFormatter *formatter = [NSNumberFormatter new];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        return [formatter numberFromString:(NSString *)value];
    }
    return nil;
}

- (NSDecimalNumber *)jk_decimalNumberForKey:(id)key {
    id value = [self jk_objectForKey:key];
    
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    } else if ([value isKindOfClass:[NSString class]]) {
        NSString *string = (NSString *)value;
        return [string isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:string];
    }
    return nil;
}

- (NSArray *)jk_arrayForKey:(id)key {
    return [self jk_objectForKey:key class:[NSArray class]];
}

- (NSDictionary *)jk_dictionaryForKey:(id)key {
    return [self jk_objectForKey:key class:[NSDictionary class]];
}

- (NSMutableArray *)jk_mutableArrayForKey:(id)key {
    return [self jk_objectForKey:key class:[NSMutableArray class]];
}

- (NSMutableDictionary *)jk_mutableDictionaryForKey:(id)key {
    return [self jk_objectForKey:key class:[NSMutableDictionary class]];
}

- (NSData *)jk_dataForKey:(id)key {
    return [self jk_objectForKey:key class:[NSData class]];
}

- (NSDate *)jk_dateForKey:(id)key dateFormat:(NSString *)dateFormat{
    if ([dateFormat isEqualToString:@""]) {
        return nil;
    }
    
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""]) {
        NSDateFormatter *formater = [[NSDateFormatter alloc]init];
        formater.dateFormat = dateFormat;
        return [formater dateFromString:value];
    }
    return nil;
}

- (CGFloat)jk_CGFloatForKey:(id)key {
    id value = [self jk_objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    }
    return 0;
}

- (CGPoint)jk_pointForKey:(id)key {
    NSString *string = [self jk_stringForKey:key];
    if (string && [string isEqualToString:@""]) {
        return CGPointFromString(string);
    }
    return CGPointZero;
}

- (CGSize)jk_sizeForKey:(id)key {
    NSString *string = [self jk_stringForKey:key];
    if (string && [string isEqualToString:@""]) {
        return CGSizeFromString(string);
    }
    return CGSizeZero;
}

- (CGRect)jk_rectForKey:(id)key {
    NSString *string = [self jk_stringForKey:key];
    if (string && [string isEqualToString:@""]) {
        return CGRectFromString(string);
    }
    return CGRectZero;
}

@end

@implementation NSMutableDictionary (JKSafeAccess)

- (void)jk_setObject:(id)anObject forKey:(NSString *)key {
    if (key && anObject) {
        [self setObject:anObject forKey:key];
    }
}

- (void)jk_removeObjectForKey:(NSString *)key {
    if (key) {
        [self removeObjectForKey:key];
    }
}

- (void)jk_setChar:(char)aChar forKey:(NSString *)key {
    [self jk_setObject:@(aChar) forKey:key];
}

- (void)jk_setInt:(int)aInt forKey:(NSString *)key {
    [self jk_setObject:@(aInt) forKey:key];
}

- (void)jk_setFloat:(float)aFloat forKey:(NSString *)key {
    [self jk_setObject:@(aFloat) forKey:key];
}

- (void)jk_setDouble:(double)aDouble forKey:(NSString *)key {
    [self jk_setObject:@(aDouble) forKey:key];
}

- (void)jk_setLong:(long)aLong forKey:(NSString *)key {
    [self jk_setObject:@(aLong) forKey:key];
}

- (void)jk_setBool:(BOOL)aBool forKey:(NSString *)key {
    [self jk_setObject:@(aBool) forKey:key];
}

- (void)jk_setInteger:(NSInteger)aInteger forKey:(NSString *)key {
    [self jk_setObject:@(aInteger) forKey:key];
}

- (void)jk_setUnsignedInteger:(NSUInteger)aUInteger forKey:(NSString *)key {
    [self jk_setObject:@(aUInteger) forKey:key];
}

- (void)jk_setString:(NSString*)aString forKey:(NSString*)key {
    [self jk_setObject:aString forKey:key];
}

- (void)jk_setCGFloat:(CGFloat)aFloat forKey:(NSString* )key {
    [self jk_setObject:@(aFloat) forKey:key];
}

- (void)jk_setPoint:(CGPoint)aPoint forKey:(NSString *)key {
    [self jk_setObject:NSStringFromCGPoint(aPoint) forKey:key];
}

- (void)jk_setSize:(CGSize)aSize forKey:(NSString *)key {
    [self jk_setObject:NSStringFromCGSize(aSize) forKey:key];
}

- (void)jk_setRect:(CGRect)aRect forKey:(NSString *)key {
    [self jk_setObject:NSStringFromCGRect(aRect) forKey:key];
}

@end
