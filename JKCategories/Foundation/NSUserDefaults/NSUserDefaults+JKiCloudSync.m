//
//  NSUserDefaults+iCloudSync.h
//
//  Created by Riccardo Paolillo on 09/05/13.
//  Copyright (c) 2013. All rights reserved.
//


#import "NSUserDefaults+JKiCloudSync.h"


@implementation NSUserDefaults (JKiCloudSync)


-(void)jk_setValue:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync)
        [[NSUbiquitousKeyValueStore defaultStore] setValue:value forKey:key];
    
    [self setValue:value forKey:key];
}

-(id)jk_valueForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync)
    {
        //Get value from iCloud
        id value = [[NSUbiquitousKeyValueStore defaultStore] valueForKey:key];
        
        //Store locally and synchronize
        [self setValue:value forKey:key];
        [self synchronize];
        
        return value;
    }
    
    return [self valueForKey:key];
}

- (void)jk_removeValueForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    [self jk_removeObjectForKey:key iCloudSync:sync];
}



-(void)jk_setObject:(id)value forKey:(NSString *)defaultName iCloudSync:(BOOL)sync
{
    if (sync)
        [[NSUbiquitousKeyValueStore defaultStore] setObject:value forKey:defaultName];
    
    [self setObject:value forKey:defaultName];
}

-(id)jk_objectForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync)
    {
        //Get value from iCloud
        id value = [[NSUbiquitousKeyValueStore defaultStore] objectForKey:key];
        
        //Store to NSUserDefault and synchronize
        [self setObject:value forKey:key];
        [self synchronize];
        
        return value;
    }
    
    return [self objectForKey:key];
}

- (void)jk_removeObjectForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync)
        [[NSUbiquitousKeyValueStore defaultStore] removeObjectForKey:key];
    
    //Remove from NSUserDefault
    return [self removeObjectForKey:key];
}



- (BOOL)jk_synchronizeAlsoiCloudSync:(BOOL)sync
{
    BOOL res = true;
    
    if (sync)
        res &= [self synchronize];
    
    res &= [[NSUbiquitousKeyValueStore defaultStore] synchronize];
    
    return res;
}

@end
