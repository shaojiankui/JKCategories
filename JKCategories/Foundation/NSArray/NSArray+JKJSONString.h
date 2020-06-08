//
//  NSArray+JKJSONString.h
//  JKCategories
//
//  Created by jueying on 2020/5/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (JKJSONString)

/**
 *  @brief NSArray转换成JSON字符串
 *
 *  @return  JSON字符串
 */
- (NSString *)jk_JSONString;

@end

NS_ASSUME_NONNULL_END
