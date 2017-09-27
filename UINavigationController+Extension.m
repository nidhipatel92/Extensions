//
//  UINavigationController+Extension.m
//  ExtensionObjC
//
//  Created by Nidhi on 8/23/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import "UINavigationController+Extension.h"

@implementation UINavigationController (Extension)

-(void)setTitleToNavBar:(NSString *)title //andWithTarget:(UIViewController *)vc
{
    UILabel *lblTitle = [[UILabel alloc] init];
    lblTitle.text = title;
    lblTitle.backgroundColor = [UIColor clearColor];
    lblTitle.textColor = [UIColor whiteColor];
    lblTitle.font = [UIFont navigationBarFont];
    [lblTitle sizeToFit];
    
    self.topViewController.navigationItem.titleView = lblTitle;
    [self.topViewController.navigationController.navigationBar setBarTintColor:[UIColor navigationBarColor]];
    
//    [vc.navigationController.navigationBar setBarTintColor:[UIColor navigationBarColor]];
}
@end
