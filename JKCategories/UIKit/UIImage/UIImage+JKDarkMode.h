//
//  UIImage+JKDarkMode.h
//  JKCategories
//
//  Created by Qilin Hu on 2021/9/6.
//  Copyright © 2020 Qilin Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JKDarkMode)

+ (void)d_fixResizableImage;

+ (UIImage *)jk_imageWithLightImageNamed:(NSString *)lightImageName
                          darkImageNamed:(NSString *)darkImageNamed;

@end

NS_ASSUME_NONNULL_END
