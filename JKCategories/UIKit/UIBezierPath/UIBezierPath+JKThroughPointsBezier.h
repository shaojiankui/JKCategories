//
//  UIBezierPath+LxThroughPointsBezier.h
//  LxThroughPointsBezierDemo
//

/**
 Reference: <https://github.com/DeveloperLx/LxThroughPointsBezier>
 
 A funny iOS library. Draw a smooth bezier through several points you designated.
 The curve‘s bend level is adjustable.
 */
#import <UIKit/UIKit.h>

@interface UIBezierPath (JKThroughPointsBezier)

/**
 *  The curve‘s bend level. The good value is about 0.6 ~ 0.8. The default and recommended value is 0.7.
 */
@property (nonatomic) CGFloat jk_contractionFactor;

/**
 *  You must wrap CGPoint struct to NSValue object.
 *
 *  @param pointArray Points you want to through. You must give at least 1 point for drawing curve.
 */
- (void)jk_addBezierThroughPoints:(NSArray *)pointArray;

@end
