//
//  UITextField+Extension.h
//  ExtensionObjC
//
//  Created by Nidhi on 8/22/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)
-(void)cornerRadius;
-(void)borderWidth:(int)size;
-(void)borderColor;
-(void)underline:(UIColor *)color;
-(BOOL)isBlank;
//-(CGRect)textRectForBounds:(CGRect)bounds;
//-(CGRect)editingRectForBounds:(CGRect)bounds;
-(void) setPadding:(int) paddingValue isLeft:(BOOL)isLeft;
@end
