//
//  NSData+JKPCM.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 16/6/5.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
/*
 
AudioStreamBasicDescription _format;
_format.mFormatID = kAudioFormatLinearPCM;
_format.mFormatFlags = kLinearPCMFormatFlagIsSignedInteger | kLinearPCMFormatFlagIsPacked;
_format.mBitsPerChannel = 16;
_format.mChannelsPerFrame = 1;
_format.mBytesPerPacket = _format.mBytesPerFrame = (_format.mBitsPerChannel / 8) * _format.mChannelsPerFrame;
_format.mFramesPerPacket = 1;
_format.mSampleRate = 8000.0f;
*/

@interface NSData (JKPCM)
//self   raw audio data

/**
 *  format wav data
 *
 *  @param PCMFormat format of pcm
 *
 *  @return wav data
 */
- (NSData *)jk_wavDataWithPCMFormat:(AudioStreamBasicDescription)PCMFormat;
@end
