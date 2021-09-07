//
//  UIResponder+JKFirstResponder.h
//
//  Created by Thad McDowell
//  Copyright (c) 2015 Roaming Logic LLC
//

/**
 Reference:<https://github.com/thad/ExampleFindFirstResponder>
 
 This is an example project using a UIResponder category to find the current first responder.
 */
#import <UIKit/UIKit.h>

@interface UIResponder (JKFirstResponder)

/// 当前第一响应者
+ (id)jk_currentFirstResponder;

@end
