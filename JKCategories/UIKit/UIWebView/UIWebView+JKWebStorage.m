//
//  UIWebView+JKWebStorage.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 2016/12/14.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import "UIWebView+JKWebStorage.h"

static NSString * const jk_kLocalStorageName = @"localStorage";
static NSString * const jk_kSessionStorageName = @"sessionStorage";


@implementation UIWebView (JKWebStorage)
#pragma mark - Local Storage

- (void)jk_setLocalStorageString:(NSString *)string forKey:(NSString *)key {
    [self jk_ip_setString:string forKey:key storage:jk_kLocalStorageName];
}

- (NSString *)jk_localStorageStringForKey:(NSString *)key {
    return [self jk_ip_stringForKey:key storage:jk_kLocalStorageName];
}

- (void)jk_removeLocalStorageStringForKey:(NSString *)key {
    [self jk_ip_removeStringForKey:key storage:jk_kLocalStorageName];
}

- (void)jk_clearLocalStorage {
    [self jk_ip_clearWithStorage:jk_kLocalStorageName];
}

#pragma mark - Session Storage

- (void)jk_setSessionStorageString:(NSString *)string forKey:(NSString *)key {
    [self jk_ip_setString:string forKey:key storage:jk_kSessionStorageName];
}

- (NSString *)jk_sessionStorageStringForKey:(NSString *)key {
    return [self jk_ip_stringForKey:key storage:jk_kSessionStorageName];
}

- (void)jk_removeSessionStorageStringForKey:(NSString *)key {
    [self jk_ip_removeStringForKey:key storage:jk_kSessionStorageName];
}

- (void)jk_clearSessionStorage {
    [self jk_ip_clearWithStorage:jk_kSessionStorageName];
}

#pragma mark - Helpers

- (void)jk_ip_setString:(NSString *)string forKey:(NSString *)key storage:(NSString *)storage {
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.setItem('%@', '%@');", storage, key, string]];
}

- (NSString *)jk_ip_stringForKey:(NSString *)key storage:(NSString *)storage {
    return [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.getItem('%@');", storage, key]];
}

- (void)jk_ip_removeStringForKey:(NSString *)key storage:(NSString *)storage {
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.removeItem('%@');", storage, key]];
}

- (void)jk_ip_clearWithStorage:(NSString *)storage {
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.clear();", storage]];
}
@end
