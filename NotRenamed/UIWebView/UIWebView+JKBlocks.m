//
//  UIWebView+Blocks.m
//
//  Created by Shai Mishali on 1/1/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import "UIWebView+JKBlocks.h"

static void (^__jk_loadedBlock)(UIWebView *webView);
static void (^__jk_failureBlock)(UIWebView *webView, NSError *error);
static void (^__jk_loadStartedBlock)(UIWebView *webView);
static BOOL (^__jk_shouldLoadBlock)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType);

static uint __jk_loadedWebItems;

@implementation UIWebView (JKBlock)

#pragma mark - UIWebView+Blocks

+(UIWebView *)jk_loadRequest:(NSURLRequest *)request
                   loaded:(void (^)(UIWebView *webView))loadedBlock
                   failed:(void (^)(UIWebView *webView, NSError *error))failureBlock{

    return [self jk_loadRequest:request loaded:loadedBlock failed:failureBlock loadStarted:nil shouldLoad:nil];
}

+(UIWebView *)jk_loadHTMLString:(NSString *)htmlString
                      loaded:(void (^)(UIWebView *webView))loadedBlock
                      failed:(void (^)(UIWebView *webView, NSError *error))failureBlock{
    
    return [self jk_loadHTMLString:htmlString loaded:loadedBlock failed:failureBlock loadStarted:nil shouldLoad:nil];
}

+(UIWebView *)jk_loadHTMLString:(NSString *)htmlString
                      loaded:(void (^)(UIWebView *))loadedBlock
                      failed:(void (^)(UIWebView *, NSError *))failureBlock
                 loadStarted:(void (^)(UIWebView *webView))loadStartedBlock
                  shouldLoad:(BOOL (^)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType))shouldLoadBlock{
    __jk_loadedWebItems = 0;
    __jk_loadedBlock = loadedBlock;
    __jk_failureBlock = failureBlock;
    __jk_loadStartedBlock = loadStartedBlock;
    __jk_shouldLoadBlock = shouldLoadBlock;
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = (id)[self class];
    [webView loadHTMLString:htmlString baseURL:nil];
    
    return webView;
}

+(UIWebView *)jk_loadRequest:(NSURLRequest *)request
                   loaded:(void (^)(UIWebView *webView))loadedBlock
                   failed:(void (^)(UIWebView *webView, NSError *error))failureBlock
              loadStarted:(void (^)(UIWebView *webView))loadStartedBlock
               shouldLoad:(BOOL (^)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType))shouldLoadBlock{
    __jk_loadedWebItems    = 0;
    
    __jk_loadedBlock       = loadedBlock;
    __jk_failureBlock      = failureBlock;
    __jk_loadStartedBlock  = loadStartedBlock;
    __jk_shouldLoadBlock   = shouldLoadBlock;
    
    UIWebView *webView  = [[UIWebView alloc] init];
    webView.delegate    = (id) [self class];
    
    [webView loadRequest: request];
    
    return webView;
}

#pragma mark - Private Static delegate
+(void)webViewDidFinishLoad:(UIWebView *)webView{
    __jk_loadedWebItems--;
    
    if(__jk_loadedBlock && (!TRUE_END_REPORT || __jk_loadedWebItems == 0)){
        __jk_loadedWebItems = 0;
        __jk_loadedBlock(webView);
    }
}

+(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{    
    __jk_loadedWebItems--;
    
    if(__jk_failureBlock)
        __jk_failureBlock(webView, error);
}

+(void)webViewDidStartLoad:(UIWebView *)webView{    
    __jk_loadedWebItems++;
    
    if(__jk_loadStartedBlock && (!TRUE_END_REPORT || __jk_loadedWebItems > 0))
        __jk_loadStartedBlock(webView);
}

+(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if(__jk_shouldLoadBlock)
        return __jk_shouldLoadBlock(webView, request, navigationType);
    
    return YES;
}

@end
