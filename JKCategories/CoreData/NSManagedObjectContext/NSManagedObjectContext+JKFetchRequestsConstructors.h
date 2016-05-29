//
//  GON_NSManagedObjectContext+FetchRequestsConstructors.h
//
//  Created by Nicolas Goutaland on 04/04/15.
//  Copyright 2015 Nicolas Goutaland. All rights reserved.
//
#import <CoreData/CoreData.h>

@interface NSManagedObjectContext(JKFetchRequestsConstructors)
/* Create fetch request to fetch one object using given key and value. Usefull to fetch objects on their uid key  */
- (NSFetchRequest*)jk_fetchRequestForEntityObject:(NSString*)entityName usingValue:(id)value forKey:(NSString*)key returningAsFault:(BOOL)fault;

/* Create fetch request to fetch one object using given predicate 
 */
- (NSFetchRequest*)jk_fetchRequestForEntityObject:(NSString*)entityName usingPredicate:(NSPredicate*)predicate returningAsFault:(BOOL)fault;

/* Create fetch request to fetch all objects for given entity.
 */
- (NSFetchRequest*)jk_fetchRequestForEntityObjects:(NSString*)entityName returningAsFault:(BOOL)fault;

/* Create fetch request to fetch all objects using given predicate
 */
- (NSFetchRequest*)jk_fetchRequestForEntityObjects:(NSString*)entityName usingPredicate:(NSPredicate*)predicate returningAsFault:(BOOL)fault;

/* Create fetch request to fetch all objects for given entity and sort them.
 */
- (NSFetchRequest*)jk_fetchRequestForEntityObjects:(NSString*)entityName usingSortDescriptors:(NSArray*)sortDescriptors returningAsFault:(BOOL)fault;

/* Create fetch request to fetch all objects for given entity, using predicate and sort them.
 */
- (NSFetchRequest*)jk_fetchRequestForEntityObjects:(NSString*)entityName usingPredicate:(NSPredicate*)predicate usingSortDescriptors:(NSArray*)sortDescriptors returningAsFault:(BOOL)fault;

@end
