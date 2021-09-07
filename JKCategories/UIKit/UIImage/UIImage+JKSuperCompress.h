//
//  UIImage+SuperCompress.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 16/1/22.
//  Copyright © 2016年 Jakey. All rights reserved.
//

/**
 Reference: <https://github.com/IcaliaLabs/UIImage-ImageCompress>
 */
#import <UIKit/UIKit.h>

@interface UIImage (JKSuperCompress)
/**
 *  压缩上传图片到指定字节
 *
 *  @param image     压缩的图片
 *  @param maxLength 压缩后最大字节大小
 *
 *  @return 压缩后图片的二进制
 */
+ (NSData *)jk_resizeImage:(UIImage *)image withMaxLength:(NSInteger)maxLength withMaxWidth:(NSInteger)maxWidth;

/// 压缩图片到指定字节
/// @param image 原始图片
/// @param maxLength 最大字节长度
+ (NSData *)jk_compressImage:(UIImage *)image toBytes:(NSUInteger)maxLength;

/**
 *  压缩图片尺寸
 *
 *  @param image   原始图片
 *  @param newSize 指定的size
 *
 *  @return 调整后的图片
 */
+ (UIImage *)jk_resizeImage:(UIImage *)image withNewSize:(CGSize)newSize;

/**
 *  指定图片最长边，调整图片尺寸
 *
 *  @param image       原始图片
 *  @param maxLength   图片允许的最长宽度/高度
 *
 *  @return 获得等比例的size
 */
+ (CGSize)jk_resizeImage:(UIImage *)image withMaxLength:(CGFloat)maxLength;

/**
 * 返回一张可拉伸的图片
 */
+ (UIImage *)jk_resizableHalfImage:(NSString *)name;

@end
