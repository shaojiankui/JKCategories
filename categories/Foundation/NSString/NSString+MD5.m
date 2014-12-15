//
//  NSString+MD5.h
//  categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSString+MD5.h"

@implementation NSString (MD5)

- (NSString*)MD5
{
	// Create pointer to the string as UTF8
	const char *ptr = [self UTF8String];
    
	// Create byte array of unsigned chars
	unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
	// Create 16 byte MD5 hash value, store in buffer
	CC_MD5(ptr, strlen(ptr), md5Buffer);
    
	// Convert MD5 value in the buffer to NSString of hex values
	NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
	for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
		[output appendFormat:@"%02x",md5Buffer[i]];
    
	return output;
}

// returns, nsdata for actual md5 bytes not hex string
- (NSData*)MD5CharData
{
	// Create pointer to the string as UTF8
	const char *ptr = [self UTF8String];
    
	// Create byte array of unsigned chars
	unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
	// Create 16 byte MD5 hash value, store in buffer
	CC_MD5(ptr, strlen(ptr), md5Buffer);
    
	NSData	*data = [NSData dataWithBytes:(const void *)md5Buffer length:sizeof(unsigned char)*CC_MD5_DIGEST_LENGTH];
    
	return data;
}


@end
