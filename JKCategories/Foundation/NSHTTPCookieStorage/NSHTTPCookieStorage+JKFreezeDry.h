//
//  NSHTTPCookieStorage+FreezeDry.h
//
//  Created by Maciej Swic on 19/08/13.
//

/*
    Persists IWebV cookies to disk. To send the cookies with an initial NSURLRequest
    you must do the following after loading the cookies:
 
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:yourURL];
    NSDictionary* headers = [NSHTTPCookie requestHeaderFieldsWithCookies:[[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    [request setAllHTTPHeaderFields:headers];
*/

#import <Foundation/Foundation.h>

@interface NSHTTPCookieStorage (JKFreezeDry)

/// 存储 Web cookies 到磁盘目录
- (void)jk_saveCookie;

/// 从磁盘目录读取 Web cookies
- (void)jk_loadCookie;

@end
