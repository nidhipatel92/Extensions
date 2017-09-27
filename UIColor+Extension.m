//
//  UIColor+Extension.m
//  ExtensionObjC
//
//  Created by Nidhi on 8/18/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import "UIColor+Extension.h"

#define MAIN_COLOR [UIColor colorWithRed:1.0f/255.0f green:182.0f/255.0f blue:159.0f/255.0f alpha:1.0]
#define MAIN_FONT_COLOR [UIColor colorWithRed:1.0f/255.0f green:182.0f/255.0f blue:159.0f/255.0f alpha:1.0]
#define PLACEHOLDE_COLOR [UIColor colorWithRed:1.0f/255.0f green:182.0f/255.0f blue:159.0f/255.0f alpha:1.0]
#define NAVIGATIONBAR_COLOR [UIColor colorWithRed:1.0f/255.0f green:182.0f/255.0f blue:159.0f/255.0f alpha:1.0]
#define PLACEHOLDE_TEXT_COLOR [UIColor colorWithRed:1.0f/255.0f green:182.0f/255.0f blue:159.0f/255.0f alpha:1.0]
#define BORDER_COLOR [UIColor colorWithRed:1.0f/255.0f green:182.0f/255.0f blue:159.0f/255.0f alpha:1.0]

@implementation UIColor (Extension)

//Set Whole App
+(UIColor *)mainColor
{
    return MAIN_COLOR;
}

//Set MainFont Color
+(UIColor *)mainFontColor
{
    return MAIN_FONT_COLOR;
}

//Set Placeholder Color
+(UIColor *)placeholderColor
{
    return PLACEHOLDE_COLOR;
}

//Set NavigationBar Color
+(UIColor *)navigationBarColor
{
    return NAVIGATIONBAR_COLOR;
}

+(UIColor *)placholderTextColor
{
    return PLACEHOLDE_TEXT_COLOR;
}

+(UIColor *)borderColor
{
    return BORDER_COLOR;
}

//Takes @"#123456"
+ (UIColor *)hexToColor:(NSString *)str
{
    const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
    long x = strtol(cStr+1, NULL, 16);
    return [UIColor colorWithHex:(UInt32)x];
}

//Takes 0x123456
+ (UIColor *)colorWithHex:(UInt32)col
{
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}

//Get color from RGB
+(UIColor *)RGB:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue Alpha:(CGFloat)alpha
{
    double newRed = red/255.0;
    double newGreen = green/255.0;
    double newBlue = blue/255.0;
    
    return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:alpha];
}
@end
