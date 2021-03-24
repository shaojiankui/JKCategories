//
//  NSString+JKSafe.m
//  JKCategories
//
//  Created by Qilin Hu on 2021/3/24.
//  Copyright © 2021 www.skyfox.org. All rights reserved.
//

#import "NSString+JKSafe.h"

@implementation NSString (JKSafe)

- (BOOL)jk_isNotEmpty {
    return [self length] != 0;
}

- (BOOL)jk_isNotBlank {
    if ([self jk_isNotBlank]) {
        return [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] > 0;
    }
    return NO;
}

@end
