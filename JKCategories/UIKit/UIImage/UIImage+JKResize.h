// UIImage+Resize.h
// Created by Trevor Harmon on 8/5/09.
//

/// Extends the UIImage class to support resizing/cropping
#import <UIKit/UIKit.h>

@interface UIImage (JKResize)

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
/// @param newSize 补差质量
/// @param quality 补差质量
- (UIImage *)jk_resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;

/// 调整图片大小
/// @param newSize 新的图片尺寸
- (UIImage *)jk_resizedImage:(CGSize)newSize;

- (UIImage *)jk_resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;
@end
