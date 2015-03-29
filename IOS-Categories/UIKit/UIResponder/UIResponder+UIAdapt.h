//
//  UIResponder+UIAdapt.h
//  IOS-Categories
//
//  Created by Jakey on 15/1/28.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (UIAdapt)
CGRect CGAdaptRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
CGPoint CGAdaptPointMake(CGFloat x, CGFloat y);
-(CGFloat)factorAdapt;
@end
