//
//  NSData+JKAPNSToken.m
//  JKCategories
//
//  Created by Jakey on 15/8/7.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import "NSData+JKAPNSToken.h"

@implementation NSData (JKAPNSToken)

- (NSString *)jk_APNSToken {
    const char *data = [self bytes];
    NSMutableString *token = [NSMutableString string];
    
    for (int i = 0; i < self.length; i++) {
        [token appendFormat:@"%02.2hhx", data[i]];
    }
    return [token copy];
}

@end
