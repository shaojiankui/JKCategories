//
//  UIImage+BetterFace.h
//  bf
//
//  Created by liuyan on 13-11-25.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

/**
 Reference: <https://github.com/croath/UIImageView-BetterFace>
 一个 UIImage 扩展，让图片裁剪自适应人脸位置。
 */
#import <UIKit/UIKit.h>

/// 准确度
typedef NS_ENUM(NSUInteger, JKAccuracy) {
    JKAccuracyLow = 0,
    JKAccuracyHigh,
};

@interface UIImage (JKBetterFace)

- (UIImage *)jk_betterFaceImageForSize:(CGSize)size
                              accuracy:(JKAccuracy)accurary;

@end
