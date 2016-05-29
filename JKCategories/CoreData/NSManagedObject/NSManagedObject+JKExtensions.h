//
//  NSManagedObject+Extensions.h
//  kemmler
//
//  Created by Lars Kuhnt on 28.10.13.
//  Copyright (c) 2013 Coeus Solutions GmbH. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "NSManagedObjectContext+JKExtensions.h"

@interface NSManagedObject (JKExtensions)

+ (id)jk_create:(NSManagedObjectContext*)context;
+ (id)jk_create:(NSDictionary*)dict inContext:(NSManagedObjectContext*)context;
+ (id)jk_find:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context;
+ (id)jk_find:(NSPredicate *)predicate sortDescriptors:(NSArray*)sortDescriptors inContext:(NSManagedObjectContext *)context;
+ (NSArray*)jk_all:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context;
+ (NSArray*)jk_all:(NSPredicate *)predicate sortDescriptors:(NSArray*)sortDescriptors inContext:(NSManagedObjectContext *)context;
+ (NSUInteger)jk_count:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)contex;
+ (NSString *)jk_entityName;
+ (NSError*)jk_deleteAll:(NSManagedObjectContext*)context;

@end
