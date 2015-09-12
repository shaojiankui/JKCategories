//
//  NSString+UUID.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UUID)
/**
 *  @brief  获取随机 UUID
 *
 *  @return 随机 UUID
 */
+ (NSString *)UUID;
@end
