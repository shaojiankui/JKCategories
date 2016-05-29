
//
//  NSNumber+CGFloat.h
//
//  Created by Alexey Aleshkov on 16.02.14.
//  Copyright (c) 2014 Alexey Aleshkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSNumber (JKCGFloat)

- (CGFloat)jk_CGFloatValue;

- (id)initWithJKCGFloat:(CGFloat)value;

+ (NSNumber *)jk_numberWithCGFloat:(CGFloat)value;

@end