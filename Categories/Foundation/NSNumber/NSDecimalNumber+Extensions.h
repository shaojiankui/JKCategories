//
//  NSDecimalNumber+Extensions.h
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 11.03.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (Extensions)

- (NSDecimalNumber*)roundToScale:(NSUInteger)scale;
- (NSDecimalNumber*)decimalNumberWithPercentage:(float)percent;
- (NSDecimalNumber*)decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage;
- (NSDecimalNumber*)decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage roundToScale:(NSUInteger)scale;
- (NSDecimalNumber*)discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue;
- (NSDecimalNumber*)discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue roundToScale:(NSUInteger)scale;

@end
