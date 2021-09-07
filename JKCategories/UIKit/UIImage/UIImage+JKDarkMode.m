//
//  UIImage+JKDarkMode.m
//  JKCategories
//
//  Created by Qilin Hu on 2021/9/6.
//  Copyright © 2020 Qilin Hu. All rights reserved.
//

#import "UIImage+JKDarkMode.h"
#import <objc/message.h>

@implementation UIImage (JKDarkMode)

+ (void)d_fixResizableImage {
    if (@available(iOS 13.0, *)) {
        Class klass = UIImage.class;
        SEL selector = @selector(resizableImageWithCapInsets:resizingMode:);
        Method method = class_getInstanceMethod(klass, selector);
        if (method == NULL) {
            return;
        }
        
        IMP originalImp = class_getMethodImplementation(klass, selector);
        if (!originalImp) {
            return;
        }
        
        IMP dynamicColorCompatibleImp = imp_implementationWithBlock(^UIImage *(UIImage *_self, UIEdgeInsets insets, UIImageResizingMode resizingMode) {
                UITraitCollection *lightTrait = [self lightTrait];
                UITraitCollection *darkTrait = [self darkTrait];

                UIImage *resizable = ((UIImage * (*)(UIImage *, SEL, UIEdgeInsets, UIImageResizingMode))
                                          originalImp)(_self, selector, insets, resizingMode);
                UIImage *resizableInLight = [_self.imageAsset imageWithTraitCollection:lightTrait];
                UIImage *resizableInDark = [_self.imageAsset imageWithTraitCollection:darkTrait];
            
                if (resizableInLight) {
                    [resizable.imageAsset registerImage:((UIImage * (*)(UIImage *, SEL, UIEdgeInsets, UIImageResizingMode))
                                                             originalImp)(resizableInLight, selector, insets, resizingMode)
                                    withTraitCollection:lightTrait];
                }
                if (resizableInDark) {
                    [resizable.imageAsset registerImage:((UIImage * (*)(UIImage *, SEL, UIEdgeInsets, UIImageResizingMode))
                                                             originalImp)(resizableInDark, selector, insets, resizingMode)
                                    withTraitCollection:darkTrait];
                }
                return resizable;
            });

        class_replaceMethod(klass, selector, dynamicColorCompatibleImp, method_getTypeEncoding(method));
    }
}

+ (UITraitCollection *)lightTrait API_AVAILABLE(ios(13.0)) {
    static UITraitCollection *trait = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        trait = [UITraitCollection traitCollectionWithTraitsFromCollections:@[
            [UITraitCollection traitCollectionWithDisplayScale:UIScreen.mainScreen.scale],
            [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight]
        ]];
    });

    return trait;
}

+ (UITraitCollection *)darkTrait API_AVAILABLE(ios(13.0)) {
    static UITraitCollection *trait = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        trait = [UITraitCollection traitCollectionWithTraitsFromCollections:@[
            [UITraitCollection traitCollectionWithDisplayScale:UIScreen.mainScreen.scale],
            [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark]
        ]];
    });

    return trait;
}

+ (UIImage *)jk_imageWithLightImageNamed:(NSString *)lightImageName
                          darkImageNamed:(NSString *)darkImageNamed
{
    UIImage *lightImage = [UIImage imageNamed:lightImageName];
    if (!lightImage) { return nil; }
    
    if (@available(iOS 13.0, *)) {
        UIImage *darkImage = [UIImage imageNamed:darkImageNamed];
        UITraitCollection *const scaleTraitCollection = [UITraitCollection currentTraitCollection];
        UITraitCollection *const darkUnscaledTraitCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
        UITraitCollection *const darkScaledTraitCollection = [UITraitCollection traitCollectionWithTraitsFromCollections:@[scaleTraitCollection, darkUnscaledTraitCollection]];
        UIImage *image = [lightImage imageWithConfiguration:[lightImage.configuration configurationWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight]]];
        darkImage = [darkImage imageWithConfiguration:[darkImage.configuration configurationWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark]]];
        [image.imageAsset registerImage:darkImage withTraitCollection:darkScaledTraitCollection];
        return image;
    } else {
        return lightImage;
    }
    return nil;
}

@end
