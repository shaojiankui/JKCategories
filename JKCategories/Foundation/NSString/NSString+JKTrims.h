//
//  NSString+JKTrims.h.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/3/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JKTrims)

/// 清除 HTML 标签
- (NSString *)jk_stringByStrippingHTML;

/// 清除 JavaScript 脚本
- (NSString *)jk_stringByRemovingScriptsAndStrippingHTML;

/// 修剪头部和尾部的空白字符（空格）
- (NSString *)jk_trimmingWhitespace;

/// 修剪头部和尾部的空白字符（空格和换行）
- (NSString *)jk_trimmingWhitespaceAndNewlines;

@end
