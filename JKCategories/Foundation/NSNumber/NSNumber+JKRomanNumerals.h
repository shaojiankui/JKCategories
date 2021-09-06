//
//  NSNumber+RomanNumerals.h
//  SalesBagStandalone
//
//  Created by Patrick Zearfoss on 10/19/11.
//

/**
 Reference:<https://github.com/pzearfoss/NSNumber-RomanNumerals>
 */
#import <Foundation/Foundation.h>

@interface NSNumber (JKRomanNumerals)

/// 以罗马数字形式返回值的 NSNumber
- (NSString *)jk_romanNumeral;

@end
