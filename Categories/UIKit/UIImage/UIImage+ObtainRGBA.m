//
//  UIImage+ObtainRGBA.m
//  IOS-Categories
//
//  Created by KevinHM on 15/8/2.
//  Copyright (c) 2015年 KevinHM. All rights reserved.
//  Author: https://github.com/KevinHM

#import "UIImage+ObtainRGBA.h"

@implementation UIImage (ObtainRGBA)

-(CGContextRef)createARGBBitmapContextFromImage:(CGImageRef) cgImg {
    CGContextRef context = NULL;
    CGColorSpaceRef colorSpace;
    void *bitmapData;
    int bitmapByteCount;
    int bitmapBytesPerRow;
    size_t pixelsWide = CGImageGetWidth(cgImg);
    size_t pixelsHight = CGImageGetHeight(cgImg);
    bitmapBytesPerRow = (int)(4 * pixelsWide);
    bitmapByteCount = (int)(bitmapBytesPerRow * pixelsHight);
    colorSpace = CGColorSpaceCreateDeviceRGB();
    if (colorSpace == NULL) {
        fprintf(stderr, "Error allocating color space\n");
        return NULL;
    }
    
    bitmapData = malloc(bitmapByteCount);
    if (bitmapData == NULL) {
        fprintf(stderr, "Memory not allocated!");
        CGColorSpaceRelease(colorSpace);
        return NULL;
    }
    
    context = CGBitmapContextCreate(bitmapData, pixelsWide, pixelsHight, 8, bitmapBytesPerRow, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    if (context == NULL) {
        free(bitmapData);
        fprintf(stderr, "Context not created!");
    }
    CGColorSpaceRelease(colorSpace);
    return context;
}


- (UIColor *)obtainColorByPoint:(CGPoint)touchPoint {
    
    //图片的点击范围
    float frameWidth = self.size.width;
    float frameHeight = self.size.height;
    
    //判定点击区域的合理性
    if (touchPoint.x > frameWidth) {
        touchPoint.x = frameWidth;
    }
    else if (touchPoint.x < 0) {
         touchPoint.x = 0;
    }
    
    if (touchPoint.y > frameHeight) {
         touchPoint.y = frameHeight;
    }
    else if (touchPoint.y < 0) {
        touchPoint.y = 0;
    }
    
    //获取颜色
    UIColor *returnColor = nil;
    CGImageRef refImage = self.CGImage;
    CGContextRef cgConRef = [self createARGBBitmapContextFromImage:refImage];
    if (cgConRef == NULL) {
        return nil;
    }
    size_t w = CGImageGetWidth(refImage);
    size_t h = CGImageGetHeight(refImage);
    CGRect rect = {0,0,w,h};
    CGContextDrawImage(cgConRef, rect, refImage);
    
    unsigned char *data = CGBitmapContextGetData(cgConRef);
    if (data != NULL) {
        int offset = 4 * ((w * round(touchPoint.y)) + round(touchPoint.x));
        int alpha  = data[offset];
        int red    = data[offset+1];
        int green  = data[offset+2];
        int blue   = data[offset+3];
        returnColor = [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:alpha];
    }
    
    CGContextRelease(cgConRef);
    if (data) {
        free(data);
    }
    
    return returnColor;
}

@end
