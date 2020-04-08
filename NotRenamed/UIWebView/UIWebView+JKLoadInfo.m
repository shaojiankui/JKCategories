//
//  UIWebView+JKLoadStatus.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 2016/12/9.
//  Copyright © 2016年 Jakey. All rights reserved.
//

#import "UIWebView+JKLoadInfo.h"
#import <objc/runtime.h>

static const void *k_jk_loadingCount = &k_jk_loadingCount;
static const void *k_jk_maxLoadCount = &k_jk_maxLoadCount;
static const void *k_jk_currentURL = &k_jk_currentURL;
static const void *k_jk_interactive = &k_jk_interactive;
static const void *k_jk_progress = &k_jk_progress;
static const void *k_jk_contentSize = &k_jk_contentSize;

static const void *k_jk_readyState = &k_jk_readyState;

static const void *k_jk_realDelegate = &k_jk_realDelegate;
static const void *k_jk_webViewLoadChangeBlock = &k_jk_webViewLoadChangeBlock;


NSString *jk_completeRPCURLPath = @"/jkwebviewprogressproxy/complete";

@implementation UIWebView (JKLoadStatus)
-(void)setJk_loadingCount:(NSUInteger)jk_loadingCount{
    NSNumber *number = [[NSNumber alloc]initWithInteger:jk_loadingCount];
    objc_setAssociatedObject(self,k_jk_loadingCount, number, OBJC_ASSOCIATION_ASSIGN);
}

-(NSUInteger)jk_loadingCount{
    return [objc_getAssociatedObject(self, k_jk_loadingCount) integerValue];
}

-(void)setJk_maxLoadCount:(NSUInteger)jk_maxLoadCount{
    NSNumber *number = [[NSNumber alloc]initWithInteger:jk_maxLoadCount];
    objc_setAssociatedObject(self,k_jk_maxLoadCount, number, OBJC_ASSOCIATION_ASSIGN);
}

-(NSUInteger)jk_maxLoadCount{
    return [objc_getAssociatedObject(self, k_jk_maxLoadCount) integerValue];
}

-(void)setJk_currentURL:(NSURL*)jk_currentURL{
    objc_setAssociatedObject(self,k_jk_currentURL, jk_currentURL, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSURL*)jk_currentURL{
    return objc_getAssociatedObject(self, k_jk_currentURL) ;
}

-(void)setJk_interactive:(BOOL)jk_interactive{
    NSNumber *number = [[NSNumber alloc]initWithBool:jk_interactive];
    objc_setAssociatedObject(self,k_jk_interactive, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)jk_interactive{
    return [objc_getAssociatedObject(self, k_jk_interactive) boolValue];
}

-(void)setJk_progress:(float)jk_progress{
    NSNumber *number = [[NSNumber alloc]initWithFloat:jk_progress];
    objc_setAssociatedObject(self,k_jk_progress, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)jk_progress{
    return [objc_getAssociatedObject(self, k_jk_progress) floatValue];
}

-(void)setJk_contentSize:(CGSize)jk_contentSize{
    objc_setAssociatedObject(self,k_jk_progress, NSStringFromCGSize(jk_contentSize), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGSize)jk_contentSize{
    return CGSizeFromString(objc_getAssociatedObject(self, k_jk_progress));
}

-(void)setJk_readyState:(JKReadyState)jk_readyState{
    objc_setAssociatedObject(self,k_jk_readyState, @(jk_readyState), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(JKReadyState)jk_readyState{
    return (JKReadyState)[objc_getAssociatedObject(self, k_jk_readyState) integerValue];
}

-(void)setJk_realDelegate:(id<UIWebViewDelegate>)jk_realDelegate{
    objc_setAssociatedObject(self,k_jk_realDelegate, jk_realDelegate, OBJC_ASSOCIATION_ASSIGN);
}

-(id<UIWebViewDelegate>)jk_realDelegate{
    return objc_getAssociatedObject(self, k_jk_realDelegate);
}

-(void (^)(UIWebView *, float))jk_webViewLoadChangeBlock{
    return objc_getAssociatedObject(self, k_jk_webViewLoadChangeBlock);
}

- (void)setJk_webViewLoadChangeBlock:(jk_webViewLoadChangeBlock)jk_webViewLoadChangeBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, k_jk_webViewLoadChangeBlock, jk_webViewLoadChangeBlock, OBJC_ASSOCIATION_COPY);
}

#pragma mark --delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([request.URL.path isEqualToString:jk_completeRPCURLPath]) {
        [self jk_completeProgress];
        return NO;
    }
    
    BOOL ret = YES;
    if ([self.jk_realDelegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)]) {
        ret = [self.jk_realDelegate webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
    }
    
    BOOL isFragmentJump = NO;
    if (request.URL.fragment) {
        NSString *nonFragmentURL = [request.URL.absoluteString stringByReplacingOccurrencesOfString:[@"#" stringByAppendingString:request.URL.fragment] withString:@""];
        isFragmentJump = [nonFragmentURL isEqualToString:webView.request.URL.absoluteString];
    }
    
    BOOL isTopLevelNavigation = [request.mainDocumentURL isEqual:request.URL];
    
    BOOL isHTTPOrLocalFile = [request.URL.scheme isEqualToString:@"http"] || [request.URL.scheme isEqualToString:@"https"] || [request.URL.scheme isEqualToString:@"file"];
    if (ret && !isFragmentJump && isHTTPOrLocalFile && isTopLevelNavigation) {
        self.jk_currentURL = request.URL;
        [self jk_reset];
    }
    return ret;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    self.jk_readyState = JK_JKReadyState_loading;

    if ([self.jk_realDelegate respondsToSelector:@selector(webViewDidStartLoad:)]) {
        [self.jk_realDelegate webViewDidStartLoad:webView];
    }
    
    self.jk_loadingCount++;
    self.jk_maxLoadCount = fmax(self.jk_maxLoadCount, self.jk_loadingCount);
    [self jk_startProgress];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if ([self.jk_realDelegate respondsToSelector:@selector(webViewDidFinishLoad:)]) {
        [self.jk_realDelegate webViewDidFinishLoad:webView];
    }
   
    self.jk_loadingCount--;
    [self jk_incrementProgress];
    
    NSString *readyState = [webView stringByEvaluatingJavaScriptFromString:@"document.readyState"];
    
    BOOL interactive = [readyState isEqualToString:@"interactive"];
    if (interactive) {
        self.jk_interactive = YES;
        self.jk_readyState = JK_JKReadyState_interactive;
        
        NSString *waitForCompleteJS = [NSString stringWithFormat:@"window.addEventListener('load',function() { var iframe = document.createElement('iframe'); iframe.style.display = 'none'; iframe.src = '%@://%@%@'; document.body.appendChild(iframe);  }, false);", webView.request.mainDocumentURL.scheme, webView.request.mainDocumentURL.host, jk_completeRPCURLPath];
        [webView stringByEvaluatingJavaScriptFromString:waitForCompleteJS];
    }
    
    BOOL isNotRedirect = self.jk_currentURL && [self.jk_currentURL isEqual:webView.request.mainDocumentURL];
    BOOL complete = [readyState isEqualToString:@"complete"];
    if (complete && isNotRedirect) {
        [self jk_completeProgress];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if ([self.jk_realDelegate respondsToSelector:@selector(webView:didFailLoadWithError:)]) {
        [self.jk_realDelegate webView:webView didFailLoadWithError:error];
    }
    
    self.jk_loadingCount--;
    [self jk_incrementProgress];
    
    NSString *readyState = [webView stringByEvaluatingJavaScriptFromString:@"document.readyState"];
    
    BOOL interactive = [readyState isEqualToString:@"interactive"];
    if (interactive) {
        self.jk_interactive = YES;
        NSString *waitForCompleteJS = [NSString stringWithFormat:@"window.addEventListener('load',function() { var iframe = document.createElement('iframe'); iframe.style.display = 'none'; iframe.src = '%@://%@%@'; document.body.appendChild(iframe);  }, false);", webView.request.mainDocumentURL.scheme, webView.request.mainDocumentURL.host, jk_completeRPCURLPath];
        [webView stringByEvaluatingJavaScriptFromString:waitForCompleteJS];
    }
    
    BOOL isNotRedirect = self.jk_currentURL && [self.jk_currentURL isEqual:webView.request.mainDocumentURL];
    BOOL complete = [readyState isEqualToString:@"complete"];
    if ((complete && isNotRedirect) || error) {
        [self jk_completeProgress];
    }
}

- (void)jk_startProgress
{
    if (self.jk_progress < 0.1) {
        [self jk_updateProgress:0.1];
    }
}
- (void)jk_incrementProgress
{
    float progress = self.jk_progress;
    float maxProgress = self.jk_interactive ? 0.9 : 0.5f;
    float remainPercent = (float)self.jk_loadingCount / (float)self.jk_maxLoadCount;
    float increment = (maxProgress - progress) * remainPercent;
    progress += increment;
    progress = fmin(progress, maxProgress);
    [self jk_updateProgress:progress];
}

- (void)jk_completeProgress
{
    self.jk_readyState = JK_JKReadyState_complete;
    [self jk_updateProgress:1.0];
//    CGFloat webViewHeight= [[self stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"]floatValue];
//    NSLog(@"body.offsetHeight:%lf",webViewHeight);
//    
//    CGFloat webViewHeight2=self.scrollView.contentSize.height;
//    NSLog(@"scrollView contentSize:%lf",webViewHeight2);
}

- (void)jk_updateProgress:(float)progress
{
    if (progress > self.jk_progress || progress == 0) {
        self.jk_progress = progress;
        if (self.jk_webViewLoadChangeBlock) {
           self.jk_webViewLoadChangeBlock(self,progress,self.scrollView.contentSize);
        }
    }
}
- (void)jk_reset
{
    self.jk_maxLoadCount = self.jk_loadingCount = 0;
    self.jk_interactive = NO;
    [self jk_updateProgress:0.0];
    self.jk_readyState = JK_JKReadyState_uninitialized;
}
//会影响未包含头文件的webview
//-(void)awakeFromNib{
//    [super awakeFromNib];
//    [self jk_setDelegateIfNoDelegateSet];
//}
//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self jk_setDelegateIfNoDelegateSet];
//    }
//    return self;
//}
#pragma mark - Delegate Forwarder
- (void)jk_setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UIWebViewDelegate>)self) {
        self.jk_realDelegate  = self.delegate;
        self.delegate = (id<UIWebViewDelegate>)self;
    }
}


//- (void)setDelegate:(id<UIWebViewDelegate>)delegate {
//    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0){
//        // UIScrollView delegate keeps some flags that mark whether the delegate implements some methods (like scrollViewDidScroll:)
//        // setting *the same* delegate doesn't recheck the flags, so it's better to simply nil the previous delegate out
//        // we have to setup the realDelegate at first, since the flag check happens in setter
////        [super setDelegate:nil];
////        self.delegate = nil;
//        self.jk_realDelegate = delegate != self ? delegate : nil;
////        [super setDelegate:delegate ? self : nil];
//        self.delegate = delegate ? self : nil;
//        
//    }else {
////        [super setDelegate:delegate];
////        self.delegate = delegate;
//
//    }
//}

//- (BOOL)respondsToSelector:(SEL)selector {
//    return [super respondsToSelector:selector] || [self.jk_realDelegate respondsToSelector:selector];
//}
//- (id)forwardingTargetForSelector:(SEL)selector {
//    id delegate = self.jk_realDelegate;
//    return [delegate respondsToSelector:selector] ? delegate : [super forwardingTargetForSelector:selector];
//}
@end
