//
//  UITextView+PlaceHolder.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UITextView+JKPlaceHolder.h"
static const char *jk_placeHolderTextView = "jk_placeHolderTextView";
@implementation UITextView (JKPlaceHolder)
- (UITextView *)jk_placeHolderTextView {
    return objc_getAssociatedObject(self, jk_placeHolderTextView);
}
- (void)setJk_placeHolderTextView:(UITextView *)placeHolderTextView {
    objc_setAssociatedObject(self, jk_placeHolderTextView, placeHolderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)jk_addPlaceHolder:(NSString *)placeHolder {
    if (![self jk_placeHolderTextView]) {
        self.delegate = self;
        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor grayColor];
        textView.userInteractionEnabled = NO;
        textView.text = placeHolder;
        [self addSubview:textView];
        [self setJk_placeHolderTextView:textView];
    }
}
# pragma mark -
# pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.jk_placeHolderTextView.hidden = YES;
    // if (self.textViewDelegate) {
    //
    // }
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text && [textView.text isEqualToString:@""]) {
        self.jk_placeHolderTextView.hidden = NO;
    }
}

@end
