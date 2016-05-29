//
//  NSString+JKPinyin.h
//  Snowball
//
//  Created by croath on 11/11/13.
//  Copyright (c) 2013 Snowball. All rights reserved.
//
// https://github.com/croath/NSString-Pinyin
//  the Chinese Pinyin string of the nsstring

#import <Foundation/Foundation.h>

@interface NSString (JKPinyin)

- (NSString*)jk_pinyinWithPhoneticSymbol;
- (NSString*)jk_pinyin;
- (NSArray*)jk_pinyinArray;
- (NSString*)jk_pinyinWithoutBlank;
- (NSArray*)jk_pinyinInitialsArray;
- (NSString*)jk_pinyinInitialsString;

@end
