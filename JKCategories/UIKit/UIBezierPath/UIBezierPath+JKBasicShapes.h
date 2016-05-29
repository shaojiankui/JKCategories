//
//  UIBezierPath+JKBasicShapes.h
//  Example
//
//  Created by Pierre Dulac on 26/02/13.
//  Copyright (c) 2013 Pierre Dulac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (JKBasicShapes)

+ (UIBezierPath *)jk_heartShape:(CGRect)originalFrame;
+ (UIBezierPath *)jk_userShape:(CGRect)originalFrame;
+ (UIBezierPath *)jk_martiniShape:(CGRect)originalFrame;
+ (UIBezierPath *)jk_beakerShape:(CGRect)originalFrame;
+ (UIBezierPath *)jk_starShape:(CGRect)originalFrame;
+ (UIBezierPath *)jk_stars:(NSUInteger)numberOfStars shapeInFrame:(CGRect)originalFrame;

@end
