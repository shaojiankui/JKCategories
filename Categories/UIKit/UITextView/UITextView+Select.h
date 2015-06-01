//
//  UITextView+Select.h
//  IOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/6/1.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Select)
- (void)selectAllText;
- (void)setSelectedRange:(NSRange)range;
@end
