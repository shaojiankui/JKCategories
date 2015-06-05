//
//  NSNotificationCenter+MainThread.m
//  Elly
//
//  Created by Milot Shala on 1/12/15.
//  Copyright (c) 2015 Milot Shala. All rights reserved.
//

#import "NSNotificationCenter+MainThread.h"

@implementation NSNotificationCenter (MainThread)

- (void)postNotificationOnMainThread:(NSNotification *)notification
{
    [self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:YES];
}

- (void)postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject
{
    NSNotification *notification = [NSNotification notificationWithName:aName object:anObject];
    [self postNotificationOnMainThread:notification];
}

- (void)postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    NSNotification *notification = [NSNotification notificationWithName:aName object:anObject userInfo:aUserInfo];
    [self postNotificationOnMainThread:notification];
}

@end