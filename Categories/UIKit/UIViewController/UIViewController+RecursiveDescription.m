//
//  UIViewController+RecursiveDescription.m
//  HLiPad
//
//  Created by Richard Turton on 07/01/2013.
//
//

#import "UIViewController+RecursiveDescription.h"

@implementation UIViewController (RecursiveDescription)

-(NSString*)recursiveDescription
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"\n"];
    [self addDescriptionToString:description indentLevel:0];
    
//    NSString *info = [NSString stringWithFormat:@"%s [Line %d] \r\r %@ \r\r %@ \r %@",
//                      __PRETTY_FUNCTION__, __LINE__,
//                      [self performSelector:@selector(recursiveDescription)],
//                      [[self constraints] description],
//                      [self performSelector:@selector(_autolayoutTrace)]];
    return description;
}

-(void)addDescriptionToString:(NSMutableString*)string indentLevel:(NSInteger)indentLevel
{
    NSString *padding = [@"" stringByPaddingToLength:indentLevel withString:@" " startingAtIndex:0];
    [string appendString:padding];
    [string appendFormat:@"%@, %@",[self debugDescription],NSStringFromCGRect(self.view.frame)];

    for (UIViewController *childController in self.childViewControllers)
    {
        [string appendFormat:@"\n%@>",padding];
        [childController addDescriptionToString:string indentLevel:indentLevel + 1];
    }
}

@end
