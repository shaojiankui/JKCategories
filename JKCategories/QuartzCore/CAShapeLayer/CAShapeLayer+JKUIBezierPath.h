//
//  CAShapeLayer+JKUIBezierPath.h
//  Shapes
//
//  Created by Denys Telezhkin on 19.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// CAShapeLayer 的扩展，允许在 CAShapeLayer 上获取和设置 UIBezierPath
@interface CAShapeLayer (JKUIBezierPath)

/// 使用 UIBezierPath 更新 CAShapeLayer
/// @param path 贝塞尔曲线
- (void)jk_updateWithBezierPath:(UIBezierPath *)path;

/// 获取 UIBezierPath 对象，该对象由 CAShapeLayer 构建。
- (UIBezierPath*)jk_bezierPath;

@end

NS_ASSUME_NONNULL_END
