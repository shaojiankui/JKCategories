//
//  UIImageView+Addition.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIImageView+JKAddition.h"

@implementation UIImageView (JKAddition)

+ (id)jk_imageViewWithImageNamed:(NSString*)imageName
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
}

+ (id)jk_imageViewWithFrame:(CGRect)frame
{
    return [[UIImageView alloc] initWithFrame:frame];
}

+ (id)jk_imageViewWithStretchableImage:(NSString*)imageName Frame:(CGRect)frame
{
    UIImage *image =[UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    return imageView;
}

- (void)jk_setImageWithStretchableImage:(NSString*)imageName
{
    UIImage *image =[UIImage imageNamed:imageName];
    self.image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
}

+ (id)jk_imageViewWithImageArray:(NSArray *)imageArray duration:(NSTimeInterval)duration;
{
    if (imageArray && [imageArray count]<=0)
    {
        return nil;
    }
    UIImageView *imageView = [UIImageView jk_imageViewWithImageNamed:[imageArray objectAtIndex:0]];
    NSMutableArray *images = [NSMutableArray array];
    for (NSInteger i = 0; i < imageArray.count; i++)
    {
        UIImage *image = [UIImage imageNamed:[imageArray objectAtIndex:i]];
        [images addObject:image];
    }
    [imageView setImage:[images objectAtIndex:0]];
    [imageView setAnimationImages:images];
    [imageView setAnimationDuration:duration];
    [imageView setAnimationRepeatCount:0];
    return imageView;
}

// 画水印
- (void)jk_setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect
{
    // 0.0 for scale means "scale for device's main screen".
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    [image drawInRect:self.bounds]; // 原图
    [mark drawInRect:rect]; // 水印图
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = newImage;
}

- (void)jk_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font
{
    // 0.0 for scale means "scale for device's main screen".
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    [image drawInRect:self.bounds];

    // 文字
    if ([markString respondsToSelector:@selector(drawInRect:withAttributes:)]) {
        NSDictionary *attrbutes = @{
            NSFontAttributeName: font,
            NSForegroundColorAttributeName : color
        };
        [markString drawInRect:rect withAttributes:attrbutes];
    }

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = newImage;
}

- (void)jk_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font
{
    // 0.0 for scale means "scale for device's main screen".
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    [image drawInRect:self.bounds];
        
    // 文字
    if ([markString respondsToSelector:@selector(drawInRect:withAttributes:)]) {
        NSDictionary *attrbutes = @{
            NSFontAttributeName: font,
            NSForegroundColorAttributeName : color
        };
        [markString drawAtPoint:point withAttributes:attrbutes];
    }

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = newImage;
}

@end
