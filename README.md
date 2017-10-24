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

    platform :ios
    pod 'JKCategories'
 	
### Manually

Copy JKCategories folder to your project

## Usage
import the header file into any class where you wish to make use of the functionality such as **#import "NSArray+JKSafeAccess.h"** ,Not recommended for import all the header files of JKCategories into pch or baseclass

#### onekey import all categories of framework

"JKUIKit.h","JKFoundation.h","JKCoreData.h","JKCoreLocation.h","JKMapKit.h","JKQuartzCore.h" 
#### onekey import all categories of all frameworks

"JKCategories.h",

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

