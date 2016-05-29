//
//  UIView+Toast.m
//  Toast
//
//  Copyright 2014 Charles Scalesse.
//


#import "UIView+JKToast.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

/*
 *  CONFIGURE THESE VALUES TO ADJUST LOOK & FEEL,
 *  DISPLAY DURATION, ETC.
 */

// general appearance
static const CGFloat JKToastMaxWidth            = 0.8;      // 80% of parent view width
static const CGFloat JKToastMaxHeight           = 0.8;      // 80% of parent view height
static const CGFloat JKToastHorizontalPadding   = 10.0;
static const CGFloat JKToastVerticalPadding     = 10.0;
static const CGFloat JKToastCornerRadius        = 10.0;
static const CGFloat JKToastOpacity             = 0.8;
static const CGFloat JKToastFontSize            = 16.0;
static const CGFloat JKToastMaxTitleLines       = 0;
static const CGFloat JKToastMaxMessageLines     = 0;
static const NSTimeInterval JKToastFadeDuration = 0.2;

// shadow appearance
static const CGFloat JKToastShadowOpacity       = 0.8;
static const CGFloat JKToastShadowRadius        = 6.0;
static const CGSize  JKToastShadowOffset        = { 4.0, 4.0 };
static const BOOL    JKToastDisplayShadow       = YES;

// display duration
static const NSTimeInterval JKToastDefaultDuration  = 3.0;

// image view size
static const CGFloat JKToastImageViewWidth      = 80.0;
static const CGFloat JKToastImageViewHeight     = 80.0;

// activity
static const CGFloat JKToastActivityWidth       = 100.0;
static const CGFloat JKToastActivityHeight      = 100.0;
static const NSString * JKToastActivityDefaultPosition = @"center";

// interaction
static const BOOL JKToastHidesOnTap             = YES;     // excludes activity views

// associative reference keys
static const NSString * JKToastTimerKey         = @"JKToastTimerKey";
static const NSString * JKToastActivityViewKey  = @"JKToastActivityViewKey";
static const NSString * JKToastTapCallbackKey   = @"JKToastTapCallbackKey";

// positions
NSString * const JKToastPositionTop             = @"top";
NSString * const JKToastPositionCenter          = @"center";
NSString * const JKToastPositionBottom          = @"bottom";

@interface UIView (JKToastPrivate)

- (void)jk_hideToast:(UIView *)toast;
- (void)jk_toastTimerDidFinish:(NSTimer *)timer;
- (void)jk_handleToastTapped:(UITapGestureRecognizer *)recognizer;
- (CGPoint)jk_centerPointForPosition:(id)position withToast:(UIView *)toast;
- (UIView *)jk_viewForMessage:(NSString *)message title:(NSString *)title image:(UIImage *)image;
- (CGSize)jk_sizeForString:(NSString *)string font:(UIFont *)font constrainedToSize:(CGSize)constrainedSize lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end


@implementation UIView (JKToast)

#pragma mark - Toast Methods

- (void)jk_makeToast:(NSString *)message {
    [self jk_makeToast:message duration:JKToastDefaultDuration position:nil];
}

- (void)jk_makeToast:(NSString *)message duration:(NSTimeInterval)duration position:(id)position {
    UIView *toast = [self jk_viewForMessage:message title:nil image:nil];
    [self jk_showToast:toast duration:duration position:position];
}

- (void)jk_makeToast:(NSString *)message duration:(NSTimeInterval)duration position:(id)position title:(NSString *)title {
    UIView *toast = [self jk_viewForMessage:message title:title image:nil];
    [self jk_showToast:toast duration:duration position:position];
}

- (void)jk_makeToast:(NSString *)message duration:(NSTimeInterval)duration position:(id)position image:(UIImage *)image {
    UIView *toast = [self jk_viewForMessage:message title:nil image:image];
    [self jk_showToast:toast duration:duration position:position];
}

- (void)jk_makeToast:(NSString *)message duration:(NSTimeInterval)duration  position:(id)position title:(NSString *)title image:(UIImage *)image {
    UIView *toast = [self jk_viewForMessage:message title:title image:image];
    [self jk_showToast:toast duration:duration position:position];
}

- (void)jk_showToast:(UIView *)toast {
    [self jk_showToast:toast duration:JKToastDefaultDuration position:nil];
}


- (void)jk_showToast:(UIView *)toast duration:(NSTimeInterval)duration position:(id)position {
    [self jk_showToast:toast duration:duration position:position tapCallback:nil];
    
}


- (void)jk_showToast:(UIView *)toast duration:(NSTimeInterval)duration position:(id)position
      tapCallback:(void(^)(void))tapCallback
{
    toast.center = [self jk_centerPointForPosition:position withToast:toast];
    toast.alpha = 0.0;
    
    if (JKToastHidesOnTap) {
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:toast action:@selector(jk_handleToastTapped:)];
        [toast addGestureRecognizer:recognizer];
        toast.userInteractionEnabled = YES;
        toast.exclusiveTouch = YES;
    }
    
    [self addSubview:toast];
    
    [UIView animateWithDuration:JKToastFadeDuration
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         toast.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(jk_toastTimerDidFinish:) userInfo:toast repeats:NO];
                         // associate the timer with the toast view
                         objc_setAssociatedObject (toast, &JKToastTimerKey, timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                         objc_setAssociatedObject (toast, &JKToastTapCallbackKey, tapCallback, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                     }];
}


- (void)jk_hideToast:(UIView *)toast {
    [UIView animateWithDuration:JKToastFadeDuration
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                     animations:^{
                         toast.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         [toast removeFromSuperview];
                     }];
}

#pragma mark - Events

- (void)jk_toastTimerDidFinish:(NSTimer *)timer {
    [self jk_hideToast:(UIView *)timer.userInfo];
}

- (void)jk_handleToastTapped:(UITapGestureRecognizer *)recognizer {
    NSTimer *timer = (NSTimer *)objc_getAssociatedObject(self, &JKToastTimerKey);
    [timer invalidate];
    
    void (^callback)(void) = objc_getAssociatedObject(self, &JKToastTapCallbackKey);
    if (callback) {
        callback();
    }
    [self jk_hideToast:recognizer.view];
}

#pragma mark - Toast Activity Methods

- (void)jk_makeToastActivity {
    [self jk_makeToastActivity:JKToastActivityDefaultPosition];
}

- (void)jk_makeToastActivity:(id)position {
    // sanity
    UIView *existingActivityView = (UIView *)objc_getAssociatedObject(self, &JKToastActivityViewKey);
    if (existingActivityView != nil) return;
    
    UIView *activityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JKToastActivityWidth, JKToastActivityHeight)];
    activityView.center = [self jk_centerPointForPosition:position withToast:activityView];
    activityView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:JKToastOpacity];
    activityView.alpha = 0.0;
    activityView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    activityView.layer.cornerRadius = JKToastCornerRadius;
    
    if (JKToastDisplayShadow) {
        activityView.layer.shadowColor = [UIColor blackColor].CGColor;
        activityView.layer.shadowOpacity = JKToastShadowOpacity;
        activityView.layer.shadowRadius = JKToastShadowRadius;
        activityView.layer.shadowOffset = JKToastShadowOffset;
    }
    
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicatorView.center = CGPointMake(activityView.bounds.size.width / 2, activityView.bounds.size.height / 2);
    [activityView addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    
    // associate the activity view with self
    objc_setAssociatedObject (self, &JKToastActivityViewKey, activityView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addSubview:activityView];
    
    [UIView animateWithDuration:JKToastFadeDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         activityView.alpha = 1.0;
                     } completion:nil];
}

- (void)jk_hideToastActivity {
    UIView *existingActivityView = (UIView *)objc_getAssociatedObject(self, &JKToastActivityViewKey);
    if (existingActivityView != nil) {
        [UIView animateWithDuration:JKToastFadeDuration
                              delay:0.0
                            options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                         animations:^{
                             existingActivityView.alpha = 0.0;
                         } completion:^(BOOL finished) {
                             [existingActivityView removeFromSuperview];
                             objc_setAssociatedObject (self, &JKToastActivityViewKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                         }];
    }
}

#pragma mark - Helpers

- (CGPoint)jk_centerPointForPosition:(id)point withToast:(UIView *)toast {
    if([point isKindOfClass:[NSString class]]) {
        if([point caseInsensitiveCompare:JKToastPositionTop] == NSOrderedSame) {
            return CGPointMake(self.bounds.size.width/2, (toast.frame.size.height / 2) + JKToastVerticalPadding);
        } else if([point caseInsensitiveCompare:JKToastPositionCenter] == NSOrderedSame) {
            return CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        }
    } else if ([point isKindOfClass:[NSValue class]]) {
        return [point CGPointValue];
    }
    
    // default to bottom
    return CGPointMake(self.bounds.size.width/2, (self.bounds.size.height - (toast.frame.size.height / 2)) - JKToastVerticalPadding);
}

- (CGSize)jk_sizeForString:(NSString *)string font:(UIFont *)font constrainedToSize:(CGSize)constrainedSize lineBreakMode:(NSLineBreakMode)lineBreakMode {
    if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = lineBreakMode;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
        CGRect boundingRect = [string boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        return CGSizeMake(ceilf(boundingRect.size.width), ceilf(boundingRect.size.height));
    }

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [string sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
}

- (UIView *)jk_viewForMessage:(NSString *)message title:(NSString *)title image:(UIImage *)image {
    // sanity
    if((message == nil) && (title == nil) && (image == nil)) return nil;

    // dynamically build a toast view with any combination of message, title, & image.
    UILabel *messageLabel = nil;
    UILabel *titleLabel = nil;
    UIImageView *imageView = nil;
    
    // create the parent view
    UIView *wrapperView = [[UIView alloc] init];
    wrapperView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    wrapperView.layer.cornerRadius = JKToastCornerRadius;
    
    if (JKToastDisplayShadow) {
        wrapperView.layer.shadowColor = [UIColor blackColor].CGColor;
        wrapperView.layer.shadowOpacity = JKToastShadowOpacity;
        wrapperView.layer.shadowRadius = JKToastShadowRadius;
        wrapperView.layer.shadowOffset = JKToastShadowOffset;
    }

    wrapperView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:JKToastOpacity];
    
    if(image != nil) {
        imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(JKToastHorizontalPadding, JKToastVerticalPadding, JKToastImageViewWidth, JKToastImageViewHeight);
    }
    
    CGFloat imageWidth, imageHeight, imageLeft;
    
    // the imageView frame values will be used to size & position the other views
    if(imageView != nil) {
        imageWidth = imageView.bounds.size.width;
        imageHeight = imageView.bounds.size.height;
        imageLeft = JKToastHorizontalPadding;
    } else {
        imageWidth = imageHeight = imageLeft = 0.0;
    }
    
    if (title != nil) {
        titleLabel = [[UILabel alloc] init];
        titleLabel.numberOfLines = JKToastMaxTitleLines;
        titleLabel.font = [UIFont boldSystemFontOfSize:JKToastFontSize];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.alpha = 1.0;
        titleLabel.text = title;
        
        // size the title label according to the length of the text
        CGSize maxSizeTitle = CGSizeMake((self.bounds.size.width * JKToastMaxWidth) - imageWidth, self.bounds.size.height * JKToastMaxHeight);
        CGSize expectedSizeTitle = [self jk_sizeForString:title font:titleLabel.font constrainedToSize:maxSizeTitle lineBreakMode:titleLabel.lineBreakMode];
        titleLabel.frame = CGRectMake(0.0, 0.0, expectedSizeTitle.width, expectedSizeTitle.height);
    }
    
    if (message != nil) {
        messageLabel = [[UILabel alloc] init];
        messageLabel.numberOfLines = JKToastMaxMessageLines;
        messageLabel.font = [UIFont systemFontOfSize:JKToastFontSize];
        messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.alpha = 1.0;
        messageLabel.text = message;
        
        // size the message label according to the length of the text
        CGSize maxSizeMessage = CGSizeMake((self.bounds.size.width * JKToastMaxWidth) - imageWidth, self.bounds.size.height * JKToastMaxHeight);
        CGSize expectedSizeMessage = [self jk_sizeForString:message font:messageLabel.font constrainedToSize:maxSizeMessage lineBreakMode:messageLabel.lineBreakMode];
        messageLabel.frame = CGRectMake(0.0, 0.0, expectedSizeMessage.width, expectedSizeMessage.height);
    }
    
    // titleLabel frame values
    CGFloat titleWidth, titleHeight, titleTop, titleLeft;
    
    if(titleLabel != nil) {
        titleWidth = titleLabel.bounds.size.width;
        titleHeight = titleLabel.bounds.size.height;
        titleTop = JKToastVerticalPadding;
        titleLeft = imageLeft + imageWidth + JKToastHorizontalPadding;
    } else {
        titleWidth = titleHeight = titleTop = titleLeft = 0.0;
    }
    
    // messageLabel frame values
    CGFloat messageWidth, messageHeight, messageLeft, messageTop;

    if(messageLabel != nil) {
        messageWidth = messageLabel.bounds.size.width;
        messageHeight = messageLabel.bounds.size.height;
        messageLeft = imageLeft + imageWidth + JKToastHorizontalPadding;
        messageTop = titleTop + titleHeight + JKToastVerticalPadding;
    } else {
        messageWidth = messageHeight = messageLeft = messageTop = 0.0;
    }

    CGFloat longerWidth = MAX(titleWidth, messageWidth);
    CGFloat longerLeft = MAX(titleLeft, messageLeft);
    
    // wrapper width uses the longerWidth or the image width, whatever is larger. same logic applies to the wrapper height
    CGFloat wrapperWidth = MAX((imageWidth + (JKToastHorizontalPadding * 2)), (longerLeft + longerWidth + JKToastHorizontalPadding));    
    CGFloat wrapperHeight = MAX((messageTop + messageHeight + JKToastVerticalPadding), (imageHeight + (JKToastVerticalPadding * 2)));
                         
    wrapperView.frame = CGRectMake(0.0, 0.0, wrapperWidth, wrapperHeight);
    
    if(titleLabel != nil) {
        titleLabel.frame = CGRectMake(titleLeft, titleTop, titleWidth, titleHeight);
        [wrapperView addSubview:titleLabel];
    }
    
    if(messageLabel != nil) {
        messageLabel.frame = CGRectMake(messageLeft, messageTop, messageWidth, messageHeight);
        [wrapperView addSubview:messageLabel];
    }
    
    if(imageView != nil) {
        [wrapperView addSubview:imageView];
    }
        
    return wrapperView;
}

@end
