//
//  CALayer+JKBorderColor.h
//  test
//
//  Created by LiuLogan on 15/6/17.
//  Copyright (c) 2015年 100apps. All rights reserved.
//http://www.gfzj.us/tech/2015/06/18/set-uiview-bordercolor-and-backgroundimage-in-interface-builder.html
//http://stackoverflow.com/a/27986696/3825920

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface CALayer (JKBorderColor)
/**
 *  @author JKCategories
 *
 *  layer边框颜色
 */
@property(nonatomic, assign) UIColor *jk_borderColor;
@end
