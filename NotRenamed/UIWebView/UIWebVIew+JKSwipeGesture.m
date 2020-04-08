//
//  UIWebVIew+SwipeGesture.m
//  SNSwipeGestureSample
//
//  Created by Noda Shimpei on 2013/05/18.
//  Copyright (c) 2013年 Noda Shimpei. All rights reserved.
//

#import "UIWebVIew+JKSwipeGesture.h"

@interface UIWebView () <UIGestureRecognizerDelegate>

@end

@implementation UIWebView (JKSwipeGesture)

- (void)jk_useSwipeGesture {
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(jk_swipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeRight setNumberOfTouchesRequired:2];
    [swipeRight setDelegate:self];
    [self addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(jk_swipeLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeLeft setNumberOfTouchesRequired:2];
    [swipeLeft setDelegate:self];
    [self addGestureRecognizer:swipeLeft];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan setMaximumNumberOfTouches:2];
    [pan setMinimumNumberOfTouches:2];
    [self addGestureRecognizer:pan];
    
    [pan requireGestureRecognizerToFail:swipeLeft];
    [pan requireGestureRecognizerToFail:swipeRight];
}

- (void)jk_swipeRight:(UISwipeGestureRecognizer *)recognizer {
    if([recognizer numberOfTouches] == 2 && [self canGoBack]) [self goBack];
}

- (void)jk_swipeLeft:(UISwipeGestureRecognizer *)recognizer {
    if([recognizer numberOfTouches] == 2 && [self canGoForward]) [self goForward];
}

@end