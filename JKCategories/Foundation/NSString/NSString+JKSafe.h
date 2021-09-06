//
//  NSString+JKSafe.h
//  JKCategories
//
//  Created by Qilin Hu on 2021/3/24.
//  Copyright © 2021 www.skyfox.org. All rights reserved.
//
//  Reference: https://github.com/Anonymous-Monk/MSCrashProtector

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JKSafe)

- (BOOL)jk_isNotEmpty;

- (BOOL)jk_isNotBlank;

@end

NS_ASSUME_NONNULL_END
