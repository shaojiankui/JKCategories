//
//  UITextField+JKInputLimit.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 2016/11/29.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import "UITextField+JKInputLimit.h"
#import <objc/runtime.h>

static const void *JKTextFieldInputLimitMaxLength = &JKTextFieldInputLimitMaxLength;

@implementation UITextField (JKInputLimit)

- (NSInteger)jk_maxLength {
    return [objc_getAssociatedObject(self, JKTextFieldInputLimitMaxLength) integerValue];
}

- (void)setJk_maxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, JKTextFieldInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(jk_textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)jk_textFieldTextDidChange {
    // 0 不限制输入字数
    if (self.jk_maxLength <= 0) { return; }
    
    // 判断是否存在高亮字符，如果有，则不进行字数统计和字符串截断
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    if (position) { return; }
    
    // 判断是否超过最大字数限制，如果超过就截断
    if (self.text.length > self.jk_maxLength) {
        self.text = [self substringWith:self.text maxLength:self.jk_maxLength];
    }
}

// 获取指定索引处的字符范围
// 将 emoji 表情视为一个连续的字符串，如果 index 处于连续的字符串之间，就会返回这个字符串的 range
- (NSString *)substringWith:(NSString *)string maxLength:(NSInteger)maxLength {
    NSRange rangeIndex = [string rangeOfComposedCharacterSequenceAtIndex:maxLength];
    return [string substringToIndex:rangeIndex.location];
}

@end
