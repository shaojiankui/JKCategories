//
//  NSDecimalNumber+CalculatingByString.h
//  NSDecimalNumber+StringCalculation
//
//  Created by Adi Li on 11/5/14.
//  Copyright (c) 2014 Adi Li. All rights reserved.
//

/**
 Reference:<https://github.com/adi-li/NSDecimalNumber-StringCalculation>
 */
#import <Foundation/Foundation.h>

@interface NSDecimalNumber (JKCalculatingByString)

/// 使用字符串计算 NSDecimalNumber，以简化大量计算工作。
/// @param equation equation description
/// @param numbers numbers description
+ (NSDecimalNumber *)jk_decimalNumberWithEquation:(NSString *)equation decimalNumbers:(NSDictionary *)numbers;

@end
