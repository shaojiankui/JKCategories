// A category on UIBezierPath that calculates the length and a point at a given length of the path. 
//https://github.com/ImJCabus/UIBezierPath-Length
@import UIKit;

@interface UIBezierPath (JKLength)

- (CGFloat)jk_length;

- (CGPoint)jk_pointAtPercentOfLength:(CGFloat)percent;

@end
