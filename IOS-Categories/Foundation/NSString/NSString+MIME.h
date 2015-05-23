//
//  NSString+MIME.h
//  IOS-Categories
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MIME)

- (NSString *)MIMEType;

+ (NSString *)MIMETypeForExtension:(NSString *)extension;

+ (NSDictionary *)MIMEDict;
@end
