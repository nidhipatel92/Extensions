//
//  NSMutableDictionary+Extension.m
//  ExtensionObjC
//
//  Created by Nidhi on 8/21/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//
#define KEY_OS_TYPE                                                    @"os_type"
#define KEY_VERSION                                                    @"version"
#define KEY_DEVICE_TOKEN                                               @"device_token"
#define KEY_S_VERSION                                                  @"system_version"
#define KEY_S_MODEL                                                    @"system_model"

#import "NSMutableDictionary+Extension.h"

@implementation NSMutableDictionary (Extension)

//Set Aplhabets wise dictionary
+(NSMutableDictionary *)indexingByKey:(NSString *)strKey currentArray:(NSMutableArray *)arrayObject
{
    NSMutableDictionary *dicMain  = [NSMutableDictionary new];
    
    for (int i = 0 ; i < arrayObject.count; i++)
    {
        NSString *strFirstChar = [[arrayObject[i][strKey] substringToIndex:1] uppercaseString];
        
        // Here we need to check for key
        NSArray *aryAllKey = [dicMain allKeys];
        if(![aryAllKey containsObject:strFirstChar])
            [dicMain setObject:[NSMutableArray new] forKey:strFirstChar];
        
        // Here we need to get object from key and add new into it
        NSMutableArray *aryCurrentChar = [dicMain objectForKey:strFirstChar];
        if(aryCurrentChar.count == 0)
            aryCurrentChar = [NSMutableArray new];
        [aryCurrentChar addObject:arrayObject[i]];
        
        // Here we need to reset the dic value
        [dicMain setObject:aryCurrentChar forKey:strFirstChar];
        
    }
    return dicMain;
}

+(void)setDefaultPara : (NSMutableDictionary *)dic
{
    dic[KEY_OS_TYPE] = @"1";
    dic[KEY_VERSION] = [NSString stringWithFormat:@"%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
    dic[KEY_S_VERSION] =[NSString stringWithFormat:@"%@",[[UIDevice currentDevice] systemVersion]];
    dic[KEY_S_MODEL] =[NSString deviceType];
}

@end
