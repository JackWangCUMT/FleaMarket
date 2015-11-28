//
//  UIImage+Addition.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/24.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "UIImage+Addition.h"

@implementation UIImage (Addition)


- (UIImage *)imageWithColor:(UIColor *)color
{
   
    return [self imageWithColor:color size:CGRectMake(0, 0, 1, 1)];
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGRect)rect {
    
    NSParameterAssert(color != nil);
    
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    

}

- (UIImage *)antiAliasWithRect:(CGRect)rect
{
    CGFloat border = 1.0f;
    CGRect tempRect = CGRectMake(border, border, rect.size.width-2*border, rect.size.height-2*border);
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(tempRect.size.width,tempRect.size.height));
    [self drawInRect:CGRectMake(-1, -1, tempRect.size.width, tempRect.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.size);
    [img drawInRect:tempRect];
    UIImage* antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
}

-(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset {
    
    /*
    CGFloat border = 1.0f;
    CGRect tempRect = CGRectMake(border, border, image.size.width-2*border, image.size.height-2*border);
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(tempRect.size.width,tempRect.size.height));
    [self drawInRect:CGRectMake(-1, -1, tempRect.size.width, tempRect.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(img.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //1、image抗锯齿
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetShouldAntialias(context, true);

    
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGRect rect = CGRectMake(inset, inset, img.size.width - inset * 2.0f, img.size.height - inset * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [img drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
    */
    
    UIBezierPath *circularPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, image.size.width, image.size.height) cornerRadius:image.size.height / 2.0];
    [circularPath addClip];
    
    if (image)
    {
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    }
    
    return image;
}
@end
