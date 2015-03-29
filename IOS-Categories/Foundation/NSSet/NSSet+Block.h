//
//  NSSet+Block.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (Block)
- (void)each:(void (^)(id))block;
- (NSSet* )select:(BOOL (^)(id))block;
- (NSSet *)map:(id (^)(id))block;
- (id)reduce:(id)initial withBlock:(id (^)(id,id))block;
@end
