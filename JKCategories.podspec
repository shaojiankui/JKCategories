version = "1.8.1";

Pod::Spec.new do |s|
  s.name         = "JKCategories"
  s.version      = version
  s.summary      = "JKCategories(iOS-Categories), a collection of useful Objective-C Categories extending iOS Frameworks"
  s.description      = <<-DESC
                       JKCategories(iOS-Categories), a collection of useful Objective-C Categories extending iOS Frameworks such as Foundation,UIKit,CoreData,QuartzCore,CoreLocation,MapKit Etc.
                       DESC
  s.homepage     = "https://github.com/shaojiankui/JKCategories"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "skyfox" => "i@skyfox.org" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.requires_arc = true
  #s.frameworks = 'Foundation', 'UIKit', 'CoreData', 'QuartzCore', 'CoreLocation', 'MapKit','Security'
  s.libraries    = "z"
  s.source       = { :git => "https://github.com/shaojiankui/JKCategories.git", :tag => "#{version}" }

#  s.source_files = "JKCategories", "JKCategories/*.{h}","JKCategories/**/*.{h,m}"
  #s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.public_header_files = 'JKCategories/JKCategories.h'
  s.source_files = 'JKCategories/JKCategories.h'


  
  
  #Foundation
  s.subspec 'Foundation' do |foundation|
#      foundation.source_files = 'JKCategories/Foundation/**/*.{h,m}'
#      foundation.source_files = 'JKCategories/Foundation/**/*.{h,m}'
      foundation.public_header_files = 'JKCategories/Foundation/JKFoundation.h'
      foundation.source_files = 'JKCategories/Foundation/JKFoundation.h'
      foundation.frameworks = 'Foundation','Security'
      #三级
      foundation.subspec 'NSArray' do |array|
          array.source_files = 'JKCategories/Foundation/NSArray/*.{h,m}'
      end
      foundation.subspec 'NSBundle' do |bundle|
          bundle.source_files = 'JKCategories/Foundation/NSBundle/*.{h,m}'
      end
      foundation.subspec 'NSData' do |data|
          data.source_files = 'JKCategories/Foundation/NSData/*.{h,m}'
      end
      foundation.subspec 'NSDate' do |date|
          date.source_files = 'JKCategories/Foundation/NSDate/*.{h,m}'
      end
      foundation.subspec 'NSDateFormatter' do |dateformatter|
          dateformatter.source_files = 'JKCategories/Foundation/NSDateFormatter/*.{h,m}'
      end
      foundation.subspec 'NSDictionary' do |dictinoary|
          dictinoary.source_files = 'JKCategories/Foundation/NSDictionary/*.{h,m}'
      end
      foundation.subspec 'NSException' do |exception|
          exception.source_files = 'JKCategories/Foundation/NSException/*.{h,m}'
      end
      foundation.subspec 'NSFileHandle' do |filehandle|
          filehandle.source_files = 'JKCategories/Foundation/NSFileHandle/*.{h,m}'
      end
      foundation.subspec 'NSFileManager' do |filemanager|
          filemanager.source_files = 'JKCategories/Foundation/NSFileManager/*.{h,m}'
      end
      foundation.subspec 'NSHTTPCookieStorage' do |httpcookiestorage|
          httpcookiestorage.source_files = 'JKCategories/Foundation/NSHTTPCookieStorage/*.{h,m}'
      end
      foundation.subspec 'NSIndexPath' do |indexpath|
          indexpath.source_files = 'JKCategories/Foundation/NSIndexPath/*.{h,m}'
      end
      foundation.subspec 'NSInvocation' do |invocation|
          invocation.source_files = 'JKCategories/Foundation/NSInvocation/*.{h,m}'
      end
      foundation.subspec 'NSNotificationCenter' do |notificationcenter|
          notificationcenter.source_files = 'JKCategories/Foundation/NSNotificationCenter/*.{h,m}'
      end
      foundation.subspec 'NSNumber' do |number|
          number.source_files = 'JKCategories/Foundation/NSNumber/*.{h,m}'
      end
      foundation.subspec 'NSObject' do |object|
          object.source_files = 'JKCategories/Foundation/NSObject/*.{h,m}'
      end
      foundation.subspec 'NSRunLoop' do |runLoop|
          runLoop.source_files = 'JKCategories/Foundation/NSRunLoop/*.{h,m}'
      end
      foundation.subspec 'NSSet' do |set|
          set.source_files = 'JKCategories/Foundation/NSSet/*.{h,m}'
      end
      foundation.subspec 'NSString' do |string|
          string.source_files = 'JKCategories/Foundation/NSString/*.{h,m}'
          string.dependency 'JKCategories/Foundation/NSData'
      end
      foundation.subspec 'NSTimer' do |timer|
          timer.source_files = 'JKCategories/Foundation/NSTimer/*.{h,m}'
      end
      foundation.subspec 'NSURL' do |url|
          url.source_files = 'JKCategories/Foundation/NSURL/*.{h,m}'
      end
      foundation.subspec 'NSURLConnection' do |connection|
          connection.source_files = 'JKCategories/Foundation/NSURLConnection/*.{h,m}'
      end
      foundation.subspec 'NSURLRequest' do |urlrequest|
          urlrequest.source_files = 'JKCategories/Foundation/NSURLRequest/*.{h,m}'
      end
      foundation.subspec 'NSURLSession' do |urlsession|
          urlsession.source_files = 'JKCategories/Foundation/NSURLSession/*.{h,m}'
      end
      foundation.subspec 'NSUserDefaults' do |userdefaults|
          userdefaults.source_files = 'JKCategories/Foundation/NSUserDefaults/*.{h,m}'
      end
  end
  
  #UIKit
  s.subspec 'UIKit' do |uikit|
      # uikit.source_files = 'JKCategories/UIKit/**/*.{h,m}'
      uikit.public_header_files = 'JKCategories/UIKit/JKUIKit.h'
      uikit.source_files = 'JKCategories/UIKit/JKUIKit.h'
      uikit.frameworks = 'UIKit'

      uikit.subspec 'UIAlertView' do |alertview|
          alertview.source_files = 'JKCategories/UIKit/UIAlertView/*.{h,m}'
      end
      uikit.subspec 'UIApplication' do |application|
          application.source_files = 'JKCategories/UIKit/UIApplication/*.{h,m}'
      end
      uikit.subspec 'UIBarButtonItem' do |barbuttonitem|
          barbuttonitem.source_files = 'JKCategories/UIKit/UIBarButtonItem/*.{h,m}'
      end
      uikit.subspec 'UIBezierPath' do |bezierpath|
          bezierpath.source_files = 'JKCategories/UIKit/UIBezierPath/*.{h,m}'
      end
      uikit.subspec 'UIButton' do |button|
          button.source_files = 'JKCategories/UIKit/UIButton/*.{h,m}'
      end
      uikit.subspec 'UIColor' do |color|
          color.source_files = 'JKCategories/UIKit/UIColor/*.{h,m}'
      end
      uikit.subspec 'UIControl' do |control|
          control.source_files = 'JKCategories/UIKit/UIControl/*.{h,m}'
      end
      uikit.subspec 'UIDevice' do |device|
          device.source_files = 'JKCategories/UIKit/UIDevice/*.{h,m}'
      end
      uikit.subspec 'UIFont' do |font|
          font.source_files = 'JKCategories/UIKit/UIFont/*.{h,m}'
      end
      uikit.subspec 'UIImage' do |image|
          image.source_files = 'JKCategories/UIKit/UIImage/*.{h,m}'
      end
      uikit.subspec 'UIImageView' do |imageview|
          imageview.source_files = 'JKCategories/UIKit/UIImageView/*.{h,m}'
      end
      uikit.subspec 'UILable' do |lable|
          lable.source_files = 'JKCategories/UIKit/UILable/*.{h,m}'
      end
      uikit.subspec 'UINavigationBar' do |navigationbar|
          navigationbar.source_files = 'JKCategories/UIKit/UINavigationBar/*.{h,m}'
      end
      uikit.subspec 'UINavigationController' do |navigationcontroller|
          navigationcontroller.source_files = 'JKCategories/UIKit/UINavigationController/*.{h,m}'
      end
      uikit.subspec 'UINavigationItem' do |navigationitem|
          navigationitem.source_files = 'JKCategories/UIKit/UINavigationItem/*.{h,m}'
      end
      uikit.subspec 'UIPopoverController' do |popovercontrolller|
          popovercontrolller.source_files = 'JKCategories/UIKit/UIPopoverController/*.{h,m}'
      end
      uikit.subspec 'UIResponder' do |responder|
          responder.source_files = 'JKCategories/UIKit/UIResponder/*.{h,m}'
      end
      uikit.subspec 'UIScreen' do |screen|
          screen.source_files = 'JKCategories/UIKit/UIScreen/*.{h,m}'
      end
      uikit.subspec 'UIScrollView' do |scrollview|
          scrollview.source_files = 'JKCategories/UIKit/UIScrollView/*.{h,m}'
      end
      uikit.subspec 'UISearchBar' do |searchbar|
          searchbar.source_files = 'JKCategories/UIKit/UISearchBar/*.{h,m}'
      end
      uikit.subspec 'UISplitViewController' do |splitviewcontroller|
          splitviewcontroller.source_files = 'JKCategories/UIKit/UISplitViewController/*.{h,m}'
      end
      uikit.subspec 'UITableView' do |tableview|
          tableview.source_files = 'JKCategories/UIKit/UITableView/*.{h,m}'
      end
      uikit.subspec 'UITableViewCell' do |tableviewcell|
          tableviewcell.source_files = 'JKCategories/UIKit/UITableViewCell/*.{h,m}'
      end
      uikit.subspec 'UITextField' do |textfield|
          textfield.source_files = 'JKCategories/UIKit/UITextField/*.{h,m}'
      end
      uikit.subspec 'UITextView' do |textview|
          textview.source_files = 'JKCategories/UIKit/UITextView/*.{h,m}'
      end
      uikit.subspec 'UIView' do |view|
          view.source_files = 'JKCategories/UIKit/UIView/*.{h,m}'
      end
      uikit.subspec 'UIViewController' do |viewcontroller|
          viewcontroller.source_files = 'JKCategories/UIKit/UIViewController/*.{h,m}'
      end
      uikit.subspec 'UIWebView' do |webview|
          webview.source_files = 'JKCategories/UIKit/UIWebView/*.{h,m}'
          webview.dependency 'JKCategories/UIKit/UIColor'
      end
      uikit.subspec 'UIWindow' do |window|
          window.source_files = 'JKCategories/UIKit/UIWindow/*.{h,m}'
      end
  end

  #QuartzCore
  s.subspec 'QuartzCore' do |quartzcore|
      # quartzcore.source_files = 'JKCategories/QuartzCore/**/*.{h,m}'
      quartzcore.public_header_files = 'JKCategories/QuartzCore/JKQuartzCore.h'
      quartzcore.source_files = 'JKCategories/QuartzCore/JKQuartzCore.h'
      quartzcore.frameworks = 'QuartzCore','UIKit'

      quartzcore.subspec 'CAAnimation' do |animation|
          animation.source_files = 'JKCategories/QuartzCore/CAAnimation/*.{h,m}'
      end
      quartzcore.subspec 'CALayer' do |layer|
          layer.source_files = 'JKCategories/QuartzCore/CALayer/*.{h,m}'
      end
      quartzcore.subspec 'CAMediaTimingFunction' do |mediatimingfunction|
          mediatimingfunction.source_files = 'JKCategories/QuartzCore/CAMediaTimingFunction/*.{h,m}'
      end
      quartzcore.subspec 'CAShapeLayer' do |shapelayer|
          shapelayer.source_files = 'JKCategories/QuartzCore/CAShapeLayer/*.{h,m}'
      end
      quartzcore.subspec 'CATransaction' do |transaction|
          transaction.source_files = 'JKCategories/QuartzCore/CATransaction/*.{h,m}'
      end
  end
  
  #MapKit
  s.subspec 'MapKit' do |mapkit|
      # mapkit.source_files = 'JKCategories/MapKit/**/*.{h,m}'
      mapkit.public_header_files = 'JKCategories/MapKit/JKMapKit.h'
      mapkit.source_files = 'JKCategories/MapKit/JKMapKit.h'
      mapkit.frameworks = 'MapKit'

      mapkit.subspec 'MKMapView' do |mapview|
          mapview.source_files = 'JKCategories/MapKit/MKMapView/*.{h,m}'
      end
  end
  
  #CoreLocation
  s.subspec 'CoreLocation' do |corelocation|
#      corelocation.source_files = 'JKCategories/CoreLocation/**/*.{h,m}'
      corelocation.public_header_files = 'JKCategories/CoreLocation/JKCoreLocation.h'
      corelocation.source_files = 'JKCategories/CoreLocation/JKCoreLocation.h'
      corelocation.frameworks = 'CoreLocation'

      corelocation.subspec 'CLLocation' do |location|
          location.source_files = 'JKCategories/CoreLocation/CLLocation/*.{h,m}'
      end
  end
  
  #CoreData
  s.subspec 'CoreData' do |coredata|
      # coredata.source_files = 'JKCategories/CoreData/**/*.{h,m}'
      coredata.public_header_files = 'JKCategories/CoreData/JKCoreData.h'
      coredata.source_files = 'JKCategories/CoreData/JKCoreData.h'
      coredata.frameworks = 'CoreData'

      coredata.subspec 'NSFetchRequest' do |fecthrequest|
          fecthrequest.source_files = 'JKCategories/CoreData/NSFetchRequest/*.{h,m}'
      end
      coredata.subspec 'NSManagedObject' do |managerobject|
          managerobject.source_files = 'JKCategories/CoreData/NSManagedObject/*.{h,m}'
          managerobject.dependency 'JKCategories/CoreData/NSManagedObjectContext'
      end
      coredata.subspec 'NSManagedObjectContext' do |managerobjectcontext|
          managerobjectcontext.source_files = 'JKCategories/CoreData/NSManagedObjectContext/*.{h,m}'
          managerobjectcontext.dependency 'JKCategories/CoreData/NSFetchRequest'

      end
  end
  
end
