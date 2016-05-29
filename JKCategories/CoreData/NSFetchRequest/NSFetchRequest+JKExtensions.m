//
//  NSFetchRequest+Extensions.m
//
//  Created by Wess Cope on 9/23/11.
//  Copyright 2012. All rights reserved.
//

#import "NSFetchRequest+JKExtensions.h"

@implementation NSFetchRequest(JKExtensions)
+ (id)jk_fetchRequestWithEntity:(NSEntityDescription *)entity
{
  return [[self alloc] initWithEntity:entity predicate:nil sortDescriptors:nil];
}

+ (id)jk_fetchRequestWithEntity:(NSEntityDescription *)entity predicate:(NSPredicate *)predicate
{
  return [[self alloc] initWithEntity:entity predicate:predicate sortDescriptors:nil];
}

+ (id)jk_fetchRequestWithEntity:(NSEntityDescription *)entity sortDescriptors:(NSArray *)sortDescriptors
{
  return [[self alloc] initWithEntity:entity predicate:nil sortDescriptors:sortDescriptors];
}

+ (id)jk_fetchRequestWithEntity:(NSEntityDescription *)entity predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors
{
  return [[self alloc] initWithEntity:entity predicate:predicate sortDescriptors:sortDescriptors];
}

- (id)initWithEntity:(NSEntityDescription *)entity predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors
{
  self = [self init];
  if(self)
  {
    self.entity = entity;
    self.predicate = predicate;
    self.sortDescriptors = sortDescriptors;
  }
  
  return self;
}

@end