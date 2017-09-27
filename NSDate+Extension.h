//
//  NSDate+Extension.h
//  ExtensionObjC
//
//  Created by Nidhi on 8/22/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDate (Extension)
+(NSDate *)convertStringToDate:(NSString *)strDate dateFormate:(NSString *)strFormate;
+(NSString *)convertDateToString:(NSDate *)date dateFormate:(NSString *)strFormate;
+(NSString *)convertUTCToLocal:(NSString *)strDate utcFormate:(NSString *)strUTCFormate localFormate:(NSString *)strLocalFormate;
+(NSString *)compare:(NSDate *)date compareDate:(NSDate *)compareDate;
+(NSString *)getTimeDifference:(NSString *)strFrom toTime:(NSString *)strTo;
+(NSString *)convertLocalToUTC:(NSString *)strDate localFormate:(NSString *)strLocalFormate utcFormate:(NSString *)strUTCFormate;
@end
