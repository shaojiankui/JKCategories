//
//  UIImage+FX.h
//
//  Version 1.2.3
//
//  Created by Nick Lockwood on 31/10/2011.
//  Copyright (c) 2011 Charcoal Design
//
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//
//  https://github.com/nicklockwood/FXImageView
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

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
