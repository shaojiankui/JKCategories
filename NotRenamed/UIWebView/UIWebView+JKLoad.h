//
//  UIWebView+loadURL.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (JKLoad)
/**
 *  @brief  读取一个网页地址
 *
 *  @param URLString 网页地址
 */
- (void)jk_loadURL:(NSString*)URLString;
/**
 *  @brief  读取bundle中的webview
 *
 *  @param htmlName 文件名称 xxx.html
 */
- (void)jk_loadLocalHtml:(NSString*)htmlName;
/**
 *
 *  读取bundle中的webview
 *
 *  @param htmlName htmlName 文件名称 xxx.html
 *  @param inBundle bundle
 */
- (void)jk_loadLocalHtml:(NSString*)htmlName inBundle:(NSBundle*)inBundle;

/**
 *  @brief  清空cookie
 */
- (void)jk_clearCookies;
@end
