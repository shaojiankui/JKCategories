//
//  NSURL+Query.m
//  NSURL+Query
//
//  Created by Jon Crooke on 10/12/2013.
//  Copyright (c) 2013 Jonathan Crooke. All rights reserved.
//

#import "NSURL+JKQueryDictionary.h"

static NSString *const jk_URLReservedChars  = @"￼=,!$&'()*+;@?\r\n\"<>#\t :/";
static NSString *const kQuerySeparator      = @"&";
static NSString *const kQueryDivider        = @"=";
static NSString *const kQueryBegin          = @"?";
static NSString *const kFragmentBegin       = @"#";

@implementation NSURL (jk_URLQuery)

- (NSDictionary*) jk_queryDictionary {
  return self.query.jk_URLQueryDictionary;
}

- (NSURL*) jk_URLByAppendingQueryDictionary:(NSDictionary*) queryDictionary {
  return [self jk_URLByAppendingQueryDictionary:queryDictionary withSortedKeys:NO];
}

- (NSURL *)jk_URLByAppendingQueryDictionary:(NSDictionary *)queryDictionary
                          withSortedKeys:(BOOL)sortedKeys
{
  NSMutableArray *queries = [self.query length] > 0 ? @[self.query].mutableCopy : @[].mutableCopy;
  NSString *dictionaryQuery = [queryDictionary jk_URLQueryStringWithSortedKeys:sortedKeys];
  if (dictionaryQuery) {
    [queries addObject:dictionaryQuery];
  }
  NSString *newQuery = [queries componentsJoinedByString:kQuerySeparator];

  if (newQuery.length) {
    NSArray *queryComponents = [self.absoluteString componentsSeparatedByString:kQueryBegin];
    if (queryComponents.count) {
      return [NSURL URLWithString:
              [NSString stringWithFormat:@"%@%@%@%@%@",
               queryComponents[0],                      // existing url
               kQueryBegin,
               newQuery,
               self.fragment.length ? kFragmentBegin : @"",
               self.fragment.length ? self.fragment : @""]];
    }
  }
  return self;
}

- (NSURL*) jk_URLByRemovingQuery {
  NSArray *queryComponents = [self.absoluteString componentsSeparatedByString:kQueryBegin];
  if (queryComponents.count) {
    return [NSURL URLWithString:queryComponents.firstObject];
  }
  return self;
}

- (NSURL *)jk_URLByReplacingQueryWithDictionary:(NSDictionary *)queryDictionary {
  return [self jk_URLByReplacingQueryWithDictionary:queryDictionary withSortedKeys:NO];
}

- (NSURL*) jk_URLByReplacingQueryWithDictionary:(NSDictionary*) queryDictionary
                                 withSortedKeys:(BOOL) sortedKeys
{
  NSURL *stripped = [self jk_URLByRemovingQuery];
  return [stripped jk_URLByAppendingQueryDictionary:queryDictionary withSortedKeys:sortedKeys];
}

@end

#pragma mark -

@implementation NSString (URLQuery)

- (NSDictionary*) jk_URLQueryDictionary {
  NSMutableDictionary *mute = @{}.mutableCopy;
  for (NSString *query in [self componentsSeparatedByString:kQuerySeparator]) {
    NSArray *components = [query componentsSeparatedByString:kQueryDivider];
    if (components.count == 0) {
      continue;
    }
    NSString *key = [components[0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    id value = nil;
    if (components.count == 1) {
      // key with no value
      value = [NSNull null];
    }
    if (components.count == 2) {
      value = [components[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
      // cover case where there is a separator, but no actual value
      value = [value length] ? value : [NSNull null];
    }
    if (components.count > 2) {
      // invalid - ignore this pair. is this best, though?
      continue;
    }
    mute[key] = value ?: [NSNull null];
  }
  return mute.count ? mute.copy : nil;
}

@end

#pragma mark -

@implementation NSDictionary (URLQuery)

static inline NSString *jk_URLEscape(NSString *string);

- (NSString *)jk_URLQueryString {
  return [self jk_URLQueryStringWithSortedKeys:NO];
}

- (NSString*) jk_URLQueryStringWithSortedKeys:(BOOL)sortedKeys {
  NSMutableString *queryString = @"".mutableCopy;
  NSArray *keys = sortedKeys ? [self.allKeys sortedArrayUsingSelector:@selector(compare:)] : self.allKeys;
  for (NSString *key in keys) {
    id rawValue = self[key];
    NSString *value = nil;
    // beware of empty or null
    if (!(rawValue == [NSNull null] || ![rawValue description].length)) {
      value = jk_URLEscape([self[key] description]);
    }
    [queryString appendFormat:@"%@%@%@%@",
     queryString.length ? kQuerySeparator : @"",    // appending?
     jk_URLEscape(key),
     value ? kQueryDivider : @"",
     value ? value : @""];
  }
  return queryString.length ? queryString.copy : nil;
}

static inline NSString *jk_URLEscape(NSString *string) {
    return ((__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(
        NULL,
        (__bridge CFStringRef)string,
        NULL,
        (__bridge CFStringRef)jk_URLReservedChars,
        kCFStringEncodingUTF8));
}

@end
