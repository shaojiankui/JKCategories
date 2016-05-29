//
//  NSString+JKMatcher.h
//  Whyd
//
//  Created by Damien Romito on 29/01/15.
//  Copyright (c) 2015 Damien Romito. All rights reserved.
//
//https://github.com/damienromito/NSString-Matcher
#import <Foundation/Foundation.h>
@interface NSString(JKMatcher)
- (NSArray *)jk_matchWithRegex:(NSString *)regex;
- (NSString *)jk_matchWithRegex:(NSString *)regex atIndex:(NSUInteger)index;
- (NSString *)jk_firstMatchedGroupWithRegex:(NSString *)regex;
- (NSTextCheckingResult *)jk_firstMatchedResultWithRegex:(NSString *)regex;
@end