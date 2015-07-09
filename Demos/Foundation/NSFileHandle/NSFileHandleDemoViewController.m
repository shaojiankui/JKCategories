//
//  NSFileHandleDemoViewController.m
//  IOS-Categories
//
//  Created by Jakey on 15/7/9.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import "NSFileHandleDemoViewController.h"
#import "NSFileHandle+readLine.h"
@interface NSFileHandleDemoViewController ()

@end

@implementation NSFileHandleDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSMutableArray *linesFound = [[NSMutableArray alloc] init];
    
    // Open our demo file
    
    NSString *demoFilePath = [[NSBundle mainBundle] pathForResource:@"NSFileHandleSampleFile" ofType:@"txt"];
    NSFileHandle *demoFileHandle = [NSFileHandle fileHandleForReadingAtPath:demoFilePath];
    
    // Use readLineWithDelimiter to fill our NSTableView with each line found
    
    NSData *lineData;
    
    while ((lineData = [demoFileHandle readLineWithDelimiter:@"\n"]))
    {
        NSString *lineString = [[NSString alloc] initWithData:lineData encoding:NSASCIIStringEncoding];
        NSLog(@"lineString:%@",lineString);

        [linesFound addObject:lineString];
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
