//
//  RootViewController.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"iOS-Categories (https://github.com/shaojiankui/iOS-Categories)";
    _items = @{
            @"UIKit":@[@"UIBezierPath",
                       @"UIButton",
                       @"UIColor",
                       @"UIDevice",
                       @"UIImage",
                       @"UIImageView",
                       @"UILable",
                       @"UINavigationController",
                       @"UIResponder",
                       @"UIScrollView",
                       @"UISearchBar",
                       @"UITableViewCell",
                       @"UITextField",
                       @"UITextView",
                       @"UIView",
                       @"UIViewController",
                       @"UIWebView",
                       @"UIWindow",
                       @"MKMapView",
                       @"UITableView",
                       @"UINavigationBar",
                       @"UIAlertView",
                       @"UINavigationItem",
                       @"UIScreen",
                       @"UIControl",
                       @"UIApplication",
                       @"UIBarButtonItem"

                       ],
        @"Foundation":@[@"NSArray",
                        @"NSBundle",
                        @"NSData",
                        @"NSDate",
                        @"NSDictionary",
                        @"NSException",
                        @"NSFileManager",
                        @"NSObject",
                        @"NSSet",
                        @"NSString",
                        @"NSTimer",
                        @"NSURL",
                        @"NSUserDefaults",
                        @"NSIndexPath",
                        @"NSManagedObjectContext",
                        @"NSDateFormatter",
                        @"NSNumber"
                        
                        ],
         @"CoreLocation":@[
                        @"CLLocation",
                        @"CLLocationManager"
                         ] ,
            @"MapKit":@[
                        @"MKMapView"
                        ]
               };
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_items allKeys] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_items allKeys][section];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_items objectForKey:[_items allKeys][section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text =  [_items objectForKey:[_items allKeys][indexPath.section]][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *name =  [_items objectForKey:[_items allKeys][indexPath.section]][indexPath.row];
    NSString *className = [name stringByAppendingString:@"DemoViewController"];
    Class class = NSClassFromString(className);
    UIViewController *controller = [[class alloc]initWithNibName:className bundle:[NSBundle mainBundle]];
    controller.title = name;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
