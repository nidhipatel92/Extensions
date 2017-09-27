//
//  UIColor+Extension.h
//  ExtensionObjC
//
//  Created by Nidhi on 8/18/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
+(UIColor *)mainColor;
+(UIColor *)mainFontColor;
+(UIColor *)placeholderColor;
+(UIColor *)placholderTextColor;
+(UIColor *)borderColor;
+(UIColor *)navigationBarColor;
+(UIColor *)colorWithHex:(UInt32)col;
+(UIColor *)hexToColor:(NSString *)str;
+(UIColor *)RGB:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue Alpha:(CGFloat)alpha;
@end
