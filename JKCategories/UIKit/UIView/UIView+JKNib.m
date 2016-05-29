//
//  UIView+Nib.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIView+JKNib.h"

@implementation UIView (JKNib)
#pragma mark - Nibs
+ (UINib *)jk_loadNib
{
    return [self jk_loadNibNamed:NSStringFromClass([self class])];
}
+ (UINib *)jk_loadNibNamed:(NSString*)nibName
{
    return [self jk_loadNibNamed:nibName bundle:[NSBundle mainBundle]];
}
+ (UINib *)jk_loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle
{
    return [UINib nibWithNibName:nibName bundle:bundle];
}
+ (instancetype)jk_loadInstanceFromNib
{
    return [self jk_loadInstanceFromNibWithName:NSStringFromClass([self class])];
}
+ (instancetype)jk_loadInstanceFromNibWithName:(NSString *)nibName
{
    return [self jk_loadInstanceFromNibWithName:nibName owner:nil];
}
+ (instancetype)jk_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner
{
    return [self jk_loadInstanceFromNibWithName:nibName owner:owner bundle:[NSBundle mainBundle]];
}
+ (instancetype)jk_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle
{
    UIView *result = nil;
    NSArray* elements = [bundle loadNibNamed:nibName owner:owner options:nil];
    for (id object in elements)
    {
        if ([object isKindOfClass:[self class]])
        {
            result = object;
            break;
        }
    }
    return result;
}

@end
