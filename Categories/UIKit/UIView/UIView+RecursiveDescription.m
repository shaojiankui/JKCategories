//
//  UIView+RecursiveDescription.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIView+RecursiveDescription.h"

@implementation UIView (RecursiveDescription)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
-(NSString*)recursiveView
{
    NSString *description = [NSString stringWithFormat:@"%s [Line %d] \r\r %@",
                          __PRETTY_FUNCTION__, __LINE__,
                          [self performSelector:@selector(recursiveDescription)]];
    return description;
}
-(NSString*)constraintsDescription{
    NSString *description = [NSString stringWithFormat:@"%s [Line %d] \r\r %@ \r\r",
                             __PRETTY_FUNCTION__, __LINE__,
                             [[self constraints] description]];
    return description;
}
-(NSString*)autolayoutTraceDescription{
    NSString *description = [NSString stringWithFormat:@"%s [Line %d] \r\r %@",
                             __PRETTY_FUNCTION__, __LINE__,
                             [self performSelector:@selector(_autolayoutTrace)]];
    return description;
}
#pragma clang diagnostic pop
@end
