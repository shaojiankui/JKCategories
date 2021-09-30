//
//  Reference: <https://github.com/edgarschmidt/ESAdjustableLabel-Category>
//
//  UILabel+ESAdjustableLabel.h
//  ===========================
//  This category adds a few helper methods to adjust
//  a UIlabel to fit its text.
//
//  You can specify the minimum and maximum label size,
//  minimum font size, or none at all.
//                      ----
//
//  Created by Edgar Schmidt (@edgarschmidt) on 4/14/12.
//  Copyright (c) 2012 Edgar Schmidt. All rights reserved.
//
//  This code is provided without any warranties.
//  Hack around and enjoy ;)
//

#import "UILabel+JKAdjustableLabel.h"

@implementation UILabel (JKAdjustableLabel)

/// 本扩展的核心方法，如果 minSize 被设置为 CGSizeZero，那么它将被忽略
- (void)jk_adjustLabelToMaximumSize:(CGSize)maxSize
                     minimumSize:(CGSize)minSize 
                 minimumFontSize:(int)minFontSize
{
    // MARK: 1. 计算新的 label 尺寸
    // 首先，重置一些基本参数
    [self setNumberOfLines:0];
    [self setLineBreakMode:NSLineBreakByWordWrapping];
    
    // 如果 maxSize 被设置为 CGSizeZero，那么假定最大宽度是设备屏幕的尺寸 - 默认推荐的边缘距离（2*20）。
    if (maxSize.height == CGSizeZero.height) {
        maxSize.width = [[UIScreen mainScreen] bounds].size.width - 40.0;
        maxSize.height = MAXFLOAT; // 不限制高度
    }
    
    // 现在，计算 label 的大小，并将其限制在 maxSize 之内
    CGSize tempSize = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    
    // 如果指定了 minSize（不是 CGSizeZero），那么检查新计算的尺寸是否小于最小尺寸。
    if (minSize.height != CGSizeZero.height) {
        if (tempSize.width <= minSize.width) tempSize.width = minSize.width;
        if (tempSize.height <= minSize.height) tempSize.height = minSize.height;
    }
    
    // 创建矩形区域
    CGRect newFrameSize = CGRectMake(self.frame.origin.x,
                                     self.frame.origin.y,
                                     tempSize.width,
                                     tempSize.height);
    
    // MARK: 2. 如有必要，改变字体大小
    UIFont *labelFont = [self font]; // temporary label object
    CGFloat fSize = [labelFont pointSize]; // temporary font size value
    CGSize calculatedSizeWithCurrentFontSize; // temporary frame size
    
    // Calculate label size as if there was no constrain
    CGSize unconstrainedSize = CGSizeMake(tempSize.width, MAXFLOAT);
    
    // 不断缩小字体，直到计算出的 size 小于 maxSize 为止。
    do {
        // Create a temporary font object
        labelFont = [UIFont fontWithName:[labelFont fontName]
                                    size:fSize];
        // Calculate the frame size
        calculatedSizeWithCurrentFontSize = [self.text boundingRectWithSize:unconstrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: labelFont} context:nil].size;
        // Reduce the temporary font size value
        fSize--;
    } while (calculatedSizeWithCurrentFontSize.height > maxSize.height);
    
    // 将字体大小重置为最后的计算值
    [self setFont:labelFont];
    
    // 重置 frame size
    [self setFrame:newFrameSize];
}

/// 只使用最大尺寸（maxSize）和字体大小作为约束条件来调整标签
- (void)jk_adjustLabelToMaximumSize:(CGSize)maxSize
                 minimumFontSize:(int)minFontSize {
  [self jk_adjustLabelToMaximumSize:maxSize
                     minimumSize:CGSizeZero 
                 minimumFontSize:minFontSize];
}

/// 只用字体大小作为约束条件来调整标签的尺寸
/// （最大尺寸将根据屏幕尺寸自动计算）
- (void)jk_adjustLabelSizeWithMinimumFontSize:(int)minFontSize {
  [self jk_adjustLabelToMaximumSize:CGSizeZero
                     minimumSize:CGSizeZero 
                 minimumFontSize:minFontSize];
}

/// 自动调整标签，不受任何限制（最大尺寸将根据屏幕尺寸自动计算）。
- (void)jk_adjustLabel {
  [self jk_adjustLabelToMaximumSize:CGSizeZero 
                     minimumSize:CGSizeZero 
                 minimumFontSize:[self minimumScaleFactor]];
}

@end
