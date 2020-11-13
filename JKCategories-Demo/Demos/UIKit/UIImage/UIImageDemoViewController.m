//
//  UIImageDemoViewController.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/3/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIImageDemoViewController.h"

#import <JKCategories/UIImage+JKResize.h>

@interface UIImageDemoViewController ()

@end

@implementation UIImageDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	for (int i = 0; i < 7; i++) {
		UIImage *image = [UIImage imageNamed:@"diannao"];
		if (i == 0) image = [image jk_resizedImage:CGSizeMake(100, 100*0.728)];
		else image = [image jk_resizedImage:CGSizeMake(100, 100*0.728) interpolationQuality:i - 1];
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		[btn setImage:image forState:UIControlStateNormal];
		btn.frame = CGRectMake(100, 100 * i + 100, 200, 100);
		btn.layer.borderColor = UIColor.redColor.CGColor;
		btn.layer.borderWidth = 1;
		[self.view addSubview:btn];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
