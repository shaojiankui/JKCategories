//
//  NSIndexPath+Offset.h
//
//  Created by Nicolas Goutaland on 04/04/15.
//  Copyright 2015 Nicolas Goutaland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSIndexPath (JKOffset)

/// return previous row indexPath
- (NSIndexPath *)jk_previousRow;

/// return next row indexPath
- (NSIndexPath *)jk_nextRow;

/// return previous item indexPath
- (NSIndexPath *)jk_previousItem;

/// return next item indexPath
- (NSIndexPath *)jk_nextItem;

/// return next section indexPath
- (NSIndexPath *)jk_nextSection;

/// return previous section indexPath
- (NSIndexPath *)jk_previousSection;

@end
