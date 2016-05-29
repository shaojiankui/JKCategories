//
//  UISearchBar+JKBlocks.m
//  UISearchBarBlocks
//
//  Created by Håkon Bogen on 20.10.13.
//  Copyright (c) 2013 Håkon Bogen. All rights reserved.
//

#import "UISearchBar+JKBlocks.h"
#import <objc/runtime.h>

/* Only for convenience and readabilty in delegate methods */
typedef BOOL (^JK_UISearchBarReturnBlock) (UISearchBar *searchBar);
typedef void (^JK_UISearchBarVoidBlock) (UISearchBar *searchBar);
typedef void (^JK_UISearchBarSearchTextBlock) (UISearchBar *searchBar,NSString *searchText);
typedef BOOL (^JK_UISearchBarInRangeReplacementTextBlock) (UISearchBar *searchBar,NSRange range,NSString *text);
typedef void (^JK_UISearchBarScopeIndexBlock)(UISearchBar *searchBar, NSInteger selectedScope);

@implementation UISearchBar (JKBlocks)


static const void *JK_UISearchBarDelegateKey                                = &JK_UISearchBarDelegateKey;
static const void *JK_UISearchBarShouldBeginEditingKey                      = &JK_UISearchBarShouldBeginEditingKey;
static const void *JK_UISearchBarTextDidBeginEditingKey                     = &JK_UISearchBarTextDidBeginEditingKey;
static const void *JK_UISearchBarShouldEndEditingKey                        = &JK_UISearchBarShouldEndEditingKey;
static const void *JK_UISearchBarTextDidEndEditingKey                       = &JK_UISearchBarTextDidEndEditingKey;
static const void *JK_UISearchBarTextDidChangeKey                           = &JK_UISearchBarTextDidChangeKey;
static const void *JK_UISearchBarShouldChangeTextInRangeKey                 = &JK_UISearchBarShouldChangeTextInRangeKey;
static const void *JK_UISearchBarSearchButtonClickedKey                                = &JK_UISearchBarSearchButtonClickedKey;
static const void *JK_UISearchBarBookmarkButtonClickedKey                                = &JK_UISearchBarBookmarkButtonClickedKey;
static const void *JK_UISearchBarCancelButtonClickedKey                                = &JK_UISearchBarCancelButtonClickedKey;
static const void *JK_UISearchBarResultsListButtonClickedKey                                = &JK_UISearchBarResultsListButtonClickedKey;
static const void *JK_UISearchBarSelectedScopeButtonIndexDidChangeKey                                = &JK_UISearchBarSelectedScopeButtonIndexDidChangeKey;




#pragma mark UISearchBar delegate Methods
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;
{
    JK_UISearchBarReturnBlock block = searchBar.jk_completionShouldBeginEditingBlock;
    if (block) {
        return block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, JK_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarShouldBeginEditing:)]){
        return [delegate searchBarShouldBeginEditing:searchBar];
    }
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    JK_UISearchBarVoidBlock block = searchBar.jk_completionTextDidBeginEditingBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, JK_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarTextDidBeginEditing:)]){
        [delegate searchBarTextDidBeginEditing:searchBar];
    }
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    JK_UISearchBarReturnBlock block = searchBar.jk_completionShouldEndEditingBlock;
    if (block) {
        return block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, JK_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarShouldEndEditing:)]){
        return [delegate searchBarShouldEndEditing:searchBar];
    }
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
   JK_UISearchBarVoidBlock block = searchBar.jk_completionTextDidEndEditingBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, JK_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarTextDidEndEditing:)]){
        [delegate searchBarTextDidEndEditing:searchBar];
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    JK_UISearchBarSearchTextBlock block = searchBar.jk_completionTextDidChangeBlock;
    if (block) {
        block(searchBar,searchText);
    }
    id delegate = objc_getAssociatedObject(self, JK_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBar:textDidChange:)]){
        [delegate searchBar:searchBar textDidChange:searchText];
    }
}
// called when text changes (including clear)
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    JK_UISearchBarInRangeReplacementTextBlock block = searchBar.jk_completionShouldChangeTextInRangeBlock;
    if (block) {
        return block(searchBar,range,text);
    }
    id delegate = objc_getAssociatedObject(self, JK_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBar:shouldChangeTextInRange:replacementText:)]){
        return [delegate searchBar:searchBar shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    JK_UISearchBarVoidBlock block = searchBar.jk_completionSearchButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, JK_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarSearchButtonClicked:)]){
        [delegate searchBarSearchButtonClicked:searchBar];
    }
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    JK_UISearchBarVoidBlock block = searchBar.jk_completionBookmarkButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, JK_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarBookmarkButtonClicked:)]){
        [delegate searchBarBookmarkButtonClicked:searchBar];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    JK_UISearchBarVoidBlock block = searchBar.jk_completionCancelButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, JK_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarCancelButtonClicked:)]){
        [delegate searchBarCancelButtonClicked:searchBar];
    }
}

- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar
{
    JK_UISearchBarVoidBlock block = searchBar.jk_completionResultsListButtonClickedBlock;
    if (block) {
        block(searchBar);
    }
    id delegate = objc_getAssociatedObject(self, JK_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBarResultsListButtonClicked:)]){
        [delegate searchBarResultsListButtonClicked:searchBar];
    }
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    JK_UISearchBarScopeIndexBlock block = searchBar.jk_completionSelectedScopeButtonIndexDidChangeBlock;
    if (block) {
        block(searchBar,selectedScope);
    }
    id delegate = objc_getAssociatedObject(self, JK_UISearchBarDelegateKey);
    
    if (delegate && [delegate respondsToSelector:@selector(searchBar:selectedScopeButtonIndexDidChange:)]){
        [delegate searchBar:searchBar selectedScopeButtonIndexDidChange:selectedScope];
    }
}


#pragma mark Block setting/getting methods
- (BOOL (^)(UISearchBar *))jk_completionShouldBeginEditingBlock
{
    return objc_getAssociatedObject(self, JK_UISearchBarShouldBeginEditingKey);
}

- (void)setJk_completionShouldBeginEditingBlock:(BOOL (^)(UISearchBar *))searchBarShouldBeginEditingBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JK_UISearchBarShouldBeginEditingKey, searchBarShouldBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))jk_completionTextDidBeginEditingBlock
{
    return objc_getAssociatedObject(self,JK_UISearchBarTextDidBeginEditingKey);
}

- (void)setJk_completionTextDidBeginEditingBlock:(void (^)(UISearchBar *))searchBarTextDidBeginEditingBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JK_UISearchBarTextDidBeginEditingKey, searchBarTextDidBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UISearchBar *))jk_completionShouldEndEditingBlock
{
    return objc_getAssociatedObject(self, JK_UISearchBarShouldEndEditingKey);
}

- (void)setJk_completionShouldEndEditingBlock:(BOOL (^)(UISearchBar *))searchBarShouldEndEditingBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JK_UISearchBarShouldEndEditingKey, searchBarShouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))jk_completionTextDidEndEditingBlock
{
    return objc_getAssociatedObject(self, JK_UISearchBarTextDidEndEditingKey);
}

- (void)setJk_completionTextDidEndEditingBlock:(void (^)(UISearchBar *))searchBarTextDidEndEditingBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JK_UISearchBarTextDidEndEditingKey, searchBarTextDidEndEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *, NSString *))jk_completionTextDidChangeBlock
{
    return objc_getAssociatedObject(self, JK_UISearchBarTextDidChangeKey);
}

- (void)setJk_completionTextDidChangeBlock:(void (^)(UISearchBar *, NSString *))searchBarTextDidChangeBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JK_UISearchBarTextDidChangeKey, searchBarTextDidChangeBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UISearchBar *, NSRange, NSString *))jk_completionShouldChangeTextInRangeBlock
{
    return objc_getAssociatedObject(self, JK_UISearchBarShouldChangeTextInRangeKey);
}

- (void)setJk_completionShouldChangeTextInRangeBlock:(BOOL (^)(UISearchBar *, NSRange, NSString *))searchBarShouldChangeTextInRangeBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JK_UISearchBarShouldChangeTextInRangeKey, searchBarShouldChangeTextInRangeBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))jk_completionSearchButtonClickedBlock
{
    return objc_getAssociatedObject(self, JK_UISearchBarSearchButtonClickedKey);
}

- (void)setJk_completionSearchButtonClickedBlock:(void (^)(UISearchBar *))searchBarSearchButtonClickedBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JK_UISearchBarSearchButtonClickedKey, searchBarSearchButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))jk_completionBookmarkButtonClickedBlock
{
    return objc_getAssociatedObject(self, JK_UISearchBarBookmarkButtonClickedKey);
}

- (void)setJk_completionBookmarkButtonClickedBlock:(void (^)(UISearchBar *))searchBarBookmarkButtonClickedBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JK_UISearchBarBookmarkButtonClickedKey, searchBarBookmarkButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))jk_completionCancelButtonClickedBlock
{
    return objc_getAssociatedObject(self, JK_UISearchBarCancelButtonClickedKey);
}

- (void)setJk_completionCancelButtonClickedBlock:(void (^)(UISearchBar *))searchBarCancelButtonClickedBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JK_UISearchBarCancelButtonClickedKey, searchBarCancelButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *))jk_completionResultsListButtonClickedBlock
{
    return objc_getAssociatedObject(self, JK_UISearchBarResultsListButtonClickedKey);
}

- (void)setJk_completionResultsListButtonClickedBlock:(void (^)(UISearchBar *))searchBarResultsListButtonClickedBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JK_UISearchBarResultsListButtonClickedKey, searchBarResultsListButtonClickedBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UISearchBar *, NSInteger))jk_completionSelectedScopeButtonIndexDidChangeBlock
{
    return objc_getAssociatedObject(self, JK_UISearchBarSelectedScopeButtonIndexDidChangeKey);
}

- (void)setJk_completionSelectedScopeButtonIndexDidChangeBlock:(void (^)(UISearchBar *, NSInteger))searchBarSelectedScopeButtonIndexDidChangeBlock
{
    [self jk_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, JK_UISearchBarSelectedScopeButtonIndexDidChangeKey, searchBarSelectedScopeButtonIndexDidChangeBlock, OBJC_ASSOCIATION_COPY);
}

- (void)jk_setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UISearchBarDelegate>)self) {
        objc_setAssociatedObject(self, JK_UISearchBarDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UISearchBarDelegate>)self;
    }
}

@end
