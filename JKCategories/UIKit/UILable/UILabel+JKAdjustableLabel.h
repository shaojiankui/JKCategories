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

#import <UIKit/UIKit.h>

@interface UILabel (JKAdjustableLabel)

/// 本扩展的核心方法，如果 minSize 被设置为 CGSizeZero，那么它将被忽略
- (void)jk_adjustLabelToMaximumSize:(CGSize)maxSize
                     minimumSize:(CGSize)minSize 
                 minimumFontSize:(int)minFontSize;

/// 只使用最大尺寸（maxSize）和字体大小作为约束条件来调整标签
- (void)jk_adjustLabelToMaximumSize:(CGSize)maxSize
                 minimumFontSize:(int)minFontSize;

/// 只用字体大小作为约束条件来调整标签的尺寸
/// （最大尺寸将根据屏幕尺寸自动计算）
- (void)jk_adjustLabelSizeWithMinimumFontSize:(int)minFontSize;

/// 自动调整标签，不受任何限制（最大尺寸将根据屏幕尺寸自动计算）。
- (void)jk_adjustLabel;

@end
