//
//  NSDate+Extension.m
//  ExtensionObjC
//
//  Created by Nidhi on 8/22/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#define YYYY_MM_DD_HH_MM_SS                                                    @"yyyy-MM-dd HH:mm:ss"
#define MM_DD_YYYY_HH_MM_A                                                     @"MM/dd/yyyy hh:mm a"


#import "NSDate+Extension.h"

@implementation NSDate (Extension)

//@dynamic dateFormatter;

//Convert String to date
+(NSDate *)convertStringToDate:(NSString *)strDate dateFormate:(NSString *)strFormate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:strFormate];
    NSDate *date = [dateFormatter dateFromString:strDate];
    dateFormatter = nil;
    return date;
}

//Convert Date to String
+(NSString *)convertDateToString:(NSDate *)date dateFormate:(NSString *)strFormate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:strFormate];
    NSString *strDate = [dateFormatter stringFromDate:date];
    dateFormatter = nil;
    return strDate;
}

//Convert UTC to local
+(NSString *)convertUTCToLocal:(NSString *)strDate utcFormate:(NSString *)strUTCFormate localFormate:(NSString *)strLocalFormate
{
    NSString *strUTC;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:strUTCFormate];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDate *dateUTC = [dateFormatter dateFromString:strDate];
    if (dateUTC != nil)
    {
        // change to a readable time format and change to local time zone
        [dateFormatter setDateFormat:strLocalFormate];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        strUTC = [dateFormatter stringFromDate:dateUTC];
    }
    dateFormatter = nil;
    return strUTC;
}

//Comparison two date
+(NSString *)compare:(NSDate *)date compareDate:(NSDate *)compareDate
{
    NSString *strDateMessage;
    NSComparisonResult result = [date compare:compareDate];
    switch (result)
    {
        case NSOrderedAscending:
            strDateMessage = @"Future Date";
            break;
        case NSOrderedDescending:
            strDateMessage = @"Past Date";
            break;
        case NSOrderedSame:
            strDateMessage = @"Same Date";
            break;
        default:
            strDateMessage = @"Error Date";
            break;
    }
    return strDateMessage;
}

//Get Time Difference
+(NSString *)getTimeDifference:(NSString *)strFrom toTime:(NSString *)strTo
{
    NSString *strTimeDifference = @"";
    NSDate *dateFrom = [NSDate convertStringToDate:strFrom dateFormate:YYYY_MM_DD_HH_MM_SS];
    NSDate *dateTo = [NSDate convertStringToDate:strTo dateFormate:YYYY_MM_DD_HH_MM_SS];
    
    NSTimeInterval timeDifference = [dateTo timeIntervalSinceDate:dateFrom]; //Get second
    
    double minutes = timeDifference / 60;
    double hours = minutes / 60;
    double days = minutes / 1440;
    
    if (dateTo == nil)
    {
        return strTimeDifference;
    }
    
    int intDays = (int)days;
    int intMin = (int)minutes;
    int intHours = (int)hours;
    
    if(intDays <= 0)
    {
        if(intMin <= 0)
        {
            strTimeDifference = [NSString stringWithFormat:@"few seconds"];
        }
        else if(intHours <= 0)
        {
            if(intMin <= 1)
                strTimeDifference = [NSString stringWithFormat:@"%d min",intMin];
            else
                strTimeDifference = [NSString stringWithFormat:@"%d mins",intMin];
        }
        else
        {
            if(intHours == 24)
                strTimeDifference = [NSString stringWithFormat:@"1 day"];
            else if(intHours <= 1)
                strTimeDifference = [NSString stringWithFormat:@"%d hour",intHours];
            else
                strTimeDifference = [NSString stringWithFormat:@"%d hours",intHours];
        }
    }
    else
    {
        strTimeDifference = [NSString stringWithFormat:@"%@",strFrom];
    }

    return strTimeDifference;
}

//Convert Local to UTC
+(NSString *)convertLocalToUTC:(NSString *)strDate localFormate:(NSString *)strLocalFormate utcFormate:(NSString *)strUTCFormate
{
    NSString *strUTC;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:strLocalFormate];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSDate *dateLocal = [dateFormatter dateFromString:strDate];
    if (dateLocal != nil)
    {
        [dateFormatter setDateFormat:strUTCFormate];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        strUTC= [dateFormatter stringFromDate:dateLocal];
    }
    dateFormatter = nil;
    return strUTC;
}
@end
