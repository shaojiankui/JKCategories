//
//  UIImageView+Addition.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Addition)
+ (id) imageViewWithImageNamed:(NSString*)imageName;
+ (id) imageViewWithFrame:(CGRect)frame;
+ (id) imageViewWithStretchableImage:(NSString*)imageName Frame:(CGRect)frame;
+ (id) imageViewWithImageArray:(NSArray*)imageArray duration:(NSTimeInterval)duration;
- (void) setImageWithStretchableImage:(NSString*)imageName;
// 画水印
// 图片水印
- (void) setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect;
// 文字水印
- (void) setImage:(UIImage *)image withStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font;
- (void) setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;
@end
