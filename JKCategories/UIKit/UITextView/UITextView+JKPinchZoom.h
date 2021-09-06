//
//  UITextView+PinchZoom.h
//
//  Created by Stan Serebryakov <cfr@gmx.us> on 04.12.12.
//
//  Based on Aral Balkan snippet.
//

/**
 为 UITextView 添加捏合缩放功能。
 More info: : https://github.com/cfr/UITextView-PinchZoom
 
 Sample Code:
 
     UITextView *textView = [[UITextView alloc] initWithFrame:self.view.frame];
     [self.view addSubview:textView];
     textView.zoomEnabled = YES;
     textView.minFontSize = 10;
     textView.maxFontSize = 40;
*/
#import <UIKit/UIKit.h>

@interface UITextView (JKPinchZoom)

@property (nonatomic) CGFloat jk_maxFontSize, jk_minFontSize;

@property (nonatomic, getter = isJk_zoomEnabled) BOOL jk_zoomEnabled;

@end
