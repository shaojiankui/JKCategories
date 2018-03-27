//
//  JKCategories.h
//  JKCategories
//
//  Created by Jakey on 16/5/30.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//
#import <UIKit/UIKit.h>


#if __has_include(<JKCategories/JKCategories.h>)
FOUNDATION_EXPORT double JKCategoriesVersionNumber;
//! Project version string for JKCategories.
FOUNDATION_EXPORT const unsigned char JKCategoriesVersionString[];
// In this header, you should import all the public headers of your framework using statements like #import <JKCategories/PublicHeader.h>
#import <JKCategories/JKUIKit.h>
#import <JKCategories/JKQuartzCore.h>
#import <JKCategories/JKCoreData.h>
#import <JKCategories/JKFoundation.h>
#import <JKCategories/JKMapKit.h>
#import <JKCategories/JKCoreLocation.h>
#else
#import "JKUIKit.h"
#import "JKQuartzCore.h"
#import "JKCoreData.h"
#import "JKFoundation.h"
#import "JKMapKit.h"
#import "JKCoreLocation.h"
#endif
