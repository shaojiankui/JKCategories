//
//  UIImage+wiRoundedRectImage.h
//  vw-vip
//
//  Created by jakey on 14-3-21.
//  Copyright (c) 2014年 zhangkongli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (wiRoundedRectImage)
+ (id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;
@end
