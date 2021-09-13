//
//  UIView+JKFind.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIView+JKFind.h"

@implementation UIView (JKFind)

- (UIViewController *)jk_viewController {
    UIView *view = self;
    while (view) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
        view = view.superview;
    }
    return nil;
}

- (UINavigationController *)jk_navigationController {
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)responder;
        }
        
        responder = responder.nextResponder;
    } while (responder);
    
    return nil;
}

- (UITabBarController *)jk_tabBarController {
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UITabBarController class]]) {
            return (UITabBarController *)responder;
        }
        
        responder = responder.nextResponder;
    } while (responder);
    
    return nil;
}

- (id)jk_findSubViewWithSubViewClass:(Class)clazz {
    for (id subView in self.subviews) {
        if ([subView isKindOfClass:clazz]) {
            return subView;
        }
    }
    
    return nil;
}

- (id)jk_findSuperViewWithSuperViewClass:(Class)clazz {
    if (!self) {
        return nil;
    } else if (!self.superview) {
        return nil;
    } else if ([self.superview isKindOfClass:clazz]) {
        return self.superview;
    } else {
        return [self.superview jk_findSuperViewWithSuperViewClass:clazz];
    }
}

- (BOOL)jk_findAndResignFirstResponder {
    if (self.isFirstResponder) {
        [self resignFirstResponder];
        return YES;
    }
    
    for (UIView *v in self.subviews) {
        if ([v jk_findAndResignFirstResponder]) {
            return YES;
        }
    }
    return NO;
}

- (UIView *)jk_findFirstResponder {
    if (([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]])
        && (self.isFirstResponder)) {
        return self;
    }
    
    for (UIView *v in self.subviews) {
        UIView *fv = [v jk_findFirstResponder];
        if (fv) {
            return fv;
        }
    }
    
    return nil;
}

@end
