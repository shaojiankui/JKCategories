//
//  UIWebView+loadURL.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIWebView+Load.h"

@implementation UIWebView (Load)
- (void)loadURL:(NSString*)URLString{
    NSString *encodedUrl = (__bridge NSString *) CFURLCreateStringByAddingPercentEscapes (NULL, (__bridge CFStringRef) URLString, NULL, NULL,kCFStringEncodingUTF8);
    NSURL *url = [NSURL URLWithString:encodedUrl];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self loadRequest:req];
}
- (void)loadHtml:(NSString*)htmlName{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:htmlName ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self loadRequest:request];
}

- (void)clearCookies
{
    NSHTTPCookieStorage *storage = NSHTTPCookieStorage.sharedHTTPCookieStorage;
    
    for (NSHTTPCookie *cookie in storage.cookies)
        [storage deleteCookie:cookie];
    
    [NSUserDefaults.standardUserDefaults synchronize];
}
@end
