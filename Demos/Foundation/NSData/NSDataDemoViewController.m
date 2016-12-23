//
//  NSDataDemoViewController.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/3/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSDataDemoViewController.h"
#import "NSData+JKEncrypt.h"

#import "NSString+JKEncrypt.h"
@interface NSDataDemoViewController ()

@end

@implementation NSDataDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//     const char bytes[] = {0x52, 0x49, 0x46, 0x46, 0x26, 0x0, 0x0, 0x0, 0x57, 0x41, 0x56, 0x45, 0x66, 0x6d, 0x74, 0x20, 0x10, 0x0, 0x0, 0x0, 0x1, 0x0, 0x1, 0x0, 0x44, 0xac, 0x0, 0x0, 0x88, 0x58, 0x1, 0x0, 0x2, 0x0, 0x10, 0x0, 0x64, 0x61, 0x74, 0x61, 0x2, 0x0, 0x0, 0x0, 0xfc, 0xff};
//    NSData* data = [NSData dataWithBytes:bytes length:sizeof(bytes)];
//   __unused NSData* data2 = [data jk_encryptedWithAESUsingKey:@"123456781234567" andIV:nil];
//
    __unused  NSString *aes = [@"123" jk_encryptedWithAESUsingKey:@"1234567812345678" andIV:nil];

    __unused  NSString *des = [@"123" jk_encryptedWith3DESUsingKey:@"12345678" andIV:nil];

   __unused  NSString *des3 = [@"123" jk_encryptedWith3DESUsingKey:@"123456781234567812345678" andIV:nil];
    
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
