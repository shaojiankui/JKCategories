//
//  NSDictionary+URL.h
//  IOS-Categories
//
//  Created by Jakey on 15/8/7.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (URL)
+ (NSDictionary *)dictionaryWithURLQuery:(NSString *)query;
- (NSString *)URLQueryString;
@end
