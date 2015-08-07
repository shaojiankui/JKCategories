//
//  NSRunLoop+PerformBlock.h
//  IOS-Categories
//
//  Created by Jakey on 15/8/7.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//
//  https://github.com/ishkawa/NSRunLoop-PerformBlock
#import <Foundation/Foundation.h>

extern NSString *const NSRunloopTimeoutException;

@interface NSRunLoop (PerformBlock)

- (void)performBlockAndWait:(void (^)(BOOL *finish))block;
- (void)performBlockAndWait:(void (^)(BOOL *finish))block timeoutInterval:(NSTimeInterval)timeoutInterval;

@end