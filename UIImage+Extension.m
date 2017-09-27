//
//  UIImage+Extension.m
//  ExtensionObjC
//
//  Created by Nidhi on 8/22/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

//Convert Image to string
+(NSString *)convertString:(UIImage *)image
{
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);

    if (imageData != nil)
        return [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    else
        return nil;
}

//Convert String to image
+(UIImage *)convertImage:(NSString *)string
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string
                                                      options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

//Image with path
+(NSString *)storeLocallyImage:(UIImage *)image
{
    NSString *strPath;
    NSData *imageData = UIImagePNGRepresentation(image);
    NSString *documentsDirectory = [NSString documentDirectory];
    NSString *imagePath =[documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",[NSString randomString]]];
    if (![imageData writeToFile:imagePath atomically:NO])
    {
        strPath = @"Failed to cache image data to disk";
    }
    else
    {
        strPath = imagePath;
    }
    return strPath;
}

+(NSString *)storedFileIntoLocal : (UIImage *)imgPreview : (NSString *)strImageName
{
    NSString *imagePath = [[NSString cachesDirectory] stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",strImageName]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL fileExists = [fileManager fileExistsAtPath:imagePath];
    
    if(fileExists)
    {
        BOOL remove = [fileManager removeItemAtPath:imagePath error:nil];
        if(remove)
        {
            NSLog(@"File removed...");
        }
    }
    NSData *imageData = UIImageJPEGRepresentation(imgPreview, 0.3);
    [imageData writeToFile:imagePath atomically:YES];
    
    return imagePath;
}
+(UIImage *)scaleAndRotateImage:(UIImage *) image
{
    UIImageView *imgViewTemp = [[UIImageView alloc] initWithImage:image];
    
    int kMaxResolution = imgViewTemp.frame.size.width/2;
    CGImageRef imgRef = image.CGImage;
    
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
    if (width > kMaxResolution || height > kMaxResolution) {
        CGFloat ratio = width/height;
        if (ratio > 1) {
            bounds.size.width = kMaxResolution;
            bounds.size.height = bounds.size.width / ratio;
        }
        else {
            bounds.size.height = kMaxResolution;
            bounds.size.width = bounds.size.height * ratio;
        }
    }
    
    CGFloat scaleRatio = bounds.size.width / width;
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    CGFloat boundHeight;
    UIImageOrientation orient = image.imageOrientation;
    switch(orient) {
            
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
            
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeftMirrored: //EXIF = 5
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationLeft: //EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationRightMirrored: //EXIF = 7
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        case UIImageOrientationRight: //EXIF = 8
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
            
    }
    
    UIGraphicsBeginImageContext(bounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    }
    else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }
    
    CGContextConcatCTM(context, transform);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageCopy;
}

//function for resize image
-(UIImage *)resizeimage:(CGSize)targetSize
{
    CGSize size = self.size;
    float widthRatio = targetSize.width / size.width;
    float heightRatio = targetSize.height / size.height;
    // Figure out what our orientation is, and use that to form the rectangle
    CGSize newSize;
    if (widthRatio > heightRatio)
    {
        newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio);
    }
    else
    {
        newSize = CGSizeMake(size.width * widthRatio, size.height * widthRatio);
    }
    // This is the rect that we've calculated out and this is what is actually used below
    CGRect rect = CGRectMake(0, 0, newSize.width, newSize.height);
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize,false,1.0);
    [self drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
