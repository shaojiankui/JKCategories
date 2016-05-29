//
//  UILabel+SuggestSize.h
//  WordPress
//
//  Created by Eric J on 6/18/13.
//  Copyright (c) 2013 WordPress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (JKSuggestSize)

- (CGSize)jk_suggestedSizeForWidth:(CGFloat)width;
- (CGSize)jk_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width;
- (CGSize)jk_suggestSizeForString:(NSString *)string width:(CGFloat)width;

@end
