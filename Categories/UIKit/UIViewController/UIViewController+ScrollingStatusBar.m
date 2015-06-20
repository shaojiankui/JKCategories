//
//  UIViewController+ScrollingStatusBar.m
//  UIViewControllerScrollingStatusBar
//
//  Created by Anton Domashnev on 25.06.14.
//  Copyright (c) 2014 Anton Domashnev. All rights reserved.
//

#import "UIViewController+ScrollingStatusBar.h"

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

- (void)setScrollingHandler:(ADScrollingHandler *)handler
{
    objc_setAssociatedObject(self, (__bridge const void *)(UIViewControllerScrollingHandler), handler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ADScrollingHandler *)scrollingHandler
{
    return objc_getAssociatedObject(self, (__bridge const void *)(UIViewControllerScrollingHandler));
}

- (void)setStatusBarView:(UIView *)statusBarView
{
    objc_setAssociatedObject(self, (__bridge const void *)(UIViewControllerStatusBarView), statusBarView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)statusBarView
{
    return objc_getAssociatedObject(self, (__bridge const void *)(UIViewControllerStatusBarView));
}

- (void)setScrollView:(UIScrollView *)scrollView
{
    objc_setAssociatedObject(self, (__bridge const void *)(UIViewControllerScrollView), scrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIScrollView *)scrollView
{
    return objc_getAssociatedObject(self, (__bridge const void *)(UIViewControllerScrollView));
}

#pragma mark - Gestures

- (void)statusBarViewTap:(UITapGestureRecognizer *)tap
{
    [self.scrollView setContentOffset:CGPointMake(0, -self.scrollView.contentInset.top) animated:YES];
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
    self.statusBarView = [[UIView alloc] initWithFrame:frame];
    self.statusBarView.clipsToBounds = YES;
    self.statusBarView.backgroundColor = [UIColor clearColor];
    UIView *statusBarImageView = [[UIScreen mainScreen] snapshotViewAfterScreenUpdates:NO];
    UIView *statusBarImageViewClipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height * 0.5)];
    statusBarImageViewClipView.clipsToBounds = YES;
    [statusBarImageViewClipView addSubview:statusBarImageView];
    [self.statusBarView addSubview:statusBarImageViewClipView];
    [self.statusBarView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(statusBarViewTap:)]];
    [self.fakeStatusBarWindow addSubview:self.statusBarView];
}

#pragma mark - Helpers

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if(offsetY > -scrollView.contentInset.top){
        if(!self.statusBarView){
            [self createStatusBarView];
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
        }
        self.statusBarView.frame = (CGRect){.origin = CGPointMake(self.statusBarView.frame.origin.x, MAX(-self.statusBarView.frame.size.height * 0.5, -scrollView.contentInset.top - offsetY)), .size = self.statusBarView.frame.size};
    }
    else{
        if(self.statusBarView){
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
            [self.statusBarView removeFromSuperview];
            self.statusBarView = nil;
        }
    }
}

#pragma mark - Interface

- (void)enableStatusBarScrollingAlongScrollView:(UIScrollView *)scrollView
{
    NSParameterAssert(scrollView);
    
    __weak id wSelf = self;
    self.scrollingHandler = [[ADScrollingHandler alloc] initWithDidScrollBlock:^(UIScrollView *scrollView) {
        [wSelf scrollViewDidScroll:scrollView];
    }];
    
    self.scrollView = scrollView;
    [scrollView addObserver:self.scrollingHandler forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:(__bridge void *)(UIViewControllerScrollingStatusBarContext)];
}

- (void)disableStatusBarScrollingAlongScrollView:(UITableView *)scrollView
{
    self.scrollView = nil;
    [scrollView removeObserver:self.scrollingHandler forKeyPath:@"contentOffset" context:(__bridge void *)(UIViewControllerScrollingStatusBarContext)];
}

@end
