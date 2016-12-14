//
//  UIWebView+JKWebStorage.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 2016/12/14.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//  https://github.com/cprime/UIWebView-WebStorage

#import <UIKit/UIKit.h>

@interface UIWebView (JKWebStorage)
#pragma mark - Local Storage

- (void)jk_setLocalStorageString:(NSString *)string forKey:(NSString *)key;

- (NSString *)jk_localStorageStringForKey:(NSString *)key;

- (void)jk_removeLocalStorageStringForKey:(NSString *)key;

- (void)jk_clearLocalStorage;

#pragma mark - Session Storage

- (void)jk_setSessionStorageString:(NSString *)string forKey:(NSString *)key;

- (NSString *)jk_sessionStorageStringForKey:(NSString *)key;

- (void)jk_removeSessionStorageStringForKey:(NSString *)key;

- (void)jk_clearSessionStorage;

@end
