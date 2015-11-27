//
//  UITabBarController+Addition.h
//  YouXiaoYun
//
//  Created by lovelydd on 15/10/30.
//  Copyright © 2015年 lovelydd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (Addition)

- (void)fl_customTabbarItemFont:(CGFloat)fontSize;

- (void)fl_tabbar:(UITabBar *)tabbar;

- (void)fl_setupTabbarItemTextAttributes;

- (void)fl_removeTopLine;

- (void)fl_tabbarBackgroundImage;

- (void)fl_customNavbarColor;
@end
