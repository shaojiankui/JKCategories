//
//  NSString+Trims.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/3/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Trims)
- (NSString *)stringByStrippingHTML;
- (NSString *)stringByRemovingScriptsAndStrippingHTML;

- (NSString *)trimmingWhitespace;
- (NSString *)trimmingWhitespaceAndNewlines;
@end
