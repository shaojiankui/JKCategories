version = "1.5";

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
  s.platform     = :ios, "6.0"
  s.ios.deployment_target = "6.0"
  s.requires_arc = true
  s.frameworks = 'Foundation', 'UIKit', 'CoreData', 'QuartzCore', 'CoreLocation', 'MapKit'
  s.libraries    = "z"
  s.source       = { :git => "https://github.com/shaojiankui/JKCategories.git", :tag => "#{version}" }
  s.source_files = "JKCategories", "JKCategories/*.{h}","JKCategories/**/*.{h,m}"
  #s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end