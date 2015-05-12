//
//  UINavigationController+StackManager.h
//  IOS-Categories
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (StackManager)
- (id)findViewController:(NSString*)className;
//-(NSArray *)popToViewController:(NSString *)className animated:(BOOL)animated;
@end
