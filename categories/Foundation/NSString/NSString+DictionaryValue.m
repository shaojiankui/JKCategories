//
//  NSString+Dictionary.m
//  categories
//
//  Created by Jakey on 14-6-13.
//  Copyright (c) 2014年 jakey. All rights reserved.
//

#import "NSString+DictionaryValue.h"

@implementation NSString (DictionaryValue)

-(NSDictionary *) dictionaryValue{
    NSError *errorJson;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&errorJson];
    if (errorJson != nil) {
#ifdef DEBUG
        NSLog(@"fail to get dictioanry from JSON: %@, error: %@", self, errorJson);
#endif
    }
    return jsonDict;
}

@end
