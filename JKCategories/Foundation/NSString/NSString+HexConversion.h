//
//  NSString+HexConversion.h
//  JKCategories
//
//  Created by Qilin Hu on 2021/3/24.
//  Copyright © 2020 Qilin Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HexConversion)

// 将字符串转换为十六进制数
- (NSInteger)hexValue;

@end

NS_ASSUME_NONNULL_END
