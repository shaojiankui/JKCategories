//
//  NSNumber+CGFloat.m
//
//  Created by Alexey Aleshkov on 16.02.14.
//  Copyright (c) 2014 Alexey Aleshkov. All rights reserved.
//

#import "NSNumber+JKCGFloat.h"

@implementation NSNumber (JKCGFloat)

- (CGFloat)jk_CGFloatValue
{
#if (CGFLOAT_IS_DOUBLE == 1)
    CGFloat result = [self doubleValue];
#else
    CGFloat result = [self floatValue];
#endif
    return result;
}

- (id)initWithJKCGFloat:(CGFloat)value
{
#if (CGFLOAT_IS_DOUBLE == 1)
    self = [self initWithDouble:value];
#else
    self = [self initWithFloat:value];
#endif
    return self;
}

+ (NSNumber *)jk_numberWithCGFloat:(CGFloat)value
{
    NSNumber *result = [[self alloc] initWithJKCGFloat:value];
    return result;
}

@end