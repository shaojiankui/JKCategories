//
//  GON_NSManagedObjectContext+JKObjectClear.h
//
//  Created by Nicolas Goutaland on 04/04/15.
//  Copyright 2015 Nicolas Goutaland. All rights reserved.
//
#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (JKObjectClear)
/* Delete all given objects*/
- (void)jk_deleteObjects:(id <NSFastEnumeration>)objects;
@end
