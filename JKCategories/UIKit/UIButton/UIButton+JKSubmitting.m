//
//  UIButton+Submitting.m
//  FXCategories
//
//  Created by foxsofter on 15/4/2.
//  Copyright (c) 2015年 foxsofter. All rights reserved.
//

#import "UIButton+JKSubmitting.h"
#import  <objc/runtime.h>

@interface UIButton ()

@property(nonatomic, strong) UIView *jk_modalView;
@property(nonatomic, strong) UIActivityIndicatorView *jk_spinnerView;
@property(nonatomic, strong) UILabel *jk_spinnerTitleLabel;

@end

@implementation UIButton (JKSubmitting)

- (void)jk_beginSubmitting:(NSString *)title {
    [self jk_endSubmitting];
    
    self.jk_submitting = @YES;
    self.hidden = YES;
    
    self.jk_modalView = [[UIView alloc] initWithFrame:self.frame];
    self.jk_modalView.backgroundColor =
    [self.backgroundColor colorWithAlphaComponent:0.6];
    self.jk_modalView.layer.cornerRadius = self.layer.cornerRadius;
    self.jk_modalView.layer.borderWidth = self.layer.borderWidth;
    self.jk_modalView.layer.borderColor = self.layer.borderColor;
    
    CGRect viewBounds = self.jk_modalView.bounds;
    self.jk_spinnerView = [[UIActivityIndicatorView alloc]
                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.jk_spinnerView.tintColor = self.titleLabel.textColor;
    
    CGRect spinnerViewBounds = self.jk_spinnerView.bounds;
    self.jk_spinnerView.frame = CGRectMake(
                                        15, viewBounds.size.height / 2 - spinnerViewBounds.size.height / 2,
                                        spinnerViewBounds.size.width, spinnerViewBounds.size.height);
    self.jk_spinnerTitleLabel = [[UILabel alloc] initWithFrame:viewBounds];
    self.jk_spinnerTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.jk_spinnerTitleLabel.text = title;
    self.jk_spinnerTitleLabel.font = self.titleLabel.font;
    self.jk_spinnerTitleLabel.textColor = self.titleLabel.textColor;
    [self.jk_modalView addSubview:self.jk_spinnerView];
    [self.jk_modalView addSubview:self.jk_spinnerTitleLabel];
    [self.superview addSubview:self.jk_modalView];
    [self.jk_spinnerView startAnimating];
}

- (void)jk_endSubmitting {
    if (!self.isJKSubmitting.boolValue) {
        return;
    }
    
    self.jk_submitting = @NO;
    self.hidden = NO;
    
    [self.jk_modalView removeFromSuperview];
    self.jk_modalView = nil;
    self.jk_spinnerView = nil;
    self.jk_spinnerTitleLabel = nil;
}

- (NSNumber *)isJKSubmitting {
    return objc_getAssociatedObject(self, @selector(setJk_submitting:));
}

- (void)setJk_submitting:(NSNumber *)submitting {
    objc_setAssociatedObject(self, @selector(setJk_submitting:), submitting, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (UIActivityIndicatorView *)jk_spinnerView {
    return objc_getAssociatedObject(self, @selector(setJk_spinnerView:));
}

- (void)setJk_spinnerView:(UIActivityIndicatorView *)spinnerView {
    objc_setAssociatedObject(self, @selector(setJk_spinnerView:), spinnerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)jk_modalView {
    return objc_getAssociatedObject(self, @selector(setJk_modalView:));

}

- (void)setJk_modalView:(UIView *)modalView {
    objc_setAssociatedObject(self, @selector(setJk_modalView:), modalView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)jk_spinnerTitleLabel {
    return objc_getAssociatedObject(self, @selector(setJk_spinnerTitleLabel:));
}

- (void)setJk_spinnerTitleLabel:(UILabel *)spinnerTitleLabel {
    objc_setAssociatedObject(self, @selector(setJk_spinnerTitleLabel:), spinnerTitleLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end