//
//  NSBundle+JKAppIcon.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSBundle+JKAppIcon.h"

@implementation NSBundle (JKAppIcon)
- (NSString*)jk_appIconPath {
    NSString* iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString* iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString* iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

- (UIImage*)jk_appIcon {
    UIImage*appIcon = [[UIImage alloc] initWithContentsOfFile:[self jk_appIconPath]] ;
    return appIcon;
}
@end
