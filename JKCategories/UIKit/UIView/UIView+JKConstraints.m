//
//  UIView+JKConstraints.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIView+JKConstraints.h"

@implementation UIView (JKConstraints)
-(NSLayoutConstraint *)jk_constraintForAttribute:(NSLayoutAttribute)attribute {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstAttribute = %d && (firstItem = %@ || secondItem = %@)", attribute, self, self];
    NSArray *constraintArray = [self.superview constraints];
    
    if (attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight) {
        constraintArray = [self constraints];
    }
    
    NSArray *fillteredArray = [constraintArray filteredArrayUsingPredicate:predicate];
    if(fillteredArray.count == 0) {
        return nil;
    } else {
        return fillteredArray.firstObject;
    }
}

- (NSLayoutConstraint *)jk_leftConstraint {
    return [self jk_constraintForAttribute:NSLayoutAttributeLeft];
}

- (NSLayoutConstraint *)jk_rightConstraint {
    return [self jk_constraintForAttribute:NSLayoutAttributeRight];
}

- (NSLayoutConstraint *)jk_topConstraint {
    return [self jk_constraintForAttribute:NSLayoutAttributeTop];
}

- (NSLayoutConstraint *)jk_bottomConstraint {
    return [self jk_constraintForAttribute:NSLayoutAttributeBottom];
}

- (NSLayoutConstraint *)jk_leadingConstraint {
    return [self jk_constraintForAttribute:NSLayoutAttributeLeading];
}

- (NSLayoutConstraint *)jk_trailingConstraint {
    return [self jk_constraintForAttribute:NSLayoutAttributeTrailing];
}

- (NSLayoutConstraint *)jk_widthConstraint {
    return [self jk_constraintForAttribute:NSLayoutAttributeWidth];
}

- (NSLayoutConstraint *)jk_heightConstraint {
    return [self jk_constraintForAttribute:NSLayoutAttributeHeight];
}

- (NSLayoutConstraint *)jk_centerXConstraint {
    return [self jk_constraintForAttribute:NSLayoutAttributeCenterX];
}

- (NSLayoutConstraint *)jk_centerYConstraint {
    return [self jk_constraintForAttribute:NSLayoutAttributeCenterY];
}

- (NSLayoutConstraint *)jk_baseLineConstraint {
    return [self jk_constraintForAttribute:NSLayoutAttributeBaseline];
}
@end
