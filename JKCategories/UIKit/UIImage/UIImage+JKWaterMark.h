//
//  UIImage+JKWaterMark.h
//  JKCategories
//
//  Created by Qilin Hu on 2021/6/21.
//  Copyright © 2021 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JKWaterMark)

// 图片添加水印、文字
- (UIImage *)jk_setWaterMarkImage:(UIImage *)image
                             text:(NSString *_Nullable)string
                         textFont:(UIFont *_Nullable)font
                        textColor:(UIColor *_Nullable)color;

// 图片添加水印
- (UIImage *)jk_setWaterMarkImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
