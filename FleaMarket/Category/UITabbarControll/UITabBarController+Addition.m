//
//  UITabBarController+Addition.m
//  YouXiaoYun
//
//  Created by lovelydd on 15/10/30.
//  Copyright © 2015年 lovelydd. All rights reserved.
//

#import "UITabBarController+Addition.h"
#import "UIImage+Addition.h"
#import "UIColor+Addition.h"

@implementation UITabBarController (Addition)

- (void)fl_customTabbarItemFont:(CGFloat)fontSize {
    UIFont *tabBarFont = [UIFont systemFontOfSize:13];
    NSDictionary *titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                         tabBarFont, NSFontAttributeName, nil];
    for(UIViewController *tab in self.viewControllers) {
        [tab.tabBarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
}

- (void)fl_tabbar:(UITabBar *)tabbar {
    
    [self setValue:tabbar forKey:@"tabBar"];
}

- (void)fl_setupTabbarItemTextAttributes {
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateHighlighted];
}

- (void)fl_removeTopLine {
    //去除 TabBar 自带的顶部阴影
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)fl_tabbarBackgroundImage {
    
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:kTabbarColor]];

}

- (void)fl_customNavbarColor {
    

    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:kNavbarColor] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
}
@end
