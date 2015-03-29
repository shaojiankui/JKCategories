//
//  NSObject+Additions.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (Additions)
- (NSDictionary*)dictionaryValue;
- (NSArray*)allPropertyKeys;
- (NSArray*)allPropertyKeyPaths;

// Exclude container type keypaths
- (NSArray*)allBasePropertyKeyPaths;
- (BOOL)hasPropertyForKey:(NSString*)key;
- (BOOL)hasIvarForKey:(NSString*)key;
- (id)valueForArrayIndexedKeyPath:(NSString *)keyPath;

@end
