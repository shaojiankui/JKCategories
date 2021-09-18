//
//  UIImage+JKCompress.h
//  JKCategories
//
//  Created by Qilin Hu on 2021/9/17.
//  Copyright © 2021 Qilin Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JKCompress)

/// 压缩图片到指定字节
/// Tips: 1TB=1024GB、1GB=1024MB、1MB=1024KB、1KB=1024byte、1byte=8bit
/// @param maxLength 最大字节长度
- (NSData *)jk_compressImageToBytes:(NSUInteger)maxLength;

@end

NS_ASSUME_NONNULL_END
