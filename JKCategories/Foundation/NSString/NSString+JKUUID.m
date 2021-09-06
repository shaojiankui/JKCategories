//
//  NSString+JKUUID.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSString+JKUUID.h"
#import <UIKit/UIKit.h>

@implementation NSString (JKUUID)

+ (NSString *)jk_UUID {
    if([[[UIDevice currentDevice] systemVersion] floatValue] > 6.0) {
       return  [[NSUUID UUID] UUIDString];
    } else {
        CFUUIDRef uuidRef = CFUUIDCreate(NULL);
        CFStringRef uuid = CFUUIDCreateString(NULL, uuidRef);
        CFRelease(uuidRef);
        return (__bridge_transfer NSString *)uuid;
    }
}

+ (NSString *)jk_UUIDTimestamp {
    return  [[NSNumber numberWithLongLong:[[NSDate date] timeIntervalSince1970]*1000] stringValue];
}

@end
