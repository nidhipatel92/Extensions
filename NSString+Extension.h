//
//  NSString+Extension.h
//  ExtensionObjC
//
//  Created by Nidhi on 8/18/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
//@property (class) NSString *abc;
//+(void)setSomething:(NSString *)newString;
//+(NSString *)abc;
+(NSString *)cachesDirectory;
+(NSString *)documentDirectory;
-(NSString *)trim;
-(BOOL)isEmailAddress;
-(BOOL)isMobile;
-(BOOL)toBool;
-(BOOL)isNumeric;
-(BOOL)contains:(NSString *)matchedString;
-(NSString *)replace:(NSString*)string withString:(NSString*)withString;
+(NSString *)randomString;
-(NSString *)encodeFromBase64;
-(NSString *)decodeToBase64;
-(NSString *)concat:(NSString *)string;
-(BOOL)isAlphaNumeric;
-(BOOL)isSpecialCharacter;
-(NSArray *)stringToArray:(NSString*)sepratedString;
+(NSString *)deviceType;
-(NSString *)convertToString;

@end
