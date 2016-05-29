//
//  UIWebView+TS_JavaScriptContext.m
//
//  Created by Nicholas Hodapp on 11/15/13.
//  Copyright (c) 2013 CoDeveloper, LLC. All rights reserved.
//

#import "UIWebView+JKTS_JavaScriptContext.h"

#import <JavaScriptCore/JavaScriptCore.h>
#import <objc/runtime.h>

static const char kJKTSJavaScriptContext[] = "jk_ts_javaScriptContext";

static NSHashTable* jk_g_webViews = nil;

@interface UIWebView (TS_JavaScriptCore_private)
- (void) jk_ts_didCreateJavaScriptContext:(JSContext *)ts_javaScriptContext;
@end

@protocol TSWebFrame <NSObject>
- (id) parentFrame;
@end

@implementation NSObject (JKTS_JavaScriptContext)

- (void) webView: (id) unused didCreateJavaScriptContext: (JSContext*) ctx forFrame: (id<TSWebFrame>) frame
{
    NSParameterAssert( [frame respondsToSelector: @selector( parentFrame )] );
    
    // only interested in root-level frames
    if ( [frame respondsToSelector: @selector( parentFrame) ] && [frame parentFrame] != nil )
        return;
    
    void (^notifyDidCreateJavaScriptContext)() = ^{
        
        for ( UIWebView* webView in jk_g_webViews )
        {
            NSString* cookie = [NSString stringWithFormat: @"jk_ts_jscWebView_%lud", (unsigned long)webView.hash ];
            
            [webView stringByEvaluatingJavaScriptFromString: [NSString stringWithFormat: @"var %@ = '%@'", cookie, cookie ] ];
            
            if ( [ctx[cookie].toString isEqualToString: cookie] )
            {
                [webView jk_ts_didCreateJavaScriptContext: ctx];
                return;
            }
        }
    };
    
    if ( [NSThread isMainThread] )
    {
        notifyDidCreateJavaScriptContext();
    }
    else
    {
        dispatch_async( dispatch_get_main_queue(), notifyDidCreateJavaScriptContext );
    }
}

@end


@implementation UIWebView (TS_JavaScriptContext)

+ (id) allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        jk_g_webViews = [NSHashTable weakObjectsHashTable];
    });
    
    NSAssert( [NSThread isMainThread], @"uh oh - why aren't we on the main thread?");

    id webView = [super allocWithZone: zone];

    [jk_g_webViews addObject: webView];
    
    return webView;
}

- (void)jk_ts_didCreateJavaScriptContext:(JSContext *)ts_javaScriptContext
{
    [self willChangeValueForKey: @"jk_ts_javaScriptContext"];
    
    objc_setAssociatedObject( self, kJKTSJavaScriptContext, ts_javaScriptContext, OBJC_ASSOCIATION_RETAIN);

    [self didChangeValueForKey: @"jk_ts_javaScriptContext"];
    
    if ( [self.delegate respondsToSelector: @selector(webView:didCreateJavaScriptContext:)] )
    {
        id<JKTSWebViewDelegate> delegate = ( id<JKTSWebViewDelegate>)self.delegate;
        [delegate webView: self didCreateJavaScriptContext: ts_javaScriptContext];
    }
}

- (JSContext*) jk_ts_javaScriptContext
{
    JSContext* javaScriptContext = objc_getAssociatedObject( self, kJKTSJavaScriptContext );
    
    return javaScriptContext;
}

@end