//
//  UIControl+Sound.h
//  UIControlSound
//
//  Created by Fred Showell on 6/01/13.
//  Copyright (c) 2013 Fred Showell. All rights reserved.
// https://github.com/scopegate/octave
//  Octave: A free library of UI sounds, handmade for iOS http://raisedbeaches.com/octave
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface UIControl (JKSound)

/// Set the sound for a particular control event (or events).
/// @param name The name of the file. The method looks for an image with the specified name in the application’s main bundle.
/// @param controlEvent A bitmask specifying the control events for which the action message is sent. See “Control Events” for bitmask constants.
// 不同事件增加不同声音
- (void)jk_setSoundNamed:(NSString *)name forControlEvent:(UIControlEvents)controlEvent;

@end
