//
//  CAShapeLayer+UIBezierPath.m
//  Shapes
//
//  Created by Denys Telezhkin on 19.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "CAShapeLayer+JKUIBezierPath.h"

@implementation CAShapeLayer (JKUIBezierPath)

-(void)jk_updateWithBezierPath:(UIBezierPath *)path
{
    self.path = [path CGPath];
    self.lineWidth = path.lineWidth;
    self.miterLimit = path.miterLimit;
    
    self.lineCap = [[self class] lineCapFromCGLineCap:path.lineCapStyle];
    self.lineJoin = [[self class] lineJoinFromCGLineJoin:path.lineJoinStyle];
    
    self.fillRule = path.usesEvenOddFillRule ? kCAFillRuleEvenOdd : kCAFillRuleNonZero;
    
    NSInteger count;
    [path getLineDash:NULL count:&count phase:NULL];
    CGFloat pattern[count], phase;
    [path getLineDash:pattern count:NULL phase:&phase];
    
    NSMutableArray *lineDashPattern = [NSMutableArray array];
    for (NSUInteger i = 0; i < count; i++) {
        [lineDashPattern addObject:@(pattern[i])];
    }
    
    self.lineDashPattern = [lineDashPattern copy];
    self.lineDashPhase = phase;
}

-(UIBezierPath *)jk_bezierPath
{
    UIBezierPath * path = [UIBezierPath bezierPathWithCGPath:self.path];
    path.lineWidth = self.lineWidth;
    path.miterLimit = self.miterLimit;

    path.lineCapStyle = [[self class] lineCapFromCALineCap:self.lineCap];
    path.lineJoinStyle = [[self class] lineJoinFromCALineJoin:self.lineJoin];
    
    path.usesEvenOddFillRule = (self.fillRule == kCAFillRuleEvenOdd);
    
    CGFloat phase = self.lineDashPhase;
    NSInteger count = self.lineDashPattern.count;
    CGFloat pattern[count];
    for (NSUInteger i = 0; i < count; i++) {
        pattern[i] = [[self.lineDashPattern objectAtIndex:i] floatValue];
    }
    [path setLineDash:pattern count:count phase:phase];
    
    return path;
}

+(NSDictionary *)CGtoCALineCaps {
    return @{
             @(kCGLineCapSquare) :kCALineCapSquare,
             @(kCGLineCapButt) : kCALineCapButt,
             @(kCGLineCapRound) : kCALineCapRound
             };
}

+(NSDictionary *)CGtoCALineJoins {
    return @{
             @(kCGLineJoinRound) : kCALineJoinRound,
             @(kCGLineJoinMiter) : kCALineJoinMiter,
             @(kCGLineJoinBevel) : kCALineJoinBevel
             };
}

+(NSDictionary *)CAtoCGLineCaps {
    return @{
             kCALineCapSquare : @(kCGLineCapSquare),
             kCALineCapButt : @(kCGLineCapButt),
             kCALineCapRound : @(kCGLineCapRound)
             };
}

+(NSDictionary *)CAtoCGLineJoins {
    return @{
             kCALineJoinRound : @(kCGLineJoinRound),
             kCALineJoinMiter : @(kCGLineJoinMiter),
             kCALineJoinBevel : @(kCGLineJoinBevel)
             };
}

+(NSString *)lineCapFromCGLineCap:(CGLineCap)lineCap {
    return [self CGtoCALineCaps][@(lineCap)];
}

+(NSString *)lineJoinFromCGLineJoin:(CGLineJoin)lineJoin {
    return [self CGtoCALineJoins][@(lineJoin)];
}

+(CGLineCap)lineCapFromCALineCap:(NSString *)lineCap {
    return [[self CAtoCGLineCaps][lineCap] intValue];
}

+(CGLineJoin)lineJoinFromCALineJoin:(NSString *)lineJoin {
    return [[self CAtoCGLineJoins][lineJoin] intValue];
}

@end
