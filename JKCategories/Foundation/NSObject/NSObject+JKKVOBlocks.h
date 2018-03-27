//
//  NSObject+KVOBlocks.h
//
//  Copyright (C) 2014 by Christopher Meyer
//  http://schwiiz.org/
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

// This class is based on NSObject+KVOBlocks (MIT licensed) by Stephan Leroux.
// See here: https://github.com/sleroux/KVO-Blocks


/*
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
