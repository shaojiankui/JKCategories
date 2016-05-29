//
//  UITextView+PinchZoom.m
//
//  Created by Stan Serebryakov <cfr@gmx.us> on 04.12.12.
//

#import "UITextView+JKPinchZoom.h"
#import "objc/runtime.h"

static int jk_minFontSizeKey;
static int jk_maxFontSizeKey;
static int jk_zoomEnabledKey;

@implementation UITextView (JKPinchZoom)

- (void)setJk_maxFontSize:(CGFloat)maxFontSize
{
    objc_setAssociatedObject(self, &jk_maxFontSizeKey, [NSNumber numberWithFloat:maxFontSize],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)jk_maxFontSize
{
    return [objc_getAssociatedObject(self, &jk_maxFontSizeKey) floatValue];
}

- (void)setJk_minFontSize:(CGFloat)maxFontSize
{
    objc_setAssociatedObject(self, &jk_minFontSizeKey, [NSNumber numberWithFloat:maxFontSize],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)jk_minFontSize
{
    return [objc_getAssociatedObject(self, &jk_minFontSizeKey) floatValue];
}

- (void)pinchGesture:(UIPinchGestureRecognizer *)gestureRecognizer
{
    if (!self.isJk_zoomEnabled) return;

    CGFloat pointSize = (gestureRecognizer.velocity > 0.0f ? 1.0f : -1.0f) + self.font.pointSize;

    pointSize = MAX(MIN(pointSize, self.jk_maxFontSize), self.jk_minFontSize);

    self.font = [UIFont fontWithName:self.font.fontName size:pointSize];
}


- (void)setJk_zoomEnabled:(BOOL)zoomEnabled
{
    objc_setAssociatedObject(self, &jk_zoomEnabledKey, [NSNumber numberWithBool:zoomEnabled],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    if (zoomEnabled) {
        for (UIGestureRecognizer *recognizer in self.gestureRecognizers) // initialized already
            if ([recognizer isKindOfClass:[UIPinchGestureRecognizer class]]) return;

        self.jk_minFontSize = self.jk_minFontSize ?: 8.0f;
        self.jk_maxFontSize = self.jk_maxFontSize ?: 42.0f;
        UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc]
                                                     initWithTarget:self action:@selector(pinchGesture:)];
        [self addGestureRecognizer:pinchRecognizer];
#if !__has_feature(objc_arc)
        [pinchRecognizer release];
#endif
    }
}

- (BOOL)isJk_zoomEnabled
{
    return [objc_getAssociatedObject(self, &jk_zoomEnabledKey) boolValue];
}

@end
