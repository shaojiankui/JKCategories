//
//  NSNumber+Round.h
//  IOS-Categories
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Round)
/* 展示 */
- (NSString*)toDisplayNumberWithDigit:(NSInteger)digit;
- (NSString*)toDisplayPercentageWithDigit:(NSInteger)digit;

/*　四舍五入 */
- (NSNumber*)doRoundWithDigit:(NSUInteger)digit;
- (NSNumber*)doCeilWithDigit:(NSUInteger)digit;
- (NSNumber*)doFloorWithDigit:(NSUInteger)digit;
@end
