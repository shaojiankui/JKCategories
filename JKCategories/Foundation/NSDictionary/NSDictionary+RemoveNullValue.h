//
//  NSDictionary+RemoveNullValue.h
//  JKCategories
//
//  Created by Qilin Hu on 2021/3/26.
//  Copyright © 2021 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (RemoveNullValue)

/// 移除字典中 value 值为 <null>、@"" 的字段
- (NSDictionary *)jk_removeNullValue;

@end

NS_ASSUME_NONNULL_END
