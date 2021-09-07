//
//  NSObject+KVOBlocks.h
//
//  Copyright (C) 2014 by Christopher Meyer
//  http://schwiiz.org/
//

/*
 Reference:<https://github.com/sleroux/KVO-Blocks>
 
 Example Code:
 
     UIViewController *observer = self;
     if (self.observersOn) {
         // This is where the magic happens
         [self.user jk_addObserver:observer forKeyPath:@"email" options:0 context:nil withBlock:^(NSDictionary *change, void *context) {
             NSLog(@"Changed email");
         }];
         
         [self.user jk_addObserver:observer forKeyPath:@"username" options:0 context:nil withBlock:^(NSDictionary *change, void *context) {
             NSLog(@"Changed username");
         }];
     } else {
         [self.user jk_removeBlockObserver:observer forKeyPath:@"username"];
         [self.user jk_removeBlockObserver:observer forKeyPath:@"email"];
     }
 */


#import <Foundation/Foundation.h>
typedef void (^JKKVOBlock)(NSDictionary *change, void *context);

@interface NSObject (JKKVOBlocks)
/**
 添加观察者与监听属性
 
 @param observer 观察者,一般为其他对象(谁想监听)
 @param keyPath 监听的属性
 @param options 监听模式
 @param context context
 @param block  监听回调
 */
- (void)jk_addObserver:(NSObject *)observer
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
            context:(void *)context
          withBlock:(JKKVOBlock)block;
/**
 移除观察者对属性的监听

 @param observer 观察者,一般为其他对象(谁想监听)
 @param keyPath 监听的属性
 */
-(void)jk_removeBlockObserver:(NSObject *)observer
                forKeyPath:(NSString *)keyPath;

/**
 对象本身作为观察者

 @param keyPath 监听的属性
 @param options 监听模式
 @param context context
 @param block 监听回调
 */
-(void)jk_addObserverForKeyPath:(NSString *)keyPath
                     options:(NSKeyValueObservingOptions)options
                     context:(void *)context
                   withBlock:(JKKVOBlock)block;

/**
 移除观察者对属性的监听

 @param keyPath 监听的属性
 */
-(void)jk_removeBlockObserverForKeyPath:(NSString *)keyPath;

@end
