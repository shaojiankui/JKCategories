// UIImage+Alpha.h
// Created by Trevor Harmon on 9/20/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Helper methods for adding an alpha layer to an image
#import <UIKit/UIKit.h>

@interface UIImage (Alpha)
- (BOOL)hasAlpha;
- (UIImage *)imageWithAlpha;
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;

//裁切含透明图片为最小大小
//http://stackoverflow.com/questions/6521987/crop-uiimage-to-alpha?answertab=oldest#tab-top
- (UIImage *)trimmedBetterSize;

@end
