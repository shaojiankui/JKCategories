//
//  NSMutableDictionary+IFNil.h
//  categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (IFNil)
- (void)setValueIfNotNil:(id)value forKey:(NSString *)key;
@end
