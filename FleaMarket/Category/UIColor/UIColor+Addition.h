//
//  UIColor+Extend.h
//  zongjie
//
//  Created by 4399 on 15/4/29.
//  Copyright (c) 2015年 4399. All rights reserved.
//


#import <UIKit/UIKit.h>

#define RGB(r,g,b) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:1.]

#define kTabbarColor RGB(255,255,255)

#define kNavbarColor RGB(253, 218, 68)

#define kHomeBackGroundColor RGB(234,234,234)

@interface UIColor (hexColor)

+ (UIColor *)hexFloatColor:(NSString *)hexStr;

@end


