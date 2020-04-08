//
//  UIWebView+JKLoadInfo.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 2016/12/9.
//  Copyright © 2016年 Jakey. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, JKReadyState) {
    JK_JKReadyState_uninitialized = 0, //还未开始载入
    JK_JKReadyState_loading,      //载入中
    JK_JKReadyState_interactive, //已加载，文档与用户可以开始交互
    JK_JKReadyState_complete    //载入完成

};
typedef void(^jk_webViewLoadChangeBlock)(UIWebView *webView,float progress,CGSize contentSize);

@interface UIWebView (JKLoadInfo)<UIWebViewDelegate>
@property (nonatomic, readonly) float jk_progress; // 0.0..1.0
@property (nonatomic, readonly) CGSize jk_contentSize;
@property (nonatomic, readonly) JKReadyState jk_readyState;
@property (copy, nonatomic)     jk_webViewLoadChangeBlock jk_webViewLoadChangeBlock;

-(void)setJk_webViewLoadChangeBlock:(jk_webViewLoadChangeBlock)jk_webViewLoadChangeBlock;
@end
