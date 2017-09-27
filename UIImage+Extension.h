//
//  UIImage+Extension.h
//  ExtensionObjC
//
//  Created by Nidhi on 8/22/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIImage (Extension)
+(NSString *)convertString:(UIImage *)image;
+(UIImage *)convertImage:(NSString *)string;
+(NSString *)storeLocallyImage:(UIImage *)image;
-(UIImage *)resizeimage:(CGSize)targetSize;
+(UIImage *)scaleAndRotateImage:(UIImage *) image;
@end
