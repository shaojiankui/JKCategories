//
//  GON_NSManagedObjectContext+FetchRequestsConstructors.m
//
//  Created by Nicolas Goutaland on 04/04/15.
//  Copyright 2015 Nicolas Goutaland. All rights reserved.
//

#import "NSManagedObjectContext+JKFetchRequestsConstructors.h"

@interface NSManagedObjectContext ()
@end

@implementation NSManagedObjectContext(JKFetchRequestsConstructors)
#pragma mark - Constructors
- (NSFetchRequest*)jk_fetchRequestForEntityObject:(NSString*)entityName usingValue:(id)value forKey:(NSString*)key returningAsFault:(BOOL)fault
{
    // Create request
    NSFetchRequest *req        = [[NSFetchRequest alloc] init];

    req.entity                 = [NSEntityDescription entityForName:entityName inManagedObjectContext:self];
    req.predicate              = [NSPredicate predicateWithFormat:@"%K == %@", key, value];
    req.fetchLimit             = 1;
    req.returnsObjectsAsFaults = fault;
    
	return req;
}

- (NSFetchRequest*)jk_fetchRequestForEntityObject:(NSString*)entityName usingPredicate:(NSPredicate*)predicate returningAsFault:(BOOL)fault
{
	// Create request
    NSFetchRequest *req        = [[NSFetchRequest alloc] init];

    req.entity                 = [NSEntityDescription entityForName:entityName inManagedObjectContext:self];
    req.predicate              = predicate;
    req.fetchLimit             = 1;
    req.returnsObjectsAsFaults = fault;
    
	return req;
}

- (NSFetchRequest*)jk_fetchRequestForEntityObjects:(NSString*)entityName returningAsFault:(BOOL)fault
{
    return [self jk_fetchRequestForEntityObjects:entityName
                               usingPredicate:nil
                         usingSortDescriptors:nil
                             returningAsFault:fault];

}

- (NSFetchRequest*)jk_fetchRequestForEntityObjects:(NSString*)entityName usingPredicate:(NSPredicate*)predicate returningAsFault:(BOOL)fault
{
    return [self jk_fetchRequestForEntityObjects:entityName
                               usingPredicate:predicate
                         usingSortDescriptors:nil
                             returningAsFault:fault];
}

- (NSFetchRequest*)jk_fetchRequestForEntityObjects:(NSString*)entityName usingSortDescriptors:(NSArray*)sortDescriptors returningAsFault:(BOOL)fault
{
    return [self jk_fetchRequestForEntityObjects:entityName
                               usingPredicate:nil
                         usingSortDescriptors:sortDescriptors
                             returningAsFault:fault];
}

- (NSFetchRequest*)jk_fetchRequestForEntityObjects:(NSString*)entityName usingPredicate:(NSPredicate*)predicate usingSortDescriptors:(NSArray*)sortDescriptors returningAsFault:(BOOL)fault
{
    // Create request
    NSFetchRequest *req        = [[NSFetchRequest alloc] init];

    req.entity                 = [NSEntityDescription entityForName:entityName inManagedObjectContext:self];
    req.sortDescriptors        = sortDescriptors;
    req.predicate              = predicate;
    req.returnsObjectsAsFaults = fault;

	return req;
}
@end