//
//  NSData+JKAPNSToken.h
//  JKCategories
//
//  Created by Jakey on 15/8/7.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (JKAPNSToken)

/**
 *  将 NSData 类型的 Device Token 转换为字符串类型
 *
 *  集成 APNs 推送服务并注册推送通知时，通过：
 *  application:didRegisterForRemoteNotificationsWithDeviceToken:
 *  方法返回的 deviceToken 默认为 NSData 类型，此方法可以将其转换为 NSString 类型。
 *  参考：<https://stackoverflow.com/questions/9372815/how-can-i-convert-my-device-token-nsdata-into-an-nsstring/16411517#16411517>
 *
 *  @return NSString 格式的 Device Token
 */
- (NSString *)jk_APNSToken;

@end
