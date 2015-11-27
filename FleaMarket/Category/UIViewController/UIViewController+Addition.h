//
//  UIViewController+Addition.h
//
//
//  Created by lcd on 15/8/18.
//  Copyright (c) 2015年 4399. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, FLNavBarItemType) {
    FLNavBarItemTypeLeft =  0,
    FLNavBarItemTypeRight = 1,
};

@interface UIViewController (Addition)


@property (nonatomic, strong) UIButton *leftNavBarItem;
@property (nonatomic, strong) UIButton *rightNavBarItem;

- (void)fl_cusomNavBarItemWithImage:(NSString *)normalName
                          highlight:(NSString *)highlightName
                              title:(NSString *)title
                               type:(FLNavBarItemType)type
                             action:(dispatch_block_t)btnBlock;

/*
 *  title设置
 */
- (void)fl_navTitle:(NSString *)title;

/*
 *  导航栏color设置
 */
- (void)fl_navBarColor:(UIColor *)color;

/*
 *  背景设置
 */
- (void)fl_backgroundColor:(UIColor *)color;

/*
 *  导航栏加阴影
 */

- (void)fl_navBarShadow;
@end
