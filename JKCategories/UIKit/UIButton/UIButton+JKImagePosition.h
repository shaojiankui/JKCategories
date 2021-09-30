//
//  UIButton+JKImagePosition.h
//  Demo_ButtonImageTitleEdgeInsets
//
//  Created by luxiaoming on 16/1/15.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

/**
 Reference: <https://github.com/Phelthas/Demo_ButtonImageTitleEdgeInsets>
 
 用 UIButton 的 titleEdgeInsets 和 imageEdgeInsets 属性来实现 button 文字图片上下或者左右排列
 */
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JKImagePosition) {
    LXMImagePositionLeft = 0,              // 图片在左，文字在右，默认
    LXMImagePositionRight = 1,             // 图片在右，文字在左
    LXMImagePositionTop = 2,               // 图片在上，文字在下
    LXMImagePositionBottom = 3,            // 图片在下，文字在上
};

@interface UIButton (JKImagePosition)

/**
 *  利用 UIButton 的 titleEdgeInsets 和 imageEdgeInsets 来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且 button 的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)jk_setImagePosition:(JKImagePosition)postion spacing:(CGFloat)spacing;

@end
