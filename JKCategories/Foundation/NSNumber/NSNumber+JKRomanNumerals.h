//
//  NSNumber+RomanNumerals.h
//  SalesBagStandalone
//
//  Created by Patrick Zearfoss on 10/19/11.
//

//https://github.com/pzearfoss/NSNumber-RomanNumerals
#import <Foundation/Foundation.h>

@interface NSNumber (JKRomanNumerals)
/**
 *  @author JKCategories
 *
 *   A category on NSNumber that returns the value as a roman numeral 
 *
 *  @return 罗马数字格式的字符串
 */
- (NSString *)jk_romanNumeral;

@end
