//
//  NSString+XHStringPages.h
//  XHStringPages
//
//  Created by 曾 宪华 on 13-12-20.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//
// XHStringPages是一款解决长字符串分页的功能。功能特性如下：1、分页比较准确 2、根据CGRect来计算页数 3、利用多线程加载和分页

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (JKStringPages)
/**
 *  根据字符串进行分页
 *
 *  @param cache 需要进行分页的字符串
 *  @param font  你想显示的字体大小，这个要保持统一
 *  @param r     你想在多大的窗口显示
 *
 *  @return 返回一个数组，数组的元素是NSrange，根据NSRange来进行截取字符串
 */
- (NSArray *)jk_getPagesOfString:(NSString *)cache
                     withFont:(UIFont*)font
                       inRect:(CGRect)r;
@end
