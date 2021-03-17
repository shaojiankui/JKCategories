//
//  CATransaction+JKAnimateWithDuration.h
//  ShapesExample
//
//  Created by Denys Telezhkin on 20.09.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#if __has_feature(nullability) // Xcode 6.3+
#pragma clang assume_nonnull begin
#else
#define nullable
#define __nullable
#endif

@interface CATransaction (JKAnimateWithDuration)

/// CATransaction 动画执行 block 回调
/// @param duration 动画执行时间
/// @param animations 动画执行的 Block 块
/// @param completion 动画结束的回调
+(void)jk_animateWithDuration:(NSTimeInterval)duration
                   animations:(nullable void (^)(void))animations
                   completion:(nullable void (^)(void))completion;

@end

#if __has_feature(nullability)
#pragma clang assume_nonnull end
#endif
