//
//  UITextViewDemoViewController.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/3/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UITextViewDemoViewController.h"
#import "UITextView+JKPlaceHolder.h"

@interface UITextViewDemoViewController ()
{
    UITextView *textView;
}

@end

@implementation UITextViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, CGRectGetWidth(self.view.bounds) - 20, 120)];
    textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textView.layer.borderWidth = 1.5f;
    [textView jk_addPlaceHolder:@"请输入您想要说的话..."];
    [self.view addSubview:textView];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchLoc = [touches.anyObject locationInView:self.view];
    if (!CGRectContainsPoint(textView.frame, touchLoc)) {
        [textView resignFirstResponder];
    }
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

@end
