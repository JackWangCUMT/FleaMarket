//
//  UINavigationController+Addition.m
//  YouXiaoYun
//
//  Created by lovelydd on 15/5/20.
//  Copyright (c) 2015年 lovelydd. All rights reserved.
//

#import "UINavigationController+Addition.h"

@implementation UINavigationController (Addition)

- (void)dd_push:(UIViewController*)v animation:(BOOL)animation {
    
    v.hidesBottomBarWhenPushed = YES;
    [self pushViewController:v animated:YES];
//    v.hidesBottomBarWhenPushed = NO;
}


@end
