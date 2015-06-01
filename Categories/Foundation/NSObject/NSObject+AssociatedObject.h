//
//  NSObject+AssociatedObject.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/11.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AssociatedObject)
- (void)associateValue:(id)value withKey:(void *)key; // Strong reference
- (void)weaklyAssociateValue:(id)value withKey:(void *)key;
- (id)associatedValueForKey:(void *)key;
@end
