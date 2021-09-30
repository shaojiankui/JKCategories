//
//  NSObject+KVOBlocks.m
//
//  Copyright (C) 2014 by Christopher Meyer
//  http://schwiiz.org/
//

#import "NSObject+JKKVOBlocks.h"
#import <objc/runtime.h>

@implementation NSObject (JKKVOBlocks)

-(void)jk_addObserver:(NSObject *)observer
        forKeyPath:(NSString *)keyPath
           options:(NSKeyValueObservingOptions)options
           context:(void *)context
         withBlock:(JKKVOBlock)block {
    
    objc_setAssociatedObject(observer, (__bridge const void *)(keyPath), block, OBJC_ASSOCIATION_COPY);
    [self addObserver:observer forKeyPath:keyPath options:options context:context];
}

-(void)jk_removeBlockObserver:(NSObject *)observer
                forKeyPath:(NSString *)keyPath {
    objc_setAssociatedObject(observer, (__bridge const void *)(keyPath), nil, OBJC_ASSOCIATION_COPY);
    [self removeObserver:observer forKeyPath:keyPath];
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context {
    
    JKKVOBlock block = objc_getAssociatedObject(self, (__bridge const void *)(keyPath));
    if (block) {
        block(change, context);
    }
}

-(void)jk_addObserverForKeyPath:(NSString *)keyPath
                     options:(NSKeyValueObservingOptions)options
                     context:(void *)context
                   withBlock:(JKKVOBlock)block {
    
    [self jk_addObserver:self forKeyPath:keyPath options:options context:context withBlock:block];
}

-(void)jk_removeBlockObserverForKeyPath:(NSString *)keyPath {
    [self jk_removeBlockObserver:self forKeyPath:keyPath];
}

@end
