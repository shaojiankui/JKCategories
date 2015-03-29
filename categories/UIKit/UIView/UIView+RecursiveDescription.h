//
//  UIView+RecursiveDescription.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RecursiveDescription)
//打印视图层级
-(NSString*)recursiveView;
//打印约束
-(NSString*)constraintsDescription;
//打印整个视图树的字符串
-(NSString*)autolayoutTraceDescription;

@end
