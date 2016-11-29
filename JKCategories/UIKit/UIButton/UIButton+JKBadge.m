//
//  UIBarButtonItem+Badge.m
//  therichest
//
//  Created by Mike on 2014-05-05.
//  Copyright (c) 2014 Valnet Inc. All rights reserved.
//
#import <objc/runtime.h>
#import "UIButton+JKBadge.h"

NSString const *jk_UIButton_badgeKey = @"jk_UIButton_badgeKey";

NSString const *jk_UIButton_badgeBGColorKey = @"jk_UIButton_badgeBGColorKey";
NSString const *jk_UIButton_badgeTextColorKey = @"jk_UIButton_badgeTextColorKey";
NSString const *jk_UIButton_badgeFontKey = @"jk_UIButton_badgeFontKey";
NSString const *jk_UIButton_badgePaddingKey = @"jk_UIButton_badgePaddingKey";
NSString const *jk_UIButton_badgeMinSizeKey = @"jk_UIButton_badgeMinSizeKey";
NSString const *jk_UIButton_badgeOriginXKey = @"jk_UIButton_badgeOriginXKey";
NSString const *jk_UIButton_badgeOriginYKey = @"jk_UIButton_badgeOriginYKey";
NSString const *jk_UIButton_shouldHideBadgeAtZeroKey = @"jk_UIButton_shouldHideBadgeAtZeroKey";
NSString const *jk_UIButton_shouldAnimateBadgeKey = @"jk_UIButton_shouldAnimateBadgeKey";
NSString const *jk_UIButton_badgeValueKey = @"jk_UIButton_badgeValueKey";

@implementation UIButton (JKBadge)

@dynamic jk_badgeValue, jk_badgeBGColor, jk_badgeTextColor, jk_badgeFont;
@dynamic jk_badgePadding, jk_badgeMinSize, jk_badgeOriginX, jk_badgeOriginY;
@dynamic jk_shouldHideBadgeAtZero, jk_shouldAnimateBadge;

- (void)jk_badgeInit
{
    // Default design initialization
    self.jk_badgeBGColor   = [UIColor redColor];
    self.jk_badgeTextColor = [UIColor whiteColor];
    self.jk_badgeFont      = [UIFont systemFontOfSize:12.0];
    self.jk_badgePadding   = 6;
    self.jk_badgeMinSize   = 8;
    self.jk_badgeOriginX   = self.frame.size.width - self.jk_badge.frame.size.width/2;
    self.jk_badgeOriginY   = -4;
    self.jk_shouldHideBadgeAtZero = YES;
    self.jk_shouldAnimateBadge = YES;
    // Avoids badge to be clipped when animating its scale
    self.clipsToBounds = NO;
}

#pragma mark - Utility methods

// Handle badge display when its properties have been changed (color, font, ...)
- (void)jk_refreshBadge
{
    // Change new attributes
    self.jk_badge.textColor        = self.jk_badgeTextColor;
    self.jk_badge.backgroundColor  = self.jk_badgeBGColor;
    self.jk_badge.font             = self.jk_badgeFont;
}

- (CGSize) jk_badgeExpectedSize
{
    // When the value changes the badge could need to get bigger
    // Calculate expected size to fit new value
    // Use an intermediate label to get expected size thanks to sizeToFit
    // We don't call sizeToFit on the true label to avoid bad display
    UILabel *frameLabel = [self jk_duplicateLabel:self.jk_badge];
    [frameLabel sizeToFit];
    
    CGSize expectedLabelSize = frameLabel.frame.size;
    return expectedLabelSize;
}

- (void)jk_updateBadgeFrame
{

    CGSize expectedLabelSize = [self jk_badgeExpectedSize];
    
    // Make sure that for small value, the badge will be big enough
    CGFloat minHeight = expectedLabelSize.height;
    
    // Using a const we make sure the badge respect the minimum size
    minHeight = (minHeight < self.jk_badgeMinSize) ? self.jk_badgeMinSize : expectedLabelSize.height;
    CGFloat minWidth = expectedLabelSize.width;
    CGFloat padding = self.jk_badgePadding;
    
    // Using const we make sure the badge doesn't get too smal
    minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width;
    self.jk_badge.frame = CGRectMake(self.jk_badgeOriginX, self.jk_badgeOriginY, minWidth + padding, minHeight + padding);
    self.jk_badge.layer.cornerRadius = (minHeight + padding) / 2;
    self.jk_badge.layer.masksToBounds = YES;
}

// Handle the badge changing value
- (void)jk_updateBadgeValueAnimated:(BOOL)animated
{
    // Bounce animation on badge if value changed and if animation authorized
    if (animated && self.jk_shouldAnimateBadge && ![self.jk_badge.text isEqualToString:self.jk_badgeValue]) {
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.5]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.2];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4f :1.3f :1.f :1.f]];
        [self.jk_badge.layer addAnimation:animation forKey:@"bounceAnimation"];
    }
    
    // Set the new value
    self.jk_badge.text = self.jk_badgeValue;
    
    // Animate the size modification if needed
    NSTimeInterval duration = animated ? 0.2 : 0;
    [UIView animateWithDuration:duration animations:^{
        [self jk_updateBadgeFrame];
    }];
}

- (UILabel *)jk_duplicateLabel:(UILabel *)labelToCopy
{
    UILabel *duplicateLabel = [[UILabel alloc] initWithFrame:labelToCopy.frame];
    duplicateLabel.text = labelToCopy.text;
    duplicateLabel.font = labelToCopy.font;
    
    return duplicateLabel;
}

- (void)jk_removeBadge
{
    // Animate badge removal
    [UIView animateWithDuration:0.2 animations:^{
        self.jk_badge.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL finished) {
        [self.jk_badge removeFromSuperview];
        self.jk_badge = nil;
    }];
}

#pragma mark - getters/setters
-(UILabel*)jk_badge {
    return objc_getAssociatedObject(self, &jk_UIButton_badgeKey);
}
-(void)setJk_badge:(UILabel *)badgeLabel
{
    objc_setAssociatedObject(self, &jk_UIButton_badgeKey, badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// Badge value to be display
-(NSString *)jk_badgeValue {
    return objc_getAssociatedObject(self, &jk_UIButton_badgeValueKey);
}
-(void) setJk_badgeValue:(NSString *)badgeValue
{
    objc_setAssociatedObject(self, &jk_UIButton_badgeValueKey, badgeValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // When changing the badge value check if we need to remove the badge
    if (!badgeValue || [badgeValue isEqualToString:@""] || ([badgeValue isEqualToString:@"0"] && self.jk_shouldHideBadgeAtZero)) {
        [self jk_removeBadge];
    } else if (!self.jk_badge) {
        // Create a new badge because not existing
        self.jk_badge                      = [[UILabel alloc] initWithFrame:CGRectMake(self.jk_badgeOriginX, self.jk_badgeOriginY, 20, 20)];
        self.jk_badge.textColor            = self.jk_badgeTextColor;
        self.jk_badge.backgroundColor      = self.jk_badgeBGColor;
        self.jk_badge.font                 = self.jk_badgeFont;
        self.jk_badge.textAlignment        = NSTextAlignmentCenter;
        [self jk_badgeInit];
        [self addSubview:self.jk_badge];
        [self jk_updateBadgeValueAnimated:NO];
    } else {
        [self jk_updateBadgeValueAnimated:YES];
    }
}

// Badge background color
-(UIColor *)jk_badgeBGColor {
    return objc_getAssociatedObject(self, &jk_UIButton_badgeBGColorKey);
}
-(void)setJk_badgeBGColor:(UIColor *)badgeBGColor
{
    objc_setAssociatedObject(self, &jk_UIButton_badgeBGColorKey, badgeBGColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.jk_badge) {
        [self jk_refreshBadge];
    }
}

// Badge text color
-(UIColor *)jk_badgeTextColor {
    return objc_getAssociatedObject(self, &jk_UIButton_badgeTextColorKey);
}
-(void)setJk_badgeTextColor:(UIColor *)badgeTextColor
{
    objc_setAssociatedObject(self, &jk_UIButton_badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.jk_badge) {
        [self jk_refreshBadge];
    }
}

// Badge font
-(UIFont *)jk_badgeFont {
    return objc_getAssociatedObject(self, &jk_UIButton_badgeFontKey);
}
-(void)setJk_badgeFont:(UIFont *)badgeFont
{
    objc_setAssociatedObject(self, &jk_UIButton_badgeFontKey, badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.jk_badge) {
        [self jk_refreshBadge];
    }
}

// Padding value for the badge
-(CGFloat) jk_badgePadding {
    NSNumber *number = objc_getAssociatedObject(self, &jk_UIButton_badgePaddingKey);
    return number.floatValue;
}
-(void) setJk_badgePadding:(CGFloat)badgePadding
{
    NSNumber *number = [NSNumber numberWithDouble:badgePadding];
    objc_setAssociatedObject(self, &jk_UIButton_badgePaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.jk_badge) {
        [self jk_updateBadgeFrame];
    }
}

// Minimum size badge to small
-(CGFloat) jk_badgeMinSize {
    NSNumber *number = objc_getAssociatedObject(self, &jk_UIButton_badgeMinSizeKey);
    return number.floatValue;
}
-(void) setJk_badgeMinSize:(CGFloat)badgeMinSize
{
    NSNumber *number = [NSNumber numberWithDouble:badgeMinSize];
    objc_setAssociatedObject(self, &jk_UIButton_badgeMinSizeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.jk_badge) {
        [self jk_updateBadgeFrame];
    }
}

// Values for offseting the badge over the BarButtonItem you picked
-(CGFloat) jk_badgeOriginX {
    NSNumber *number = objc_getAssociatedObject(self, &jk_UIButton_badgeOriginXKey);
    return number.floatValue;
}
-(void) setJk_badgeOriginX:(CGFloat)badgeOriginX
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginX];
    objc_setAssociatedObject(self, &jk_UIButton_badgeOriginXKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.jk_badge) {
        [self jk_updateBadgeFrame];
    }
}

-(CGFloat) jk_badgeOriginY {
    NSNumber *number = objc_getAssociatedObject(self, &jk_UIButton_badgeOriginYKey);
    return number.floatValue;
}
-(void) setJk_badgeOriginY:(CGFloat)badgeOriginY
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginY];
    objc_setAssociatedObject(self, &jk_UIButton_badgeOriginYKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.jk_badge) {
        [self jk_updateBadgeFrame];
    }
}

// In case of numbers, remove the badge when reaching zero
-(BOOL) jk_shouldHideBadgeAtZero {
    NSNumber *number = objc_getAssociatedObject(self, &jk_UIButton_shouldHideBadgeAtZeroKey);
    return number.boolValue;
}
- (void)setJk_shouldHideBadgeAtZero:(BOOL)shouldHideBadgeAtZero
{
    NSNumber *number = [NSNumber numberWithBool:shouldHideBadgeAtZero];
    objc_setAssociatedObject(self, &jk_UIButton_shouldHideBadgeAtZeroKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// Badge has a bounce animation when value changes
-(BOOL) jk_shouldAnimateBadge {
    NSNumber *number = objc_getAssociatedObject(self, &jk_UIButton_shouldAnimateBadgeKey);
    return number.boolValue;
}
- (void)setJk_shouldAnimateBadge:(BOOL)shouldAnimateBadge
{
    NSNumber *number = [NSNumber numberWithBool:shouldAnimateBadge];
    objc_setAssociatedObject(self, &jk_UIButton_shouldAnimateBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
