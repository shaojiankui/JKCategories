//
//  NSData+JKPCM.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 16/6/5.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import "NSData+JKPCM.h"

@implementation NSData (JKPCM)
/**
 *  format wav data
 *
 *  @param PCMFormat format of pcm
 *
 *  @return wav data
 */
- (NSData *)jk_wavDataWithPCMFormat:(AudioStreamBasicDescription)PCMFormat;

{
    // Following https://ccrma.stanford.edu/courses/422/projects/WaveFormat/ formating wav
    
    unsigned int pcmDataLength = (unsigned int)[self length];    //pcm data length
    UInt32 wavHeaderSize = 44;                                      //wav header size = 44
    
    SInt8 *wavHeader = (SInt8 *)malloc(wavHeaderSize);
    if (wavHeader == NULL)
    {
        return nil;
    }
    
    // ChunkID = 'RIFF'
    wavHeader[0x00] = 'R';
    wavHeader[0x01] = 'I';
    wavHeader[0x02] = 'F';
    wavHeader[0x03] = 'F';
    
    // Chunk = 36 + SubChunk2Size
    // or more precisely:4 + (8 + SubChunk1Size) + (8 + SubChunk2Size)
    *((SInt32 *)(wavHeader + 0x04)) = pcmDataLength + 36;
    
    // Format = 'WAVE'
    wavHeader[0x08] = 'W';
    wavHeader[0x09] = 'A';
    wavHeader[0x0A] = 'V';
    wavHeader[0x0B] = 'E';
    
    // Subchunk1ID = 'fmt '
    wavHeader[0x0C] = 'f';
    wavHeader[0x0D] = 'm';
    wavHeader[0x0E] = 't';
    wavHeader[0x0F] = ' ';
    
    // SubchunckSize = 16 for PCM
    wavHeader[0x10] = 16;
    wavHeader[0x11] = 0;
    wavHeader[0x12] = 0;
    wavHeader[0x13] = 0;
    
    // AudioFormat, PCM format = 1
    wavHeader[0x14] = 1;
    wavHeader[0x15] = 0;
    
    // NumChannels
    wavHeader[0x16] = PCMFormat.mChannelsPerFrame;
    wavHeader[0x17] = 0;
    
    // SampleRate
    const int sampleRate = PCMFormat.mSampleRate;
    const char *ptr = (const char*)&sampleRate;
    char sampleRate1 = *ptr++;
    char sampleRate2 = *ptr++;
    char sampleRate3 = *ptr++;
    char sampleRate4 = *ptr++;
    wavHeader[0x18] = sampleRate1;
    wavHeader[0x19] = sampleRate2;
    wavHeader[0x1A] = sampleRate3;
    wavHeader[0x1B] = sampleRate4;
    
    // ByteRate
    const int byteRate = PCMFormat.mSampleRate * PCMFormat.mBitsPerChannel * PCMFormat.mChannelsPerFrame / 8;
    ptr = (const char*)&byteRate;
    char byteRate1 = *ptr++;
    char byteRate2 = *ptr++;
    char byteRate3 = *ptr++;
    char byteRate4 = *ptr++;
    wavHeader[0x1C] = byteRate1;
    wavHeader[0x1D] = byteRate2;
    wavHeader[0x1E] = byteRate3;
    wavHeader[0x1F] = byteRate4;
    
    // BlockAlign (bytesPerSample)
    wavHeader[0x20] = PCMFormat.mBytesPerFrame;
    wavHeader[0x21] = 0;
    
    // BitsPerSample
    wavHeader[0x22] = PCMFormat.mBitsPerChannel;
    // ExtraParamSize if PCM, then doesn't exist
    wavHeader[0x23] = 0;
    
    // Subchunk2ID = 'data'
    wavHeader[0x24] = 'd';
    wavHeader[0x25] = 'a';
    wavHeader[0x26] = 't';
    wavHeader[0x27] = 'a';
    
    // SubChunkSize = NumSamples * NumChannels * BitsPerSample/8. This is the number of bytes in the data.
    *((SInt32 *)(wavHeader + 0x28)) = pcmDataLength;
    
    NSMutableData *wavData = [NSMutableData dataWithBytes:wavHeader length:wavHeaderSize];
    free(wavHeader);
    
    // Append pcm data
    [wavData appendData:self];
    return wavData;
}

@end
