//
// UINavigationItem+Loading.m
//

#import "UINavigationItem+JKLoading.h"
#import <objc/runtime.h>

static void *JKLoaderPositionAssociationKey = &JKLoaderPositionAssociationKey;
static void *JKSubstitutedViewAssociationKey = &JKSubstitutedViewAssociationKey;

@implementation UINavigationItem (JKLoading)

- (void)jk_startAnimatingAt:(JKNavBarLoaderPosition)position {
    // stop previous if animated
    [self jk_stopAnimating];
    
    // hold reference for position to stop at the right place
    objc_setAssociatedObject(self, JKLoaderPositionAssociationKey, @(position), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UIActivityIndicatorView* loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    // substitute bar views to loader and hold reference to them for restoration
    switch (position) {
        case JKNavBarLoaderPositionLeft:
            objc_setAssociatedObject(self, JKSubstitutedViewAssociationKey, self.leftBarButtonItem.customView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.leftBarButtonItem.customView = loader;
            break;
            
        case JKNavBarLoaderPositionCenter:
            objc_setAssociatedObject(self, JKSubstitutedViewAssociationKey, self.titleView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.titleView = loader;
            break;
            
        case JKNavBarLoaderPositionRight:
            objc_setAssociatedObject(self, JKSubstitutedViewAssociationKey, self.rightBarButtonItem.customView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.rightBarButtonItem.customView = loader;
            break;
    }
    
    [loader startAnimating];
}

- (void)jk_stopAnimating {
    NSNumber* positionToRestore = objc_getAssociatedObject(self, JKLoaderPositionAssociationKey);
    id componentToRestore = objc_getAssociatedObject(self, JKSubstitutedViewAssociationKey);
    
    // restore UI if animation was in a progress
    if (positionToRestore) {
        switch (positionToRestore.intValue) {
            case JKNavBarLoaderPositionLeft:
                self.leftBarButtonItem.customView = componentToRestore;
                break;
                
            case JKNavBarLoaderPositionCenter:
                self.titleView = componentToRestore;
                break;
                
            case JKNavBarLoaderPositionRight:
                self.rightBarButtonItem.customView = componentToRestore;
                break;
        }
    }
    
    objc_setAssociatedObject(self, JKLoaderPositionAssociationKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, JKSubstitutedViewAssociationKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
