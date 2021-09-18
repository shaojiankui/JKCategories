//
//  UIImage+JKCompress.m
//  JKCategories
//
//  Created by Qilin Hu on 2021/9/17.
//  Copyright © 2021 www.skyfox.org. All rights reserved.
//

#import "UIImage+JKCompress.h"

@implementation UIImage (JKCompress)

- (NSData *)jk_compressImageToBytes:(NSUInteger)maxLength {
    // 首先判断原图大小是否满足要求，如果满足要求则直接返回
    CGFloat compressionQuality = 1;
    NSData *data = UIImageJPEGRepresentation(self, compressionQuality);
    if (data.length < maxLength) {
        return data;
    }
    
    // 先进行“压处理”，压缩图片质量
    // 这里“压缩比”采用二分法进行处理，6次二分后的最小压缩比是0.015625，已经够小了
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compressionQuality = (max + min) / 2.0;
        data = UIImageJPEGRepresentation(self, compressionQuality);
        
        if (data.length < maxLength * 0.9) {
            min = compressionQuality;
        } else if (data.length > maxLength) {
            max = compressionQuality;
        } else {
            break;
        }
    }
    
    // 判断“压处理”后的图片结果是否满足要求，如果满足要求则返回
    if (data.length < maxLength) {
        return data;
    }
    
    // 缩处理，压缩图片尺寸
    // 直接用大小比例作为缩处理的比例进行处理，因为有取整处理，所以一般需要处理两次
    UIImage *resultImage = [UIImage imageWithData:data];
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        // Use NSUInteger to prevent white blank
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio)));
        UIGraphicsBeginImageContext(size);
        // Use image to draw (drawInRect:), image is larger but more compression time
        // Use result image to draw, image is smaller but less compression time
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        data = UIImageJPEGRepresentation(resultImage, 1);
    }
    
    return data;
}

@end
