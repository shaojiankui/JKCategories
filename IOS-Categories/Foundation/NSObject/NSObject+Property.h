//
//  NSObject+Property.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/20.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Property)
-(NSDictionary *)propertyDictionary;

+ (NSArray *)classPropertyList;
@end
