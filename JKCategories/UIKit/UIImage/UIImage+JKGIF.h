//
//  UIImage+GIF.h
//  LBGIFImage
//
//  Created by Laurin Brandner on 06.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JKGIF)

+ (UIImage *)jk_animatedGIFNamed:(NSString *)name;

+ (UIImage *)jk_animatedGIFWithData:(NSData *)data;

- (UIImage *)jk_animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end
