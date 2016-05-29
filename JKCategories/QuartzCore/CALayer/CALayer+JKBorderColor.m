//
//  CALayer+JKBorderColor.m
//  test
//
//  Created by LiuLogan on 15/6/17.
//  Copyright (c) 2015年 Xidibuy. All rights reserved.
//

#import "CALayer+JKBorderColor.h"

@implementation CALayer (JKBorderColor)

-(void)setJk_borderColor:(UIColor *)jk_borderColor{
    self.borderColor = jk_borderColor.CGColor;
}

- (UIColor*)jk_borderColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
