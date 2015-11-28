//
//  UIImage+Addition.h
//  FleaMarket
//
//  Created by lovelydd on 15/11/24.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addition)

- (UIImage *)imageWithColor:(UIColor *)color;       //默认是1*1
- (UIImage *)imageWithColor:(UIColor *)color size:(CGRect)rect;

-(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset;

- (UIImage *)antiAlias;
@end
