//
//  NSDictionaryDemoViewController.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/3/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSDictionaryDemoViewController.h"
#import "NSDictionary+JKSafeAccess.h"
#import "NSDictionary+JKMerge.h"
@interface NSDictionaryDemoViewController ()

@end

@implementation NSDictionaryDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    NSDictionary *responseObject;
    //__unused  只是用来屏蔽未使用警告
    __unused NSDictionary *d = [responseObject jk_dictionaryForKey:@"object"];
    
    __unused NSArray *array = [responseObject jk_arrayForKey:@"array"];
    
    __unused NSString *string = [responseObject jk_stringForKey:@"string"];
    
    __unused long long date = [responseObject jk_longLongForKey:@"date"];
    
    __unused NSNumber *number = [responseObject jk_numberForKey:@"number"];
    
    __unused NSInteger count = [responseObject jk_integerForKey:@"count"];
    
    __unused BOOL b = [responseObject jk_boolForKey:@"count"];
    
    __unused CGPoint point = [responseObject jk_pointForKey:@"point"];
    
    __unused CGFloat f = [responseObject jk_CGFloatForKey:@"float"];
    
    __unused CGRect rect = [responseObject jk_rectForKey:@"rect"];
    
    __unused CGSize size = [responseObject jk_sizeForKey:@"size"];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict jk_setObj:@"334" forKey:@"obj"];
    
    [dict jk_setString:@"string" forKey:@"str"];
    
    [dict jk_setBool:YES forKey:@"b"];
    
    [dict jk_setInt:1 forKey:@"intvalue"];
    
    [dict jk_setCGFloat:1.1 forKey:@"float"];
    
    [dict jk_setPoint:CGPointMake(1, 1) forKey:@"point"];
    
    [dict jk_setSize:CGSizeMake(111, 111) forKey:@"size"];
    
    [dict jk_setRect:CGRectMake(0, 0, 0, 0) forKey:@"rect"];
    
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
