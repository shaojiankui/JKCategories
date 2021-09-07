// AutoCoding.h
//
// Version 2.2.1
//
// Created by Nick Lockwood on 19/11/2011.
// Copyright (c) 2011 Charcoal Design
//

/**
 Reference: <https://github.com/nicklockwood/AutoCoding>
 */
#import <Foundation/Foundation.h>

@interface NSObject (JKAutoCoding) <NSSecureCoding>

//coding
+ (NSDictionary *)jk_codableProperties;
- (void)jk_setWithCoder:(NSCoder *)aDecoder;
//property access
- (NSDictionary *)jk_codableProperties;
- (NSDictionary *)jk_dictionaryRepresentation;
//loading / saving
+ (instancetype)jk_objectWithContentsOfFile:(NSString *)path;
- (BOOL)jk_writeToFile:(NSString *)filePath atomically:(BOOL)useAuxiliaryFile;

@end
