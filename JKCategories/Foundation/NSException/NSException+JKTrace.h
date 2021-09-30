//
//  NSException+Trace.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSException (JKTrace)

/// 回溯?
- (NSArray *)jk_backtrace;

@end
