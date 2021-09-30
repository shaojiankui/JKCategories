//
//  UIButton+JKTouchAreaInsets.h
//  JKCategories
//
//  Created by Qilin Hu on 2020/4/30.
//  Copyright © 2020 Qilin Hu. All rights reserved.
//

/**
 Reference:<https://github.com/devxoul/UIButton-TouchAreaInsets>
 */
#import <UIKit/UIKit.h>

@interface UIButton (JKTouchAreaInsets)

/// 设置按钮额外热区
@property (nonatomic, assign) UIEdgeInsets jk_touchAreaInsets;

@end
