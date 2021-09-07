//
// UINavigationItem+Loading.h
//

/**
 Reference: <https://github.com/Just-/UINavigationItem-Loading>
 */
#import <UIKit/UIKit.h>

/**
 *  Position to show UIActivityIndicatorView in a navigation bar
 */
typedef NS_ENUM(NSUInteger, JKNavBarLoaderPosition){
    /**
     *  Will show UIActivityIndicatorView in place of title view
     */
    JKNavBarLoaderPositionCenter = 0,
    /**
     *  Will show UIActivityIndicatorView in place of left item
     */
    JKNavBarLoaderPositionLeft,
    /**
     *  Will show UIActivityIndicatorView in place of right item
     */
    JKNavBarLoaderPositionRight
};

@interface UINavigationItem (JKLoading)

/**
 *  Add UIActivityIndicatorView to view hierarchy and start animating immediately
 *
 *  @param position Left, center or right
 */
- (void)jk_startAnimatingAt:(JKNavBarLoaderPosition)position;

/**
 *  Stop animating, remove UIActivityIndicatorView from view hierarchy and restore item
 */
- (void)jk_stopAnimating;

@end
