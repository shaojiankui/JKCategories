//
//  UIWebView+TS_JavaScriptContext.h
//  testJSWebView
//
//  Created by Nicholas Hodapp on 11/15/13.
//  Copyright (c) 2013 CoDeveloper, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JKTSWebViewDelegate <UIWebViewDelegate>

@optional

- (void)webView:(UIWebView *)webView didCreateJavaScriptContext:(JSContext*) ctx;

@end


@interface UIWebView (JKTS_JavaScriptContext)

@property (nonatomic, readonly) JSContext* jk_ts_javaScriptContext;

@end
