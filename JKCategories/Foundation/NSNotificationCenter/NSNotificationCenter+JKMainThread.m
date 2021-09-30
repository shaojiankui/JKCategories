//
//  NSNotificationCenter+MainThread.m
//  Elly
//
//  Created by Milot Shala on 1/12/15.
//  Copyright (c) 2015 Milot Shala. All rights reserved.
//

#import "NSNotificationCenter+JKMainThread.h"

@implementation NSNotificationCenter (JKMainThread)

- (void)jk_postNotificationOnMainThread:(NSNotification *)notification
{
    [self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:YES];
}

- (void)jk_postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject
{
    NSNotification *notification = [NSNotification notificationWithName:aName object:anObject];
    [self jk_postNotificationOnMainThread:notification];
}

- (void)jk_postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    NSNotification *notification = [NSNotification notificationWithName:aName object:anObject userInfo:aUserInfo];
    [self jk_postNotificationOnMainThread:notification];
}

@end
