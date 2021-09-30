//
//  NSFileHandle+readLine.h
//
//  Created by Ethan Horger on 11/27/12.
//  Copyright (c) 2012 Ethan Horger. All rights reserved.
//

/**
 Reference: <https://github.com/arbalest/NSFileHandle-readLine>
 Cocoa/Objective-C NSFileHandle 扩展，它增加了逐行读取文件的能力。
 */
#import <Foundation/Foundation.h>

@interface NSFileHandle (JKReadLine)

/// @param theDelimier 分隔符
- (NSData *)jk_readLineWithDelimiter:(NSString *)theDelimier;

@end
