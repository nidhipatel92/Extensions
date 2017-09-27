//
//  NSUserDefaults+Extension.h
//  ExtensionObjC
//
//  Created by Nidhi on 8/23/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Extension)
+(void)setValue:(NSString *)key object:(NSMutableDictionary *)dicObject;
+(void)removeValue:(NSString *)key;
+(NSString *)getValue:(NSString *)key;

@end
