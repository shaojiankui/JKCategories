//
//  UIViewController+BackButtonItemTitle.h
//  Author ： https://github.com/KevinHM
//
//  Created by KevinHM on 15/8/6.
//  Copyright (c) 2015年 KevinHM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JKBackButtonItemTitleProtocol <NSObject>

@optional
- (NSString *)jk_navigationItemBackBarButtonTitle; //The length of the text is limited, otherwise it will be set to "Back"

@end

@interface UIViewController (JKBackButtonItemTitle) <JKBackButtonItemTitleProtocol>

@end
