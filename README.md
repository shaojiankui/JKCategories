JKCategories(iOS-Categories)
================
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/shaojiankui/JKCategories/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/JKCategories.svg?style=flat)](http://cocoapods.org/?q=JKCategories)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/JKCategories.svg?style=flat)](http://cocoapods.org/?q=JKCategories)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
[![Build Status](https://travis-ci.org/shaojiankui/JKCategories.svg?branch=master)](https://travis-ci.org/shaojiankui/JKCategories)


JKCategories(iOS-Categories), a collection of useful Objective-C Categories extending iOS Frameworks such as Foundation,UIKit,CoreData,QuartzCore,CoreLocation,MapKit Etc.

## Requirements
This library requires `iOS 7.0+` and `Xcode 8.0+`.

## Installation

### Installation with CocoaPods
when you will use the all Categories:

    platform :ios
    pod 'JKCategories'
 	
when you will use the some one type framework lib,such as `Foundation`:

    platform :ios
    pod 'JKCategories/Foundation'

when you will use a more detailed class type lib, in some one type framework lib,such as `Foundation's NSDictionary`:

    platform :ios
    pod 'JKCategories/Foundation/NSDictionary'
    
you will find all sublib with `pod search  JKCategories` or Podfile or in the project folder hierarchy
### Manually

Copy JKCategories or some specific class file to your project

## Usage
import the header file into any class where you wish to make use of the functionality such as 

    #import "NSArray+JKSafeAccess.h" or "<JKCategories/NSArray+JKSafeAccess.h>",

Not recommended for import all the header files of JKCategories into pch or baseclass

#### onekey import all categories of framework

	"JKUIKit.h" or "<JKCategories/JKUIKit.h>",
	"JKFoundation.h" or "<JKCategories/JKFoundation.h>",
	"JKCoreData.h" or "<JKCategories/JKCoreData.h>",
	"JKCoreLocation.h" or "<JKCategories/JKCoreLocation.h>",
	"JKMapKit.h"  or "<JKCategories/JKMapKit.h>",
	"JKQuartzCore.h"  or "<JKCategories/JKQuartzCore.h>""
	
#### onekey import all categories of all frameworks

	"JKCategories.h" or <JKCategories/JKCategories.h>,

## Content
### Foundation
* NSArray
* NSBundle
* NSData
* NSDate
* NSDateFormatter
* NSNotificationCenter
* NSDictionary
* NSException
* NSFileManager
* NSIndexPath
* NSNumber
* NSObject
* NSSet
* NSString
* NSTimer
* NSURL
* NSUserDefaults
* NSHTTPCookieStorage
* NSFileHandle
* NSRunLoop
* NSURLRequest
* NSOperation
* NSInvocation
* NSURLConnection
* NSURLSession

### UIKit
* UIAlertView
* UIApplication
* UIBarButtonItem
* UIBezierPath
* UIButton
* UIColor
* UIFont
* UIControl
* UIDevice
* UIImage
* UIImageView
* UILable
* UINavigationBar
* UINavigationController
* UINavigationItem
* UIResponder
* UIScreen
* UIScrollView
* UISearchBar
* UISplitViewController
* UITableView
* UITableViewCell
* UITextField
* UITextView
* UIView
* UIViewController
* UIWebView
* UIWindow
* UIPopoverController
* UICollectionView

### QuartzCore
* CALayer
* CAMediaTimingFunction
* CAAnimation
* CAShapeLayer
* CATransaction

### CoreData
* NSManagedObjectContext
* NSFetchRequest
* NSManagedObject
* NSPersistentStoreCoordinator

### CoreLocation
* CLLocationManager
* CLLocation

### MapKit
* MKMapView

## License

JKCategories is available under the MIT license.

