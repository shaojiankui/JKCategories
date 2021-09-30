// UIImage+Alpha.h
// Created by Trevor Harmon on 9/20/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Helper methods for adding an alpha layer to an image

#import <UIKit/UIKit.h>

@interface UIImage (JKAlpha)

/// 是否有 alpha 通道
- (BOOL)jk_hasAlpha;

/// 如果没有 alpha 通道，增加 alpha 通道
- (UIImage *)jk_imageWithAlpha;

/// 增加透明边框
- (UIImage *)jk_transparentBorderImage:(NSUInteger)borderSize;

/// 裁切含透明图片为最小大小
/// Reference: <http://stackoverflow.com/questions/6521987/crop-uiimage-to-alpha?answertab=oldest#tab-top>
- (UIImage *)jk_trimmedBetterSize;

@end
