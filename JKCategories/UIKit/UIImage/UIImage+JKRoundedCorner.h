// UIImage+RoundedCorner.h
// Created by Trevor Harmon on 9/20/09.
//

/// Extends the UIImage class to support making rounded corners
#import <UIKit/UIKit.h>
@interface UIImage (JKRoundedCorner)

- (UIImage *)jk_roundedCornerImage:(NSInteger)cornerSize
                        borderSize:(NSInteger)borderSize;

@end
