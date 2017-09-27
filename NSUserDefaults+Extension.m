//
//  NSUserDefaults+Extension.m
//  ExtensionObjC
//
//  Created by Nidhi on 8/23/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import "NSUserDefaults+Extension.h"

@implementation NSUserDefaults (Extension)

//set value to NSUserDefaults
+(void)setValue:(NSString *)key object:(NSMutableDictionary *)dicObject
{
    for (id key in dicObject)
    {
        id value = [dicObject objectForKey:key];
        [[NSUserDefaults standardUserDefaults]setObject:value forKey:key];
    }
}

//Remove value to NSUserDefaults
+(void)removeValue:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)getValue:(NSString *)key
{
   return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
@end
