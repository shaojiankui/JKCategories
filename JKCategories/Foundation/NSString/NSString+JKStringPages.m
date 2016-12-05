//
//  NSString+XHStringPages.m
//  XHStringPages
//
//  Created by 曾 宪华 on 13-12-20.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "NSString+JKStringPages.h"

@implementation NSString (JKStringPages)

- (NSArray *)jk_getPagesOfString:(NSString *)cache
                     withFont:(UIFont*)font
                       inRect:(CGRect)r {
    
    //返回一个数组, 包含每一页的字符串开始点和长度(NSRange)
    NSMutableArray *ranges = [NSMutableArray array];
    //断行类型
    NSLineBreakMode lineBreakMode = NSLineBreakByCharWrapping;
    //显示字体的行高
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    CGFloat lineHeight;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f){
        lineHeight = [@"Sample样本"  sizeWithAttributes:@{NSFontAttributeName:font}].height;
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        lineHeight = [@"Sample样本" sizeWithFont:font].height;
#pragma clang diagnostic pop
    }
#else
    CGFloat lineHeight = [@"Sample样本" sizeWithFont:font].height;
#endif
    
    
    NSInteger maxLine = floor(r.size.height/lineHeight);
    NSInteger totalLines = 0;
    NSLog(@"Max Line Per Page: %zd (%.2f/%.2f)", maxLine, r.size.height, lineHeight);
    NSString *lastParaLeft = nil;
    NSRange range = NSMakeRange(0, 0);
    //把字符串按段落分开, 提高解析效率
    NSArray *paragraphs = [cache componentsSeparatedByString:@"\n"];
    for (int p = 0; p<[paragraphs count]; p++) {
        NSString *para;
        if (lastParaLeft != nil) {
            //上一页完成后剩下的内容继续计算
            para = lastParaLeft;
            lastParaLeft = nil;
        } else {
            para = [paragraphs objectAtIndex:p];
            if (p < [paragraphs count] - 1)
                para = [para stringByAppendingString:@"\n"]; //刚才分段去掉了一个换行,现在还给它
        }
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
        CGSize paraSize;
        if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f){
            paraSize= [para boundingRectWithSize:r.size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:font} context:nil].size;
        }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            paraSize=[para sizeWithFont:font constrainedToSize:r.size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
        }
#else
        CGSize paraSize=[para sizeWithFont:font constrainedToSize:r.size lineBreakMode:lineBreakMode];
#endif
        
        
        NSInteger paraLines = floor(paraSize.height/lineHeight);
        if (totalLines + paraLines < maxLine) {
            totalLines += paraLines;
            range.length += [para length];
            if (p == [paragraphs count] - 1) {
                //到了文章的结尾 这一页也算
                [ranges addObject:[NSValue valueWithRange:range]];
                //IMILog(@"===========Page Over=============");
            }
        } else if (totalLines+paraLines == maxLine) {
            //很幸运, 刚好一段结束,本页也结束, 有这个判断会提高一定的效率
            range.length += [para length];
            [ranges addObject:[NSValue valueWithRange:range]];
            range.location += range.length;
            range.length = 0;
            totalLines = 0;
            //IMILog(@"===========Page Over=============");
        } else {
            //重头戏, 页结束时候本段文字还有剩余
            NSInteger lineLeft = maxLine - totalLines;
            CGSize tmpSize;
            NSInteger i;
            for (i = 1; i< [para length]; i ++) {
                //逐字判断是否达到了本页最大容量
                NSString *tmp = [para substringToIndex:i];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
                if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f){
                    tmpSize= [tmp boundingRectWithSize:r.size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:font} context:nil].size;
                }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
                    tmpSize=[tmp sizeWithFont:font constrainedToSize:r.size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
                }
#else
               tmpSize = [tmp sizeWithFont:font constrainedToSize:r.size lineBreakMode:lineBreakMode];
#endif
                
                
                int nowLine = floor(tmpSize.height / lineHeight);
                if (lineLeft < nowLine) {
                    //超出容量,跳出, 字符要回退一个, 应为当前字符已经超出范围了
                    lastParaLeft = [para substringFromIndex: i - 1];
                    break;
                }
            }
            range.length += i - 1;
            [ranges addObject:[NSValue valueWithRange:range]];
            range.location += range.length;
            range.length = 0;
            totalLines = 0;
            p--;
            //IMILog(@"===========Page Over=============");
        }
    }
    return [NSArray arrayWithArray:ranges];
}

@end
