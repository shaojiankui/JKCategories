//
//  UIImage+JKGrayscale.m
//  JKCategories
//
//  Created by Qilin Hu on 2021/9/18.
//  Copyright © 2020 Qilin Hu. All rights reserved.
//

#import "UIImage+JKGrayscale.h"

@implementation UIImage (JKGrayscale)

- (UIImage *)grayImageWithType:(JKImageByGrayscaleType)grayscaleType {
    CGImageRef imageRef = self.CGImage;
    // 1. 获取图片的宽高
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    // 2. 创建颜色空间
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    // 3.根据像素点个数创建一个所需要的空间
    UInt32 *imagePixel = (UInt32 *)calloc(width * height, sizeof(UInt32));
    CGContextRef contextRef = CGBitmapContextCreate(imagePixel, width, height, 8, 4 * width, colorSpaceRef, kCGImageAlphaNoneSkipLast);
    // 4.根据图片数据源绘制上下文
    CGContextDrawImage(contextRef, CGRectMake(0, 0, width, height), self.CGImage);
    // 5.将彩色图片像素点重新设置颜色
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            // 计算平均值重新存储像素点-直接操作像素点
            uint8_t *rgbPixel = (uint8_t *)&imagePixel[y*width+x];
            
            // 使用灰度算法，计算出一个灰度值
            uint32_t gray;
            switch (grayscaleType) {
                case JKImageByGrayscaleTypeAverage:
                    gray = (rgbPixel[0] + rgbPixel[1] + rgbPixel[2]) / 3;
                    break;
                case JKImageByGrayscaleTypeEyesPerception:
                    gray = rgbPixel[0]*0.3+rgbPixel[1]*0.59+rgbPixel[2]*0.11;
                    break;
                case JKImageByGrayscaleTypeDesaturation:
                    gray = (MAX(MAX(rgbPixel[0], rgbPixel[1]), rgbPixel[2]) + MIN(MIN(rgbPixel[0], rgbPixel[1]), rgbPixel[2])) / 2;
                    break;
                case JKImageByGrayscaleTypeDecompositionMax:
                    gray = MAX(MAX(rgbPixel[0], rgbPixel[1]), rgbPixel[2]);
                    break;
                case JKImageByGrayscaleTypeDecompositionMin:
                    gray = MIN(MIN(rgbPixel[0], rgbPixel[1]), rgbPixel[2]);
                    break;
                case JKImageByGrayscaleTypeSingleChannelWithRed:
                    gray = rgbPixel[0];
                    break;
                case JKImageByGrayscaleTypeSingleChannelWithGreen:
                    gray = rgbPixel[1];
                    break;
                case JKImageByGrayscaleTypeSingleChannelWithBlue:
                    gray = rgbPixel[2];
                    break;
            }
            
            // 使用计算出的灰度值，替代原始值
            rgbPixel[0] = gray;
            rgbPixel[1] = gray;
            rgbPixel[2] = gray;
        }
    }
    // 根据上下文绘制
    CGImageRef finalRef = CGBitmapContextCreateImage(contextRef);
    // 释放内存
    CGContextRelease(contextRef);
    CGColorSpaceRelease(colorSpaceRef);
    free(imagePixel);
    return [UIImage imageWithCGImage:finalRef scale:self.scale orientation:UIImageOrientationUp];
}

- (UIImage *)grayImageWithNumberOfShades:(NSUInteger)numberOfShades {
    NSParameterAssert(numberOfShades >= 2 && numberOfShades <= 256);
    
    CGImageRef imageRef = self.CGImage;
    // 1. 获取图片的宽高
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    // 2. 创建颜色空间
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    // 3.根据像素点个数创建一个所需要的空间
    UInt32 *imagePixel = (UInt32 *)calloc(width * height, sizeof(UInt32));
    CGContextRef contextRef = CGBitmapContextCreate(imagePixel, width, height, 8, 4 * width, colorSpaceRef, kCGImageAlphaNoneSkipLast);
    // 4.根据图片数据源绘制上下文
    CGContextDrawImage(contextRef, CGRectMake(0, 0, width, height), self.CGImage);
    // 5.将彩色图片像素点重新设置颜色
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            // 计算平均值重新存储像素点-直接操作像素点
            uint8_t *rgbPixel = (uint8_t *)&imagePixel[y*width+x];
            
            // 使用灰度算法，计算出一个灰度值
            int conversionFactor = 255 / (numberOfShades - 1);
            int averageValue = round((rgbPixel[0] + rgbPixel[1] + rgbPixel[2]) / 3);
            uint32_t gray = round(((averageValue / conversionFactor) + 0.5) * conversionFactor);

            // 使用计算出的灰度值，替代原始值
            rgbPixel[0] = gray;
            rgbPixel[1] = gray;
            rgbPixel[2] = gray;
        }
    }
    // 根据上下文绘制
    CGImageRef finalRef = CGBitmapContextCreateImage(contextRef);
    // 释放内存
    CGContextRelease(contextRef);
    CGColorSpaceRelease(colorSpaceRef);
    free(imagePixel);
    return [UIImage imageWithCGImage:finalRef scale:self.scale orientation:UIImageOrientationUp];
}

@end
