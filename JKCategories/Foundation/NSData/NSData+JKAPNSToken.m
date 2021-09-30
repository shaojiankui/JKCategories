//
//  NSData+JKAPNSToken.m
//  JKCategories
//
//  Created by Jakey on 15/8/7.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import "NSData+JKAPNSToken.h"
#import <UIKit/UIKit.h>
@implementation NSData (JKAPNSToken)
/**
 *  @brief  将APNS NSData类型token 格式化成字符串
 *
 *  @return 字符串token
 */
- (NSString *)jk_APNSToken {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 13) {
        if (![self isKindOfClass:[NSData class]]) {
            return @"";
        }
        NSUInteger len = [self length];
        char *chars = (char *)[self bytes];
        NSMutableString *hexString = [[NSMutableString alloc]init];
        for (NSUInteger i=0; i<len; i++) {
            [hexString appendString:[NSString stringWithFormat:@"%0.2hhx" , chars[i]]];
        }
        return hexString;
    } else {
         NSString *myToken = [[self description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
        myToken = [myToken stringByReplacingOccurrencesOfString:@" " withString:@""];
        return myToken;
    }
}
@end
