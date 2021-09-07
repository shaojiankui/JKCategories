//
//  UIImage+FX.h
//
//  Version 1.2.3
//
//  Created by Nick Lockwood on 31/10/2011.
//  Copyright (c) 2011 Charcoal Design
//

/**
 Reference: < https://github.com/nicklockwood/FXImageView>
 */
#import <UIKit/UIKit.h>

@interface UIImage (JKFXImage)

- (UIImage *)jk_imageCroppedToRect:(CGRect)rect;
- (UIImage *)jk_imageScaledToSize:(CGSize)size;
- (UIImage *)jk_imageScaledToFitSize:(CGSize)size;
- (UIImage *)jk_imageScaledToFillSize:(CGSize)size;
- (UIImage *)jk_imageCroppedAndScaledToSize:(CGSize)size
                             contentMode:(UIViewContentMode)contentMode
                                padToFit:(BOOL)padToFit;

- (UIImage *)jk_reflectedImageWithScale:(CGFloat)scale;
- (UIImage *)jk_imageWithReflectionWithScale:(CGFloat)scale gap:(CGFloat)gap alpha:(CGFloat)alpha;
- (UIImage *)jk_imageWithShadowColor:(UIColor *)color offset:(CGSize)offset blur:(CGFloat)blur;
- (UIImage *)jk_imageWithCornerRadius:(CGFloat)radius;
- (UIImage *)jk_imageWithAlpha:(CGFloat)alpha;
- (UIImage *)jk_imageWithMask:(UIImage *)maskImage;

- (UIImage *)jk_maskImageFromImageAlpha;

@end
