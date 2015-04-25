//
//  UIView+Find.h
//  IOS-Categories
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Find)
- (id)findSubViewWithSubViewClass:(Class)clazz;
- (id)findsuperViewWithSuperViewClass:(Class)clazz;

- (BOOL)findAndResignFirstResponder;
- (UIView *)findFirstResponder;
@end
