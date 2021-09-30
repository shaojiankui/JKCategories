//
//  UIFont+DynamicFontControl.h
//
//  Created by Michael Kral on 10/28/13.
//  Copyright (c) 2013 Michael Kral. All rights reserved.
//

/**
 Reference: <https://github.com/mkral/UIFont-DynamicFontControlDemo>
 */
#import <UIKit/UIKit.h>

@interface UIFont (JKDynamicFontControl)

+ (UIFont *)jk_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName scale:(CGFloat)scale;

+ (UIFont *)jk_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName;

- (UIFont *)jk_adjustFontForTextStyle:(NSString *)style;

- (UIFont *)jk_adjustFontForTextStyle:(NSString *)style scale:(CGFloat)scale;

@end
