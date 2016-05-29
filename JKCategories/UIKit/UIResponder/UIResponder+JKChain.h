//
//  UIResponder+JKChain.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (JKChain)
/**
 *  @brief  响应者链
 *
 *  @return  响应者链
 */
- (NSString *)jk_responderChainDescription;
@end
