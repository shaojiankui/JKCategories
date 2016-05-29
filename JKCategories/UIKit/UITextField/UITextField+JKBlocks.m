//
// UITextField+Blocks.m
// UITextFieldBlocks
//
// Created by Håkon Bogen on 19.10.13.
// Copyright (c) 2013 Håkon Bogen. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
#import "UITextField+JKBlocks.h"
#import <objc/runtime.h>
typedef BOOL (^JKUITextFieldReturnBlock) (UITextField *textField);
typedef void (^JKUITextFieldVoidBlock) (UITextField *textField);
typedef BOOL (^JKUITextFieldCharacterChangeBlock) (UITextField *textField, NSRange range, NSString *replacementString);
@implementation UITextField (JKBlocks)
static const void *JKUITextFieldDelegateKey = &JKUITextFieldDelegateKey;
static const void *JKUITextFieldShouldBeginEditingKey = &JKUITextFieldShouldBeginEditingKey;
static const void *JKUITextFieldShouldEndEditingKey = &JKUITextFieldShouldEndEditingKey;
static const void *JKUITextFieldDidBeginEditingKey = &JKUITextFieldDidBeginEditingKey;
static const void *JKUITextFieldDidEndEditingKey = &JKUITextFieldDidEndEditingKey;
static const void *JKUITextFieldShouldChangeCharactersInRangeKey = &JKUITextFieldShouldChangeCharactersInRangeKey;
static const void *JKUITextFieldShouldClearKey = &JKUITextFieldShouldClearKey;
static const void *JKUITextFieldShouldReturnKey = &JKUITextFieldShouldReturnKey;
#pragma mark UITextField Delegate methods
+ (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    JKUITextFieldReturnBlock block = textField.jk_shouldBegindEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, JKUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [delegate textFieldShouldBeginEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    JKUITextFieldReturnBlock block = textField.jk_shouldEndEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, JKUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [delegate textFieldShouldEndEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (void)textFieldDidBeginEditing:(UITextField *)textField
{
   JKUITextFieldVoidBlock block = textField.jk_didBeginEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, JKUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (void)textFieldDidEndEditing:(UITextField *)textField
{
    JKUITextFieldVoidBlock block = textField.jk_didEndEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, JKUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    JKUITextFieldCharacterChangeBlock block = textField.jk_shouldChangeCharactersInRangeBlock;
    if (block) {
        return block(textField,range,string);
    }
    id delegate = objc_getAssociatedObject(self, JKUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}
+ (BOOL)textFieldShouldClear:(UITextField *)textField
{
    JKUITextFieldReturnBlock block = textField.jk_shouldClearBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, JKUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [delegate textFieldShouldClear:textField];
    }
    return YES;
}
+ (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    JKUITextFieldReturnBlock block = textField.jk_shouldReturnBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, JKUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [delegate textFieldShouldReturn:textField];
    }
    return YES;
}
#pragma mark Block setting/getting methods
- (BOOL (^)(UITextField *))jk_shouldBegindEditingBlock
{
    return objc_getAssociatedObject(self, JKUITextFieldShouldBeginEditingKey);
}
- (void)setJk_shouldBegindEditingBlock:(BOOL (^)(UITextField *))shouldBegindEditingBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JKUITextFieldShouldBeginEditingKey, shouldBegindEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))jk_shouldEndEditingBlock
{
    return objc_getAssociatedObject(self, JKUITextFieldShouldEndEditingKey);
}
- (void)setJk_shouldEndEditingBlock:(BOOL (^)(UITextField *))shouldEndEditingBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JKUITextFieldShouldEndEditingKey, shouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))jk_didBeginEditingBlock
{
    return objc_getAssociatedObject(self, JKUITextFieldDidBeginEditingKey);
}
- (void)setJk_didBeginEditingBlock:(void (^)(UITextField *))didBeginEditingBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JKUITextFieldDidBeginEditingKey, didBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))jk_didEndEditingBlock
{
    return objc_getAssociatedObject(self, JKUITextFieldDidEndEditingKey);
}
- (void)setJk_didEndEditingBlock:(void (^)(UITextField *))didEndEditingBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JKUITextFieldDidEndEditingKey, didEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *, NSRange, NSString *))jk_shouldChangeCharactersInRangeBlock
{
    return objc_getAssociatedObject(self, JKUITextFieldShouldChangeCharactersInRangeKey);
}
- (void)setJk_shouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *, NSRange, NSString *))shouldChangeCharactersInRangeBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JKUITextFieldShouldChangeCharactersInRangeKey, shouldChangeCharactersInRangeBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))jk_shouldReturnBlock
{
    return objc_getAssociatedObject(self, JKUITextFieldShouldReturnKey);
}
- (void)setJk_shouldReturnBlock:(BOOL (^)(UITextField *))shouldReturnBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JKUITextFieldShouldReturnKey, shouldReturnBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))jk_shouldClearBlock
{
    return objc_getAssociatedObject(self, JKUITextFieldShouldClearKey);
}
- (void)setJk_shouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JKUITextFieldShouldClearKey, shouldClearBlock, OBJC_ASSOCIATION_COPY);
}
#pragma mark control method
/*
 Setting itself as delegate if no other delegate has been set. This ensures the UITextField will use blocks if no delegate is set.
 */
- (void)jk_setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UITextFieldDelegate>)[self class]) {
        objc_setAssociatedObject(self, JKUITextFieldDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UITextFieldDelegate>)[self class];
    }
}
@end