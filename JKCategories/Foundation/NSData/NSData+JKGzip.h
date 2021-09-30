//
//  GZIP.h
//
//  Version 1.1.1
//
//  Created by Nick Lockwood on 03/06/2012.
//  Copyright (C) 2012 Charcoal Design
//
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//

/**
 Reference:<https://github.com/nicklockwood/GZIP>
 */
#import <Foundation/Foundation.h>

@interface NSData (JKGzip)

/**
 *  @brief  GZIP压缩
 *
 *  @param level 压缩级别
 *
 *  @return 压缩后的数据
 */
- (NSData *)jk_gzippedDataWithCompressionLevel:(float)level;

/**
 *  @brief  GZIP压缩 压缩级别 默认-1
 *
 *  @return 压缩后的数据
 */
- (NSData *)jk_gzippedData;

/**
 *  @brief  GZIP解压
 *
 *  @return 解压后数据
 */
- (NSData *)jk_gunzippedData;

- (BOOL)jk_isGzippedData;

@end
