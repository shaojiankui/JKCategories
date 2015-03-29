//
//  NSData+Gzip.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//


//Add libz.dylib to your project.
#import <Foundation/Foundation.h>
extern NSString* const GzipErrorDomain;
@interface NSData (Gzip)
- (NSData*)gzip:(NSError**)error;
@end
