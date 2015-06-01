//
//  NSString+Contains.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by 符现超 on 15/5/9.
//  Copyright (c) 2015年 http://weibo.com/u/1655766025 All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Contains)

///判断URL中是否包含中文
- (BOOL)isContainChinese;

///是否包含空格
- (BOOL)isContainBlank;

///Unicode编码的字符串转成NSString
- (NSString *)makeUnicodeToString;

- (BOOL)containsCharacterSet:(NSCharacterSet *)set;

- (BOOL)containsString:(NSString *)string;

- (int)wordsCount;

@end
