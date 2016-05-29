//
//  UIViewController+StoreKit.h
//  Picks
//
//  Created by Joe Fabisevich on 8/12/14.
//  Copyright (c) 2014 Snarkbots. All rights reserved.
//  https://github.com/mergesort/UIViewController-StoreKit

#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Constants

#define affiliateToken @"10laQX"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface UIViewController (JKStoreKit)

@property NSString *jk_campaignToken;
@property (nonatomic, copy) void (^jk_loadingStoreKitItemBlock)(void);
@property (nonatomic, copy) void (^jk_loadedStoreKitItemBlock)(void);

- (void)jk_presentStoreKitItemWithIdentifier:(NSInteger)itemIdentifier;

+ (NSURL*)jk_appURLForIdentifier:(NSInteger)identifier;

+ (void)jk_openAppURLForIdentifier:(NSInteger)identifier;
+ (void)jk_openAppReviewURLForIdentifier:(NSInteger)identifier;

+ (BOOL)jk_containsITunesURLString:(NSString*)URLString;
+ (NSInteger)jk_IDFromITunesURL:(NSString*)URLString;

@end
