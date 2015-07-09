//
//  NSFileHandle+readLine.h
//
//  Created by Ethan Horger on 11/27/12.
//  Copyright (c) 2012 Ethan Horger. All rights reserved.
//
// A Cocoa / Objective-C NSFileHandle category that adds the ability to read a file line by line.
//https://github.com/arbalest/NSFileHandle-readLine
#import <Foundation/Foundation.h>

@interface NSFileHandle (readLine)

- (NSData *)readLineWithDelimiter:(NSString *)theDelimier;

@end
