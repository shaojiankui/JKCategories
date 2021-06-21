//
//  UIImage+JKWaterMark.m
//  JKCategories
//
//  Created by Qilin Hu on 2021/6/21.
//  Copyright © 2021 www.skyfox.org. All rights reserved.
//

#import "UIImage+JKWaterMark.h"

@implementation UIImage (JKWaterMark)

// 图片添加水印、文字
- (UIImage *)jk_setWaterMarkImage:(UIImage *)image
                             text:(NSString *_Nullable)string
                         textFont:(UIFont *_Nullable)font
                        textColor:(UIColor *_Nullable)color
{
    /**
     size 为新创建的位图上下文的大小
     opaque 透明开关，如果图形完全不用透明，设置为 YES 以优化位图的存储。
     scale 缩放因子 iPhone 4 是 2.0，其他是 1.0。虽然这里可以用 [UIScreen mainScreen].scale 来获取，但实际上设为 0 后，系统就会自动设置正确的比例了
     */
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    // 图片本身
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    // Logo 水印
    CGRect waterMarkImageFrame = CGRectMake(self.size.width - 127, self.size.height - 80, 100, 35);
    
    [image drawInRect:waterMarkImageFrame];
    
    // 文字
    if (string.length != 0 && [string respondsToSelector:@selector(drawInRect:withAttributes:)]) {
        CGRect waterMarkTextFrame = CGRectMake(self.size.width - 160, self.size.height - 37, 160, 20);
        NSDictionary *attrbutes = @{
            NSFontAttributeName: font,
            NSForegroundColorAttributeName : color
        };
        [string drawInRect:waterMarkTextFrame withAttributes:attrbutes];
    }
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

// 图片添加水印
- (UIImage *)jk_setWaterMarkImage:(UIImage *)image
{
    return [self jk_setWaterMarkImage:image text:nil textFont:nil textColor:nil];
}

@end
