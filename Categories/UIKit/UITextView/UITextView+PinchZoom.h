//
//  UITextView+PinchZoom.h
//
//  Created by Stan Serebryakov <cfr@gmx.us> on 04.12.12.
//
//  Based on Aral Balkan snippet.

// https://github.com/cfr/UITextView-PinchZoom
//  Simple pinch-zoom category for UITextView

#import <UIKit/UIKit.h>

@interface UITextView (PinchZoom)

@property (nonatomic) CGFloat maxFontSize, minFontSize;

@property (nonatomic, getter = isZoomEnabled) BOOL zoomEnabled;

@end
