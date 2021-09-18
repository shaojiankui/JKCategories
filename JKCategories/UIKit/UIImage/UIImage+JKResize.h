// UIImage+Resize.h
// Created by Trevor Harmon on 8/5/09.
//

#import <UIKit/UIKit.h>

/// Extends the UIImage class to support resizing/cropping
@interface UIImage (JKResize)

/// 指定图片的最长边，返回等比例图片的尺寸
/// @param image 原始图片
/// @param maxLength 最长边
+ (CGSize)jk_resizeImage:(UIImage *)image withMaxLength:(CGFloat)maxLength;

/// 返回一张可拉伸的图片
/// 使用场景：拉伸聊天气泡框
+ (UIImage *)jk_resizableImage:(UIImage *)image;

/// 裁剪图片
/// @param bounds 裁剪的区域
- (UIImage *)jk_croppedImage:(CGRect)bounds;

// 返回该图像的一个副本，该副本的大小与缩略图的大小成正比。
// 如果 transparentBorder 非零，则在缩略图的边缘添加一个指定大小的透明边框。
// (添加一个至少一个像素大小的透明边框的副作用是，当使用Core Animation旋转图片时，会对图片的边缘进行抗锯齿处理。)
- (UIImage *)jk_thumbnailImage:(NSInteger)thumbnailSize
          transparentBorder:(NSUInteger)borderSize
               cornerRadius:(NSUInteger)cornerRadius
       interpolationQuality:(CGInterpolationQuality)quality;

/// 调整图片大小
/// @param newSize 新的图片尺寸
- (UIImage *)jk_resizedImage:(CGSize)newSize;

/// 调整图片大小
/// @param newSize 补差质量
/// @param quality 补差质量
- (UIImage *)jk_resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)jk_resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;

@end
