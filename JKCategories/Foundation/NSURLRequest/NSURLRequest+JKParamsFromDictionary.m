//
//  NSURLRequest+ParamsFromDictionary.m
//  LCLS
//
//  Created by mgibbs on 4/30/12.

#import "NSURLRequest+JKParamsFromDictionary.h"

@implementation NSURLRequest (JKParamsFromDictionary)

+(NSURLRequest *)jk_requestGETWithURL:(NSURL *)url parameters:(NSDictionary *)params {
    //This code is ARC only.
    return [[NSURLRequest alloc] initWithURL:url parameters:params];
}

-(id)initWithURL:(NSURL *)URL parameters:(NSDictionary *)params {
    if (params) {
        NSArray *queryStringComponents = [[self class] jk_queryStringComponentsFromKey:nil value:params];
        NSString *parameterString = [queryStringComponents componentsJoinedByString:@"&"];
        if ([[URL absoluteString] rangeOfString:@"?"].location == NSNotFound) {
            URL = [NSURL URLWithString:[[URL absoluteString] stringByAppendingFormat:@"?%@",parameterString]];
        } else {
            URL = [NSURL URLWithString:[[URL absoluteString] stringByAppendingFormat:@"&%@",parameterString]];
        }
    }
    self = [self initWithURL:URL];
    if (!self) {
        return nil;
    }
    return self;
}

+(NSString *)jk_URLfromParameters:(NSDictionary *)params{
    if (params) {
        NSArray *queryStringComponents = [[self class] jk_queryStringComponentsFromKey:nil value:params];
        NSString *parameterString = [queryStringComponents componentsJoinedByString:@"&"];
        return parameterString;
    }
    return @"";
}
//These next three methods recursively break the dictionary down into its components.  Largely based on AFHTTPClient, but somewhat more readable and understandable (by me, anyway).
+(NSArray *)jk_queryStringComponentsFromKey:(NSString *)key value:(id)value {
    NSMutableArray *queryStringComponents = [NSMutableArray arrayWithCapacity:2];
    if ([value isKindOfClass:[NSDictionary class]]) {
        [queryStringComponents addObjectsFromArray:[self jk_queryStringComponentsFromKey:key dictionaryValue:value]];
    } else if ([value isKindOfClass:[NSArray class]]) {
        [queryStringComponents addObjectsFromArray:[self jk_queryStringComponentsFromKey:key arrayValue:value]];
    } else {
        NSString *valueString = [value description];
        NSString *unescapedString = [valueString stringByRemovingPercentEncoding];
        if (unescapedString) {
            valueString = unescapedString;
        }
        NSString *escapedValue = [valueString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSString *component = [NSString stringWithFormat:@"%@=%@", key, escapedValue];
        [queryStringComponents addObject:component];
    }
    
    return queryStringComponents;
}

+(NSArray *)jk_queryStringComponentsFromKey:(NSString *)key dictionaryValue:(NSDictionary *)dict{
    NSMutableArray *queryStringComponents = [NSMutableArray arrayWithCapacity:2];
    [dict enumerateKeysAndObjectsUsingBlock:^(id nestedKey, id nestedValue, BOOL *stop) {
        NSArray *components = nil;
        if (key == nil) {
            components = [self jk_queryStringComponentsFromKey:nestedKey value:nestedValue];
        } else {
            components = [self jk_queryStringComponentsFromKey:[NSString stringWithFormat:@"%@[%@]", key, nestedKey] value:nestedValue];
        }
        
        [queryStringComponents addObjectsFromArray:components];
    }];
    
    return queryStringComponents;
}

+(NSArray *)jk_queryStringComponentsFromKey:(NSString *)key arrayValue:(NSArray *)array{
    NSMutableArray *queryStringComponents = [NSMutableArray arrayWithCapacity:2];
    [array enumerateObjectsUsingBlock:^(id nestedValue, NSUInteger index, BOOL *stop) {
        [queryStringComponents addObjectsFromArray:[self jk_queryStringComponentsFromKey:[NSString stringWithFormat:@"%@[]", key] value:nestedValue]];
    }];
    
    return queryStringComponents;
}



@end
