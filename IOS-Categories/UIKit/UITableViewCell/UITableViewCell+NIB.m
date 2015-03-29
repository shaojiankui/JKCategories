//
//  UITableViewCell+NIB.m
//  IOS-Categories
//
//  Created by Jakey on 14/11/19.
//  Copyright (c) 2014年 jakey. All rights reserved.
//

#import "UITableViewCell+NIB.h"

@implementation UITableViewCell (NIB)
+(UINib*)nib{
   return  [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}
@end
