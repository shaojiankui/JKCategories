//
//  UIDevice+Hardware.h
//  TestTable
//
//  Created by Inder Kumar Rathore on 19/01/13.
//  Copyright (c) 2013 Rathore. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIDevice (JKHardware)
+ (NSString *)jk_platform;
+ (NSString *)jk_platformString;


+ (NSString *)jk_macAddress;

//Return the current device CPU frequency
+ (NSUInteger)jk_cpuFrequency;
// Return the current device BUS frequency
+ (NSUInteger)jk_busFrequency;
//current device RAM size
+ (NSUInteger)jk_ramSize;
//Return the current device CPU number
+ (NSUInteger)jk_cpuNumber;
//Return the current device total memory

/// 获取iOS系统的版本号
+ (NSString *)jk_systemVersion;
/// 判断当前系统是否有摄像头
+ (BOOL)jk_hasCamera;
/// 获取手机内存总量, 返回的是字节数
+ (NSUInteger)jk_totalMemoryBytes;
/// 获取手机可用内存, 返回的是字节数
+ (NSUInteger)jk_freeMemoryBytes;

/// 获取手机硬盘空闲空间, 返回的是字节数
+ (long long)jk_freeDiskSpaceBytes;
/// 获取手机硬盘总空间, 返回的是字节数
+ (long long)jk_totalDiskSpaceBytes;
@end
