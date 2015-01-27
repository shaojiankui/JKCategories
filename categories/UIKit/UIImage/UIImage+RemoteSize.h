//
//  UIImage+RemoteSize.h
//  IOS-Categories
//
//  Created by Jakey on 15/1/27.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIImageSizeRequestCompleted) (NSURL* imgURL, CGSize size);

@interface UIImage (RemoteSize)

+ (void)requestSizeNoHeader:(NSURL*)imgURL completion:(UIImageSizeRequestCompleted)completion;

+ (void)requestSizeWithHeader:(NSURL*)imgURL completion:(UIImageSizeRequestCompleted)completion;

@end