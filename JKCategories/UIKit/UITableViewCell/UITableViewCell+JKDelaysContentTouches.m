//
//  UITableViewCell+TS_delaysContentTouches.m
//  tableViewCellDelaysContentTouches
//
//  Created by Nicholas Hodapp on 1/31/14.
//  Copyright (c) 2014 Nicholas Hodapp. All rights reserved.
//

#import "UITableViewCell+JKDelaysContentTouches.h"

@implementation UITableViewCell (JKDelaysContentTouches)

- (UIScrollView*) jk_scrollView
{
    id sv = self.contentView.superview;
    while ( ![sv isKindOfClass: [UIScrollView class]] && sv != self )
    {
        sv = [sv superview];
    }
    
    return sv == self ? nil : sv;
}

- (void) setJk_delaysContentTouches:(BOOL)delaysContentTouches
{
    [self willChangeValueForKey: @"jk_delaysContentTouches"];
    
    [[self jk_scrollView] setDelaysContentTouches: delaysContentTouches];
    
    [self didChangeValueForKey: @"jk_delaysContentTouches"];
}

- (BOOL) jk_delaysContentTouches
{
    return [[self jk_scrollView] delaysContentTouches];
}



@end
