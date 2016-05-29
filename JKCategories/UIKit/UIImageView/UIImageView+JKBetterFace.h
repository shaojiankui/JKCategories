//
//  UIImageView+BetterFace.h
//  bf
//
//  Created by croath on 13-10-22.
//  Copyright (c) 2013年 Croath. All rights reserved.
//
// https://github.com/croath/UIImageView-BetterFace
//  a UIImageView category to let the picture-cutting with faces showing better

#import <UIKit/UIKit.h>

@interface UIImageView (JKBetterFace)

@property (nonatomic) BOOL jk_needsBetterFace;
@property (nonatomic) BOOL jk_fast;

void jk_hack_uiimageview_bf();
- (void)jk_setBetterFaceImage:(UIImage *)image;

@end
