//
//  UIColor+JKDarkMode.m
//  JKCategories
//
//  Created by Qilin Hu on 2021/9/6.
//  Copyright © 2021 www.skyfox.org. All rights reserved.
//

#import "UIColor+JKDarkMode.h"

@implementation UIColor (JKDarkMode)

+ (UIColor *)jk_colorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor {
    if (@available(iOS 13.0, *)) {
        return [self colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            switch (traitCollection.userInterfaceStyle) {
                case UIUserInterfaceStyleDark:
                    return darkColor;
                case UIUserInterfaceStyleLight:
                case UIUserInterfaceStyleUnspecified:
                    return lightColor;
            }
        }];
    } else {
        return lightColor;
    }
}

+ (UIColor *)jk_systemRedColor {
    if (@available(iOS 13.0, *)) {
        return [self systemRedColor];
    } else {
        return [UIColor redColor];
    }
}

+ (UIColor *)jk_systemGreenColor {
    if (@available(iOS 13.0, *)) {
        return [self systemGreenColor];
    } else {
        return [UIColor greenColor];
    }
}

+ (UIColor *)jk_systemBlueColor {
    if (@available(iOS 13.0, *)) {
        return [self systemBlueColor];
    } else {
        return [UIColor blueColor];
    }
}

+ (UIColor *)jk_systemOrangeColor {
    if (@available(iOS 13.0, *)) {
        return [self systemOrangeColor];
    } else {
        return [UIColor orangeColor];
    }
}

+ (UIColor *)jk_systemYelloColor {
    if (@available(iOS 13.0, *)) {
        return [self systemYellowColor];
    } else {
        return [UIColor yellowColor];
    }
}

+ (UIColor *)jk_systemPurpleColor {
    if (@available(iOS 13.0, *)) {
        return [self systemPurpleColor];
    } else {
        return [UIColor purpleColor];
    }
}

+ (UIColor *)jk_systemGrayColor {
    if (@available(iOS 13.0, *)) {
        return [self systemGrayColor];
    } else {
        return [UIColor grayColor];
    }
}

+ (UIColor *)jk_systemBackgroundColor {
    if (@available(iOS 13.0, *)) {
        return [self systemBackgroundColor];
    } else {
        return [UIColor whiteColor];
    }
}

@end
