//
//  UITableViewCell+NIB.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/11/19.
//  Copyright (c) 2014年 jakey. All rights reserved.
//

#import "UITableViewCell+JKNIB.h"

@implementation UITableViewCell (JKNIB)

+ (UINib *)jk_nib{
   return  [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end
