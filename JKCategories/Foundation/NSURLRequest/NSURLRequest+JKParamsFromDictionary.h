//
//  NSURLRequest+ParamsFromDictionary.h
//  This category for NSURLRequest lets you form a GET request with parameters from an NSDictionary.
//
//  Created by mgibbs on 4/30/12.

#import <Foundation/Foundation.h>

@interface NSURLRequest (JKParamsFromDictionary)

- (id)initWithURL:(NSURL *)URL parameters:(NSDictionary *)params;

+(NSURLRequest *)jk_requestGETWithURL:(NSURL *)url parameters:(NSDictionary *)params;

+(NSString *)jk_URLfromParameters:(NSDictionary *)params;

+(NSArray *)jk_queryStringComponentsFromKey:(NSString *)key value:(id)value;
+(NSArray *)jk_queryStringComponentsFromKey:(NSString *)key dictionaryValue:(NSDictionary *)dict;
+(NSArray *)jk_queryStringComponentsFromKey:(NSString *)key arrayValue:(NSArray *)array;

@end
