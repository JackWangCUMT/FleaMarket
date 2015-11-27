//
//  FLTabbarController.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/23.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLTabbarController.h"

#import "UITabBarController+Addition.h"

#import "FLTabbar.h"

#import "FLHomeViewController.h"
#import "FLCityViewController.h"
#import "FLPostViewController.h"
#import "FLMessageViewController.h"
#import "FLAccountViewController.h"

#import "FLNavigationController.h"

@interface FLTabbarController ()

@end

@implementation FLTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self defaultConfig];

    [self setupChildViewControllers];
}

- (void)defaultConfig {
 
    FLTabbar *tabber = [[FLTabbar alloc] init];
    [self fl_tabbar:tabber];
    
    [self fl_setupTabbarItemTextAttributes];
    
    [self fl_removeTopLine];
    
    [self fl_tabbarBackgroundImage];
    
    [self fl_customNavbarColor];
    

}

- (void)setupChildViewControllers {
    
    NSArray *childDatas = @[
                            @{@"title" : @"首页",
                              @"normalImage" : @"tabbar_home_normal",
                              @"hightLightImage" : @"tabbar_home_highlight",
                              @"class" : @"FLHomeViewController",
                              },
                            @{@"title" : @"同城",
                              @"normalImage" : @"tabbar_local_normal",
                              @"hightLightImage" : @"tabbar_local_highlight",
                              @"class" : @"FLCityViewController",
                              },
                            @{@"title" : @"",
                              @"normalImage" : @"tabbar_post_normal",
                              @"hightLightImage" : @"tabbar_post_normal",
                              @"class" : @"FLPostViewController",
                              },
                            @{@"title" : @"消息",
                              @"normalImage" : @"tabbar_message_normal",
                              @"hightLightImage" : @"tabbar_message_highlight",
                              @"class" : @"FLMessageViewController",
                              },
                            @{@"title" : @"我的",
                              @"normalImage" : @"tabbar_account_normal",
                              @"hightLightImage" : @"tabbar_account_highlight",
                              @"class" : @"FLAccountViewController",
                              },
                            ];
    
    for (NSInteger i = 0 ; i < childDatas.count; i++) {
        
        if (i == 2) {
            continue;
        }

        NSDictionary *childControllerDic = childDatas[i];
        Class controllerClass = NSClassFromString(childControllerDic[@"class"]);
        UIViewController *controller = [[controllerClass alloc] init];
        controller.view.backgroundColor = [UIColor whiteColor];
        controller.tabBarItem.title = childControllerDic[@"title"];
        
            controller.tabBarItem.image = [UIImage imageNamed:childControllerDic[@"normalImage"]];
            UIImage *hightlightImage = [UIImage imageNamed:childControllerDic[@"hightLightImage"]];
            hightlightImage = [hightlightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            controller.tabBarItem.selectedImage = hightlightImage;
            
        FLNavigationController *nav = [[FLNavigationController alloc] initWithRootViewController:controller];
        [self addChildViewController:nav];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
