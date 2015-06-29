//
//  NSDictionaryDemoViewController.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/3/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSDictionaryDemoViewController.h"
#import "NSDictionary+SafeAccess.h"
#import "NSDictionary+Merge.h"
@interface NSDictionaryDemoViewController ()

@end

@implementation NSDictionaryDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    NSDictionary *responseObject;
    //__unused  只是用来屏蔽未使用警告
    __unused NSDictionary *d = [responseObject dictionaryForKey:@"object"];
    
    __unused NSArray *array = [responseObject arrayForKey:@"array"];
    
    __unused NSString *string = [responseObject stringForKey:@"string"];
    
    __unused long long date = [responseObject longLongForKey:@"date"];
    
    __unused NSNumber *number = [responseObject numberForKey:@"number"];
    
    __unused NSInteger count = [responseObject integerForKey:@"count"];
    
    __unused BOOL b = [responseObject boolForKey:@"count"];
    
    __unused CGPoint point = [responseObject pointForKey:@"point"];
    
    __unused CGFloat f = [responseObject CGFloatForKey:@"float"];
    
    __unused CGRect rect = [responseObject rectForKey:@"rect"];
    
    __unused CGSize size = [responseObject sizeForKey:@"size"];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObj:@"334" forKey:@"obj"];
    
    [dict setString:@"string" forKey:@"str"];
    
    [dict setBool:YES forKey:@"b"];
    
    [dict setInt:1 forKey:@"intvalue"];
    
    [dict setCGFloat:1.1 forKey:@"float"];
    
    [dict setPoint:CGPointMake(1, 1) forKey:@"point"];
    
    [dict setSize:CGSizeMake(111, 111) forKey:@"size"];
    
    [dict setRect:CGRectMake(0, 0, 0, 0) forKey:@"rect"];
    
    NSLog(@"dict %@",[dict description]);

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
