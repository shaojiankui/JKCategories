//
//  NSString+XMLDictionary.h
//  Created by Hyde, Andrew on 3/20/13.
//

/**
 Reference: https://github.com/AndrewHydeJr/NSString-XML
 
 A simple converter from a string containing XML to an NSDictionary, backed by NSXMLParser.
 Will return nil if there has been an error.
 
 Example Code:
 
     NSString *XMLString = @"<test>data</test>";
     NSDictionary *XMLAsDictionary = [XMLString XMLDictionary];
 */
#import <Foundation/Foundation.h>

@interface NSString (XML)

/// XML 字符串转换成 NSDictionary
- (NSDictionary *)jk_XMLDictionary;

@end
