//
//  UIImage+Blur.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/6/5.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
FOUNDATION_EXPORT double ImageEffectsVersionNumber;
FOUNDATION_EXPORT const unsigned char ImageEffectsVersionString[];
@interface UIImage (JKBlur)

- (UIImage *)jk_lightImage;
- (UIImage *)jk_extraLightImage;
- (UIImage *)jk_darkImage;
- (UIImage *)jk_tintedImageWithColor:(UIColor *)tintColor;

- (UIImage *)jk_blurredImageWithRadius:(CGFloat)blurRadius;
- (UIImage *)jk_blurredImageWithSize:(CGSize)blurSize;
- (UIImage *)jk_blurredImageWithSize:(CGSize)blurSize
                        tintColor:(UIColor *)tintColor
            saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                        maskImage:(UIImage *)maskImage;
@end
