
//https://github.com/woxtu/NSString-RemoveEmoji
#import <Foundation/Foundation.h>

@interface NSString (RemoveEmoji)

- (BOOL)isIncludingEmoji;

- (instancetype)removedEmojiString;

@end
