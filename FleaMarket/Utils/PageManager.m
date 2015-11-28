//
//  PageManager.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/28.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "PageManager.h"
#import "FLQRViewController.h"
#import "UINavigationController+Addition.h"

NSString * const QRCodeController = @"FLQRViewController";


@implementation PageManager

+ (instancetype)manager {
    static PageManager *pageManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pageManager = [[PageManager alloc] init];
    });
    
    return pageManager;
}

- (void)pushWithController:(NSString *)controllerName param:(id)param {
    
 
    UIViewController *currentVC = [self visibleViewController];
    if (controllerName == QRCodeController) {
        
        FLQRViewController *qrcodeVC = [[FLQRViewController alloc] init];
        [currentVC.navigationController dd_push:qrcodeVC animation:YES];
    }
}

- (void)pop {
    
    UIViewController *currentVC = [self visibleViewController];
    
    [currentVC.navigationController popViewControllerAnimated:YES];
}

- (UIViewController *)visibleViewController {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self getVisibleViewControllerFrom:rootViewController];
}

- (UIViewController *) getVisibleViewControllerFrom:(UIViewController *) vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self getVisibleViewControllerFrom:[((UITabBarController *) vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [self getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}
@end
