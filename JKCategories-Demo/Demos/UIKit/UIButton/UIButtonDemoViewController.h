//
//  UIButtonDemoViewController.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/3/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "BaseViewController.h"

@interface UIButtonDemoViewController : BaseViewController

- (IBAction)countButtonTouchd:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *blockButton;
@end
