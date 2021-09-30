JKCategories(iOS-Categories)
================

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/shaojiankui/JKCategories/master/LICENSE)&nbsp;
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/JKCategories-andy0570.svg?style=flat)](http://cocoapods.org/?q=JKCategories-andy0570)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/JKCategories-andy0570.svg?style=flat)](http://cocoapods.org/?q=JKCategories-andy0570)&nbsp;
[![Language](https://img.shields.io/badge/language-Objective--C-informational)](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%209%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
[![Build Status](https://travis-ci.org/Andy0570/JKCategories-andy0570.svg?branch=master)](https://travis-ci.org/Andy0570/JKCategories)&nbsp;
[![Gitmoji](https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg?style=flat-square)](https://gitmoji.dev)&nbsp;


JKCategories(iOS-Categories), a collection of useful Objective-C Categories extending iOS Frameworks such as Foundation, UIKit, QuartzCore, CoreLocation, MapKit...

## Requirements
This library requires `iOS 9.0+` and `Xcode 10.0+`.

## Installation

### Installation with CocoaPods
when you will use the all Categories:

```ruby
platform :ios
pod 'JKCategories'
```

when you will use the some one type framework lib,such as `Foundation`:

```ruby
platform :ios
pod 'JKCategories/Foundation'
```

when you will use a more detailed class type lib, in some one type framework lib,such as `Foundation's NSDictionary`:

```ruby
platform :ios
pod 'JKCategories/Foundation/NSDictionary'
```

you will find all sublib with `pod search  JKCategories` or Podfile or in the project folder hierarchy
### Manually

Copy JKCategories or some specific class file to your project

## Usage
import the header file into any class where you wish to make use of the functionality such as 

```objc
#import "NSArray+JKSafeAccess.h" or "<JKCategories/NSArray+JKSafeAccess.h>",
```

Not recommended for import all the header files of JKCategories into pch or baseclass

#### onekey import all categories of framework

```objc
"JKUIKit.h" or "<JKCategories/JKUIKit.h>",
"JKFoundation.h" or "<JKCategories/JKFoundation.h>",
"JKCoreData.h" or "<JKCategories/JKCoreData.h>",
"JKCoreLocation.h" or "<JKCategories/JKCoreLocation.h>",
"JKMapKit.h"  or "<JKCategories/JKMapKit.h>",
"JKQuartzCore.h"  or "<JKCategories/JKQuartzCore.h>""
```

#### onekey import all categories of all frameworks

```objc
"JKCategories.h" or <JKCategories/JKCategories.h>,
```

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

### CoreLocation
* CLLocationManager
* CLLocation

### MapKit
* MKMapView

## License

JKCategories is available under the MIT license.

