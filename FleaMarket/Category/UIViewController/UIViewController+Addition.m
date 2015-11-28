//
//  UIViewController+Addition.m
//
//  Created by lcd on 15/8/18.
//  Copyright (c) 2015年 4399. All rights reserved.
//

#import "UIViewController+Addition.h"
#import <objc/runtime.h>
//#import "LNResource.h"

static char *flLeftItem;
static char *flRightItem;
static char *btnClickAction;

@implementation UIViewController (Addition)
@dynamic leftNavBarItem;
@dynamic rightNavBarItem;

- (void)fl_cusomNavBarItemWithImage:(NSString *)normalName
                          highlight:(NSString *)highlightName
                              title:(NSString *)title
                               type:(FLNavBarItemType)type
                             action:(dispatch_block_t)btnBlock {
    
    if (type == FLNavBarItemTypeLeft) {
        
        self.leftNavBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [self customNavBarButton:self.leftNavBarItem normalImage:normalName highligh:highlightName title:title];
        objc_setAssociatedObject(self.leftNavBarItem, &btnClickAction, btnBlock, OBJC_ASSOCIATION_COPY);
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftNavBarItem];
    } else {
        
        self.rightNavBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [self customNavBarButton:self.rightNavBarItem normalImage:normalName highligh:highlightName title:title];
        objc_setAssociatedObject(self.rightNavBarItem, &btnClickAction, btnBlock, OBJC_ASSOCIATION_COPY);
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavBarItem];
        
    }
}


- (void)customNavBarButton:(UIButton *)button
               normalImage:(NSString *)normalName
                  highligh:(NSString *)highlighName
                     title:(NSString *)title {
    
    UIImage *normalImage = [UIImage imageNamed:normalName];
    
    [button setImage:normalImage forState:UIControlStateNormal];
    if (highlighName) {
        
        UIImage *highlightImage = [UIImage imageNamed:highlighName];
        [button setImage:highlightImage forState:UIControlStateHighlighted];
        [button setImage:highlightImage forState:UIControlStateSelected];
    }
    
    if (title) {
        
        button.titleLabel.font = [UIFont boldSystemFontOfSize:16.];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    }
    
    [button sizeToFit];
    
    [button addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)actionBtnClick:(UIButton *)button {
    
    button.selected = !button.isSelected;
    dispatch_block_t buttonBlock = objc_getAssociatedObject(button, &btnClickAction);
    if (buttonBlock) {
        buttonBlock();
    }
}

- (void)fl_navTitle:(NSString *)title {
    
    [self.navigationItem setTitle:title];
}

- (void)fl_navBarColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * imge = [[UIImage alloc] init];
    imge = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.navigationController.navigationBar setBackgroundImage:imge forBarMetrics:UIBarMetricsDefault];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    self.navigationController.navigationBar.translucent = NO;
}

- (void)fl_backgroundColor:(UIColor *)color {
    
    self.view.backgroundColor = color;
}

- (void)fl_navBarShadow {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.navigationController.navigationBar.bounds);
    self.navigationController.navigationBar.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    
    self.navigationController.navigationBar.layer.shadowColor = [UIColor blackColor].CGColor;
    self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(0, 3);
    self.navigationController.navigationBar.layer.shadowRadius = 1;
    self.navigationController.navigationBar.layer.shadowOpacity = 1;
    self.navigationController.navigationBar.clipsToBounds = NO;
}

- (void)fl_translucentNavBar {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar  setShadowImage:[UIImage new]];
}

#pragma mark - getter and setter 
-(UIButton *)leftNavBarItem {
    
    return objc_getAssociatedObject(self, &flLeftItem);
}

- (void)setLeftNavBarItem:(UIButton *)leftNavBarItem {
    
    objc_setAssociatedObject(self, &flLeftItem, leftNavBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)rightNavBarItem {
    
    return objc_getAssociatedObject(self, &flRightItem);
}

-(void)setRightNavBarItem:(UIButton *)rightNavBarItem {
    
    objc_setAssociatedObject(self, &flRightItem, rightNavBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
