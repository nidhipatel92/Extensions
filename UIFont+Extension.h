//
//  UIFont+Extension.h
//  ExtensionObjC
//
//  Created by Nidhi on 8/17/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIFont (Extension)

+(UIFont *)applicationFont;
+(UIFont *)navigationBarFont;
+(UIFont *)getFontNameAndSize:(NSString *)strFontName FontSize:(int)fontSize;
-(UIFont *)scale:(CGFloat)scaleFactor;
@end
