//
//  UIView+Nib.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (JKNib)
+ (UINib *)jk_loadNib;
+ (UINib *)jk_loadNibNamed:(NSString*)nibName;
+ (UINib *)jk_loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle;

+ (instancetype)jk_loadInstanceFromNib;
+ (instancetype)jk_loadInstanceFromNibWithName:(NSString *)nibName;
+ (instancetype)jk_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner;
+ (instancetype)jk_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;

@end
