//
//  UIControl+JKBlock.h
//  FXCategories
//
//  Created by fox softer on 15/2/23.
//  Copyright (c) 2015年 foxsofter. All rights reserved.
//  https://github.com/foxsofter/FXCategories
//  http://stackoverflow.com/questions/2437875/target-action-uicontrolevents
#import <UIKit/UIKit.h>

@interface UIControl (JKBlock)

- (void)jk_touchDown:(void (^)(void))eventBlock;
- (void)jk_touchDownRepeat:(void (^)(void))eventBlock;
- (void)jk_touchDragInside:(void (^)(void))eventBlock;
- (void)jk_touchDragOutside:(void (^)(void))eventBlock;
- (void)jk_touchDragEnter:(void (^)(void))eventBlock;
- (void)jk_touchDragExit:(void (^)(void))eventBlock;
- (void)jk_touchUpInside:(void (^)(void))eventBlock;
- (void)jk_touchUpOutside:(void (^)(void))eventBlock;
- (void)jk_touchCancel:(void (^)(void))eventBlock;
- (void)jk_valueChanged:(void (^)(void))eventBlock;
- (void)jk_editingDidBegin:(void (^)(void))eventBlock;
- (void)jk_editingChanged:(void (^)(void))eventBlock;
- (void)jk_editingDidEnd:(void (^)(void))eventBlock;
- (void)jk_editingDidEndOnExit:(void (^)(void))eventBlock;

@end