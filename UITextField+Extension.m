//
//  UITextField+Extension.m
//  ExtensionObjC
//
//  Created by Nidhi on 8/22/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//
#define BORDER_COLOR [UIColor colorWithRed:1.0f/255.0f green:182.0f/255.0f blue:159.0f/255.0f alpha:1.0]

#import "UITextField+Extension.h"

@implementation UITextField (Extension)

//Set corner Radius
-(void)cornerRadius
{
    self.layer.cornerRadius = self.frame.size.height / 2;
}

//Set Border Width
-(void)borderWidth:(int)size
{
    self.layer.borderWidth = size;
}

//Set Border Color
-(void)borderColor
{
    self.layer.borderColor = BORDER_COLOR.CGColor;
}

//Set underline
-(void)underline:(UIColor *)color
{
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 2;
    border.borderColor = color.CGColor;
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, self.frame.size.height);
    border.borderWidth = borderWidth;
    [self.layer addSublayer:border];
    self.layer.masksToBounds = YES;
}

//Check textfield blank or not
-(BOOL)isBlank
{
    BOOL isBlank;
    if (self.text.trim.length == 0)
        isBlank = YES;
    else
        isBlank = NO;
    
    return isBlank;
}

// placeholder position
//- (CGRect)textRectForBounds:(CGRect)bounds
//{
//    return CGRectInset(bounds, 10, 10);
//}
//
//// text position
//- (CGRect)editingRectForBounds:(CGRect)bounds
//{
//    return CGRectInset(bounds, 10, 10);
//}
-(void) setPadding:(int) paddingValue isLeft:(BOOL)isLeft
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingValue, self.frame.size.height)];
    if (isLeft) {
        self.leftView = paddingView;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    else
    {
        self.rightView = paddingView;
        self.rightViewMode = UITextFieldViewModeAlways;
    }
}
@end
