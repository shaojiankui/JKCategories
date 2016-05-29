//
//  UIFont+DynamicFontControl.h
//
//  Created by Michael Kral on 10/28/13.
//  Copyright (c) 2013 Michael Kral. All rights reserved.
//

/**
 *  @Author(作者)         Michael Kral
 *
 *  @URL(地址)            https://github.com/mkral/UIFont-DynamicFontControlDemo
 *
 *  @Version(版本)        20150622
 *
 *  @Requirements(运行要求)
 *
 *  @Description(描述)      Simple Category for using UIFontTextStyle with other Fonts.

 *
 *  @Usage(使用) ..
 */

#import <UIKit/UIKit.h>

@interface UIFont (JKDynamicFontControl)


+(UIFont *)jk_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName scale:(CGFloat)scale;

+(UIFont *)jk_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName;



-(UIFont *)jk_adjustFontForTextStyle:(NSString *)style;

-(UIFont *)jk_adjustFontForTextStyle:(NSString *)style scale:(CGFloat)scale;



@end
