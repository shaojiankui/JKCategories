//
//  UIViewController+ScrollingStatusBar.m
//  UIViewControllerScrollingStatusBar
//
//  Created by Anton Domashnev on 25.06.14.
//  Copyright (c) 2014 Anton Domashnev. All rights reserved.
//

#import "UIViewController+JKScrollingStatusBar.h"

#import <objc/runtime.h>

@interface ADScrollingHandler : NSObject

- (instancetype)initWithDidScrollBlock:(void(^)(UIScrollView *scrollView))didScrollBlock;

@end

NSString* const ADScrollingHandlerDidScrollBlock = @"ADScrollingHandlerDidScrollBlock";

@implementation ADScrollingHandler

- (instancetype)initWithDidScrollBlock:(void(^)(UIScrollView *scrollView))didScrollBlock
{
    if(self = [super init]){
        self.didScrollBlock = didScrollBlock;
    }
    return self;
}

#pragma mark - Properties

- (void)setDidScrollBlock:(void(^)(UITableView *tableView))didScrollBlock
{
    objc_setAssociatedObject(self, (__bridge const void *)(ADScrollingHandlerDidScrollBlock), didScrollBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void(^)(UITableView *tableView))didScrollBlock
{
    return objc_getAssociatedObject(self, (__bridge const void *)(ADScrollingHandlerDidScrollBlock));
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(![keyPath isEqualToString:@"contentOffset"]){
        return;
    }
    
    if(self.didScrollBlock){
        self.didScrollBlock(object);
    }
}

@end


@interface ADStatusBarWindow : UIWindow

@end

@implementation ADStatusBarWindow

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    /*
     20 points hardcoded for performance reason (default portrait status bar height)
     */
    return point.y <= 20.;
}

@end


NSString* const UIViewControllerScrollingStatusBarContext = @"UIViewControllerScrollingStatusBarContext";
NSString* const UIViewControllerScrollingHandler = @"UIViewControllerScrollingHandler";
NSString* const UIViewControllerStatusBarView = @"UIViewControllerStatusBarView";
NSString* const UIViewControllerScrollView = @"UIViewControllerScrollView";

@implementation UIViewController (ScrollingStatusBar)

#pragma mark - Properties

- (void)setJk_scrollingHandler:(ADScrollingHandler *)handler
{
    objc_setAssociatedObject(self, (__bridge const void *)(UIViewControllerScrollingHandler), handler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ADScrollingHandler *)jk_scrollingHandler
{
    return objc_getAssociatedObject(self, (__bridge const void *)(UIViewControllerScrollingHandler));
}

- (void)setJk_statusBarView:(UIView *)statusBarView
{
    objc_setAssociatedObject(self, (__bridge const void *)(UIViewControllerStatusBarView), statusBarView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)jk_statusBarView
{
    return objc_getAssociatedObject(self, (__bridge const void *)(UIViewControllerStatusBarView));
}

- (void)setJk_scrollView:(UIScrollView *)scrollView
{
    objc_setAssociatedObject(self, (__bridge const void *)(UIViewControllerScrollView), scrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIScrollView *)jk_scrollView
{
    return objc_getAssociatedObject(self, (__bridge const void *)(UIViewControllerScrollView));
}

#pragma mark - Gestures

- (void)statusBarViewTap:(UITapGestureRecognizer *)tap
{
    [self.jk_scrollView setContentOffset:CGPointMake(0, -self.jk_scrollView.contentInset.top) animated:YES];
}

#pragma mark - UI

static UIWindow *fakeStatusBarWindow = nil;
- (UIWindow *)fakeStatusBarWindow
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fakeStatusBarWindow = [[ADStatusBarWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        fakeStatusBarWindow.backgroundColor = [UIColor clearColor];
        fakeStatusBarWindow.userInteractionEnabled = YES;
        fakeStatusBarWindow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        fakeStatusBarWindow.windowLevel = UIWindowLevelStatusBar;
        fakeStatusBarWindow.hidden = NO;
    });
    return fakeStatusBarWindow;
}

- (void)createStatusBarView
{
    CGRect frame = [UIApplication sharedApplication].statusBarFrame;
    frame.size.height *= 2;
    self.jk_statusBarView = [[UIView alloc] initWithFrame:frame];
    self.jk_statusBarView.clipsToBounds = YES;
    self.jk_statusBarView.backgroundColor = [UIColor clearColor];
    UIView *statusBarImageView = [[UIScreen mainScreen] snapshotViewAfterScreenUpdates:NO];
    UIView *statusBarImageViewClipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height * 0.5)];
    statusBarImageViewClipView.clipsToBounds = YES;
    [statusBarImageViewClipView addSubview:statusBarImageView];
    [self.jk_statusBarView addSubview:statusBarImageViewClipView];
    [self.jk_statusBarView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(statusBarViewTap:)]];
    [self.fakeStatusBarWindow addSubview:self.jk_statusBarView];
}

#pragma mark - Helpers

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if(offsetY > -scrollView.contentInset.top){
        if(!self.jk_statusBarView){
            [self createStatusBarView];
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
        }
        self.jk_statusBarView.frame = (CGRect){.origin = CGPointMake(self.jk_statusBarView.frame.origin.x, MAX(-self.jk_statusBarView.frame.size.height * 0.5, -scrollView.contentInset.top - offsetY)), .size = self.jk_statusBarView.frame.size};
    }
    else{
        if(self.jk_statusBarView){
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
            [self.jk_statusBarView removeFromSuperview];
            self.jk_statusBarView = nil;
        }
    }
}

#pragma mark - Interface

- (void)jk_enableStatusBarScrollingAlongScrollView:(UIScrollView *)scrollView
{
    NSParameterAssert(scrollView);
    
    __weak id wSelf = self;
    self.jk_scrollingHandler = [[ADScrollingHandler alloc] initWithDidScrollBlock:^(UIScrollView *scrollView) {
        [wSelf scrollViewDidScroll:scrollView];
    }];
    
    self.jk_scrollView = scrollView;
    [scrollView addObserver:self.jk_scrollingHandler forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:(__bridge void *)(UIViewControllerScrollingStatusBarContext)];
}

- (void)jk_disableStatusBarScrollingAlongScrollView:(UITableView *)scrollView
{
    self.jk_scrollView = nil;
    [scrollView removeObserver:self.jk_scrollingHandler forKeyPath:@"contentOffset" context:(__bridge void *)(UIViewControllerScrollingStatusBarContext)];
}

@end
