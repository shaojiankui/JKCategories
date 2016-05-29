//
//  UIButtonDemoViewController.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/3/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIButtonDemoViewController.h"
#import "UIButton+JKCountDown.h"
#import "UIButton+JKBlock.h"
#import "UIControl+JKActionBlocks.h"
#import "UIControl+JKBlock.h"
@interface UIButtonDemoViewController ()

@end

@implementation UIButtonDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.blockButton jk_handleControlEvents:UIControlEventTouchDragInside withBlock:^(id weakSender) {
        NSLog(@"UIControlEventTouchDragInside");
    }];
    [self.blockButton jk_handleControlEvents:UIControlEventTouchUpInside withBlock:^(id weakSender) {
        NSLog(@"UIControlEventTouchUpInside");
    }];
    
    [self.blockButton jk_touchUpInside:^{
        NSLog(@"touchUpInside");

    }];
    [self.blockButton jk_touchDown:^{
        NSLog(@"touchDown");
        
    }];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)countButtonTouchd:(id)sender {
    
    [sender jk_startTime:6 title:@"倒计时" waitTittle:@"秒"];

}
@end
