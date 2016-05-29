
//
//  NSURLRequest+ParamsFromDictionary.h
//  This category for NSURLRequest lets you form a GET request with parameters from an NSDictionary.
//
//  Created by mgibbs on 4/30/12.
/*
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import <Foundation/Foundation.h>

@interface NSURLRequest (JKParamsFromDictionary)
/**
 *  @author JKCategories
 *
 *
 *
 */
- (id)initWithURL:(NSURL *)URL parameters:(NSDictionary *)params;

+(NSURLRequest *)jk_requestGETWithURL:(NSURL *)url parameters:(NSDictionary *)params;

+(NSString *)jk_URLfromParameters:(NSDictionary *)params;

+(NSArray *)jk_queryStringComponentsFromKey:(NSString *)key value:(id)value;
+(NSArray *)jk_queryStringComponentsFromKey:(NSString *)key dictionaryValue:(NSDictionary *)dict;
+(NSArray *)jk_queryStringComponentsFromKey:(NSString *)key arrayValue:(NSArray *)array;
@end