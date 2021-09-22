//
//  UIImage+Merge.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIImage+JKMerge.h"

@implementation UIImage (JKMerge)

+ (UIImage *)jk_mergeImage:(UIImage *)backImage frontImage:(UIImage *)frontImage {
    
    CGImageRef backCGImage = backImage.CGImage;
    CGFloat backImageWidth = CGImageGetWidth(backCGImage);
    CGFloat backImageHeight = CGImageGetHeight(backCGImage);
    
    CGImageRef frontCGImage = frontImage.CGImage;
    CGFloat frontImageWidth = CGImageGetWidth(frontCGImage);
    CGFloat frontImageHeight = CGImageGetHeight(frontCGImage);
    
    // 1.1 计算图案的大小和位置
    UIGraphicsBeginImageContext(CGSizeMake(backImageWidth, backImageHeight));
    [backImage drawInRect:CGRectMake(0, 0, backImageWidth, backImageHeight)];
    [frontImage drawInRect:CGRectMake(0, 0, frontImageWidth, frontImageHeight)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}

@end
