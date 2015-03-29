//
//  NSObject+GCD.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSObject (GCD)
- (void)performOnMainThread:(void(^)(void))block wait:(BOOL)wait;
- (void)performAsynchronous:(void(^)(void))block;
- (void)performAfter:(NSTimeInterval)seconds block:(void(^)(void))block;
@end