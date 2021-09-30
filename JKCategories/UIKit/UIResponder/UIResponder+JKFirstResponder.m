//
//  UIResponder+FirstResponder.m
//
//  Created by Thad McDowell
//  Copyright (c) 2015 Roaming Logic LLC
//

#import "UIResponder+JKFirstResponder.h"

static __weak id jk_currentFirstResponder;

@implementation UIResponder (JKFirstResponder)

+ (id)jk_currentFirstResponder {
    jk_currentFirstResponder = nil;
    
    [[UIApplication sharedApplication] sendAction:@selector(jk_findCurrentFirstResponder:) to:nil from:nil forEvent:nil];
    
    return jk_currentFirstResponder;
}

- (void)jk_findCurrentFirstResponder:(id)sender {
    jk_currentFirstResponder = self;
}

@end
