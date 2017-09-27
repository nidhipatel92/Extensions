//
//  UIFont+Extension.m
//  ExtensionObjC
//
//  Created by Nidhi on 8/17/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import "UIFont+Extension.h"

#define APP_FONT_SIZE 15
#define APP_FONT_NAME @"Avenir-Book"

#define NAV_FONT_SIZE 17
#define NAV_FONT_NAME @"Avenir-Heavy"

@implementation UIFont (Extension)

//Set For Whole Application
+(UIFont *)applicationFont
{
    return [UIFont fontWithName:APP_FONT_NAME size:APP_FONT_SIZE];
}

//Set Navigation Font
+(UIFont *)navigationBarFont
{
    return [UIFont fontWithName:NAV_FONT_NAME size:NAV_FONT_SIZE];
}

//Set Custom Font
+(UIFont *)getFontNameAndSize:(NSString *)strFontName FontSize:(int)fontSize
{
    return [UIFont fontWithName:strFontName size:fontSize];
}

//Set Scale according Screen
-(UIFont *)scale:(CGFloat)scaleFactor
{
    CGFloat pointSize = [self pointSize];
    NSString *strFontName = [self fontName];
    UIFontDescriptor *newDescriptor = [UIFontDescriptor fontDescriptorWithName:strFontName size:(pointSize * scaleFactor)];
    return [UIFont fontWithDescriptor:newDescriptor size:0];
}
@end
