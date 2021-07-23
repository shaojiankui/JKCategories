//
//  UIImage+SuperCompress.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 16/1/22.
//  Copyright © 2016年 Jakey. All rights reserved.
//

#import "UIImage+JKSuperCompress.h"

@implementation UIImage (JKSuperCompress)

+ (NSData *)jk_resizeImage:(UIImage *)image withMaxLength:(NSInteger)maxLength withMaxWidth:(NSInteger)maxWidth {
    NSAssert(maxLength > 0, @"图片的大小必须大于 0");
    NSAssert(maxWidth > 0, @"图片的最大边长必须大于 0");
    
    CGSize newSize = [self jk_resizeImage:image withMaxLength:maxWidth];
    UIImage *newImage = [self jk_resizeImage:image withNewSize:newSize];
    
    CGFloat compress = 0.9f;
    NSData *data = UIImageJPEGRepresentation(newImage, compress);
    
    while (data.length > maxLength && compress > 0.01) {
        compress -= 0.02f;
        data = UIImageJPEGRepresentation(newImage, compress);
    }
    return data;
}

+ (NSData *)jk_compressImage:(UIImage *)image toBytes:(NSUInteger)maxLength {
    // 首先判断原图大小是否满足要求，如果满足要求则直接返回
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) { return data; }
    
    // 原图大小超过范围，先进行“压处理”，这里“压缩比”采用二分法进行处理，6次二分后的最小压缩比是0.015625，已经够小了
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    
    // 判断“压处理”后的图片结果是否满足要求，如果满足要求则返回
    UIImage *resultImage = [UIImage imageWithData:data];
    if (data.length < maxLength) { return data; }
    
    // 缩处理，直接用大小比例作为缩处理的比例进行处理，因为有取整处理，所以一般需要处理两次
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio)));
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    
    return data;
}

+ (UIImage *)jk_resizeImage:(UIImage *)image withNewSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (CGSize)jk_resizeImage:(UIImage *)image withMaxLength:(CGFloat)maxLength {

    CGFloat targetWidth = maxLength;
    CGFloat targetHeight = maxLength;
    CGFloat sourceWidth = image.size.width;
    CGFloat sourceHeight = image.size.height;
    
    if (sourceWidth > maxLength || sourceHeight > maxLength) {
        if (sourceWidth > sourceHeight) {
            // 如果图片宽度大于高度，横图，宽度最为最大长度
            targetHeight = targetWidth * sourceHeight / sourceWidth;
        } else {
            // 如果图片高度 > 宽度，长度，高度作为最大长度
            targetWidth = targetHeight * sourceWidth / sourceHeight;
        }
    } else {
        return CGSizeMake(sourceWidth, sourceHeight);
    }
    return CGSizeMake(targetWidth, targetHeight);
}

+ (UIImage *)jk_resizableHalfImage:(NSString *)name {
    UIImage *normal = [UIImage imageNamed:name];
    
    CGFloat imageW = normal.size.width * 0.5;
    CGFloat imageH = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW)];
}

@end
