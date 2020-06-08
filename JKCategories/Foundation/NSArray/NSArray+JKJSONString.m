//
//  NSArray+JKJSONString.m
//  JKCategories
//
//  Created by jueying on 2020/5/27.
//

#import "NSArray+JKJSONString.h"

@implementation NSArray (JKJSONString)

/**
 *  @brief NSArray转换成JSON字符串
 *
 *  @return  JSON字符串
 */
- (NSString *)jk_JSONString {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);
#endif
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
