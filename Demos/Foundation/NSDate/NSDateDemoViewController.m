//
//  NSDateDemoViewController.m
//  IOS-Categories
//
//  Created by Jakey on 15/3/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSDateDemoViewController.h"
#import "NSDate+TimeAgo.h"

@interface NSDateDemoViewController ()

@end

@implementation NSDateDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:0];
    NSString *ago = [date timeAgo];
    NSLog(@"Output is: \"%@\"", ago);
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
