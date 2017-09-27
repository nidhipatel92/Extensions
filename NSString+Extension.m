//
//  NSString+Extension.m
//  ExtensionObjC
//
//  Created by Nidhi on 8/18/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


//static NSString * _abc;
//+(NSString *)abc
//{
//    return _abc;
//}
//
//+(void)setSomething:(NSString *)newString
//{
////    _abc = newString;
//    _abc = [_abc stringByAppendingString:newString];
//}

//Get localpath from caches
+(NSString *)cachesDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory = [paths objectAtIndex:0];
    return cachesDirectory;
}
//Get localpath from document
+(NSString *)documentDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

//Remove whitespace
-(NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

//Email Validation
-(BOOL)isEmailAddress
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

//Mobile Validation
-(BOOL)isMobile
{
    NSString *mobileNumberPattern = @"[0-9]";
    NSPredicate *mobileNumberPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileNumberPattern];
    return [mobileNumberPred evaluateWithObject:self];
}

//Convert String to bool
-(BOOL)toBool
{
    NSString *strNew = [self lowercaseString];
    if ([strNew isEqualToString:@"true"] || [strNew isEqualToString:@"1"] || [strNew isEqualToString:@"yes"] )
        return true;
    else if ([strNew isEqualToString:@"false"] || [strNew isEqualToString:@"0"] || [strNew isEqualToString:@"no"])
        return false;
    else
        return nil;
}

//Check for number value available in string
-(BOOL)isNumeric
{
    NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:self];
    
    return [numbersOnly isSupersetOfSet:characterSetFromTextField];
}

//Check text contains or not - remove caseSensivity
-(BOOL)contains:(NSString *)matchedString
{
    NSRange rangeValue = [self rangeOfString:matchedString options:NSCaseInsensitiveSearch];
    
    if (rangeValue.length > 0)
        return YES;     //string contains
    else
        return NO;           //string does not contain

}

//Replace string to string to new string
-(NSString*)replace:(NSString *)string withString:(NSString *)withString
{
    return [self stringByReplacingOccurrencesOfString:string withString:withString];
}

//Genrate Random string
+(NSString *)randomString
{
    int len = 10;
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}
//Concate two string
-(NSString *)concat:(NSString *)string
{
    return [self stringByAppendingString:string];
}

//Contains alphanumeric
-(BOOL)isAlphaNumeric
{
    NSString *alphaNum = @"[a-zA-Z0-9]+";
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", alphaNum];
    
    return [regexTest evaluateWithObject:self];
}

//check special character value or not
-(BOOL)isSpecialCharacter
{
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"];
    NSRange rangeCharacterSet = [self rangeOfCharacterFromSet:[characterSet invertedSet]];
    if (rangeCharacterSet.length > 0)
    {
        return YES;
    }
    return NO;
}

//Encode String
-(NSString *)encodeFromBase64
{
    NSData *plainData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    return base64String;
}

//Decode String
-(NSString *)decodeToBase64
{
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:self options:0];
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    return decodedString;
}

//Seprated string to array
-(NSArray *)stringToArray:(NSString *)sepratedString
{
    return [self componentsSeparatedByString:sepratedString];
}

//Get Device type
+ (NSString *)deviceType
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *result = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSDictionary *matches = @{
                              @"i386" : @"32-bit Simulator",
                              @"x86_64" : @"64-bit Simulator",
                              @"iPod1,1" : @"iPod Touch",
                              @"iPod2,1" : @"iPod Touch Second Generation",
                              @"iPod3,1" : @"iPod Touch Third Generation",
                              @"iPod4,1" : @"iPod Touch Fourth Generation",
                              @"iPod5,1" : @"iPod Touch Fifth Generation",
                              @"iPhone1,1" : @"iPhone",
                              @"iPhone1,2" : @"iPhone 3G",
                              @"iPhone2,1" : @"iPhone 3GS",
                              @"iPad1,1" : @"iPad",
                              @"iPad2,1" : @"iPad 2",
                              @"iPad3,1" : @"3rd Generation iPad",
                              @"iPad3,2" : @"iPad 3(GSM+CDMA)",
                              @"iPad3,3" : @"iPad 3(GSM)",
                              @"iPad3,4" : @"iPad 4(WiFi)",
                              @"iPad3,5" : @"iPad 4(GSM)",
                              @"iPad3,6" : @"iPad 4(GSM+CDMA)",
                              @"iPhone3,1" : @"iPhone 4",
                              @"iPhone4,1" : @"iPhone 4S",
                              @"iPad3,4" : @"4th Generation iPad",
                              @"iPad2,5" : @"iPad Mini",
                              @"iPhone5,1" : @"iPhone 5(GSM)",
                              @"iPhone5,2" : @"iPhone 5(GSM+CDMA)",
                              @"iPhone5,3" : @"iPhone 5C(GSM)",
                              @"iPhone5,4" : @"iPhone 5C(GSM+CDMA)",
                              @"iPhone6,1" : @"iPhone 5S(GSM)",
                              @"iPhone6,2" : @"iPhone 5S(GSM+CDMA)",
                              @"iPhone7,1" : @"iPhone 6 Plus",
                              @"iPhone7,2" : @"iPhone 6",
                              @"iPhone8,1" : @"iPhone 6S",
                              @"iPhone8,2" : @"iPhone 6S Plus"
                              };
    
    if (matches[result])
    {
        return matches[result];
    }
    else
    {
        return result;
    }
}

@end
