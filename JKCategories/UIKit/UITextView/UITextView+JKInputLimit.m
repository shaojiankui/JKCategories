//
//  UITextView+JKInputLimit.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 2016/11/29.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import "UITextView+JKInputLimit.h"
#import <objc/runtime.h>

static const void *JKTextViewInputLimitMaxLength = &JKTextViewInputLimitMaxLength;

@implementation UITextView (JKInputLimit)

- (NSInteger)jk_maxLength {
    return [objc_getAssociatedObject(self, JKTextViewInputLimitMaxLength) integerValue];
}

- (void)setJk_maxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, JKTextViewInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(jk_textViewTextDidChange:)
                                                name:UITextViewTextDidChangeNotification object:self];
}

- (void)jk_textViewTextDidChange:(NSNotification *)notification {
    if (self.jk_maxLength <= 0) { return; }
    
    NSString *toBeString = self.text;
    
    // 键盘输入模式
    NSString *primaryLanguage = self.textInputMode.primaryLanguage;
    // zh-Hans 代表简体中文输入，包括简体拼音，健体五笔，简体手写
    BOOL isChineseInputMode = [primaryLanguage isEqualToString:@"zh-Hans"] ||
                                [primaryLanguage isEqualToString:@"zh-Hant"] ||
                                    [primaryLanguage isEqualToString:@"zh-TW"];

    if (isChineseInputMode) {
        // 获取高亮部分
        UITextRange *selectedRange = [self markedTextRange];
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        
        // 如果没有高亮选择字符，则对已输入的文字进行字数统计和限制
        if (!position ||!selectedRange) {
            self.text = [self substringWith:toBeString index:self.jk_maxLength];
        }
    } else {
        self.text = [self substringWith:toBeString index:self.jk_maxLength];
    }
}

- (NSString *)substringWith:(NSString *)string index:(NSInteger)index {
    if (index >= string.length) { return string; }
    
    // 获取指定索引处的字符范围
    // 将 emoji 表情视为一个连续的字符串，如果 index 处于连续的字符串之间，就会返回这个字符串的 range
    NSRange rangeIndex = [string rangeOfComposedCharacterSequenceAtIndex:index];
    return [string substringToIndex:rangeIndex.location];
}

+ (void)load {
    Method originMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method newMethod = class_getInstanceMethod([self class], @selector(jk_textView_limit_swizzledDealloc));
    method_exchangeImplementations(originMethod, newMethod);
}

- (void)jk_textView_limit_swizzledDealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self jk_textView_limit_swizzledDealloc];
}

@end
