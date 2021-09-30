//
//  UIBezierPath+JKLength.h
//  JKCategories
//
//  Created by Qilin Hu on 2021/3/24.
//  Copyright © 2020 Qilin Hu. All rights reserved.
//

/**
 Reference: <https://github.com/ImJCabus/UIBezierPath-Length>
 
 A category on UIBezierPath that calculates the length and a point at a given length of the path.
 */
#import <UIKit/UIKit.h>

@interface UIBezierPath (JKLength)

- (CGFloat)jk_length;

- (CGPoint)jk_pointAtPercentOfLength:(CGFloat)percent;

@end
