//
//  UITableViewCell+NIB.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/11/19.
//  Copyright (c) 2014年 jakey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (JKNIB)

/// 加载同类名的 XIB 文件
+ (UINib *)jk_nib;

@end
