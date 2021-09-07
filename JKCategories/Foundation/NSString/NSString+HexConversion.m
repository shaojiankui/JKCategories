//
//  NSString+HexConversion.m
//  JKCategories
//
//  Created by Qilin Hu on 2021/3/24.
//  Copyright © 2020 Qilin Hu. All rights reserved.
//

#import "NSString+HexConversion.h"
#import <CoreFoundation/CFString.h>
#include <stdlib.h>

@implementation NSString (HexConversion)

- (NSInteger)hexValue {
    CFStringRef cfSelf = (__bridge CFStringRef)self;
    UInt8 buffer[64];
    const char *cptr;
    
    if((cptr = CFStringGetCStringPtr(cfSelf, kCFStringEncodingMacRoman)) == NULL) {
        CFRange range     = CFRangeMake(0L, CFStringGetLength(cfSelf));
        CFIndex usedBytes = 0L;
        CFStringGetBytes(cfSelf, range, kCFStringEncodingUTF8, '?', false, buffer, 60L, &usedBytes);
        buffer[usedBytes] = 0;
        cptr              = (const char *)buffer;
    }
    
    return((NSInteger)strtol(cptr, NULL, 16));
}

@end
