//
//  NSMutableDictionary+Extension.h
//  ExtensionObjC
//
//  Created by Nidhi on 8/21/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>

@interface NSMutableDictionary (Extension)
+(NSMutableDictionary *)indexingByKey:(NSString *)strKey currentArray:(NSMutableArray *)arrayObject;
+(void)setDefaultPara : (NSMutableDictionary *)dic;
@end
