//
//  FLPostButton.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/24.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLPostButton.h"

static CGFloat kPostButtonImageViewWidth = 64.0f;
static CGFloat kPostButtonImageViewHeight = 57.0f;

@interface FLPostButton ()<UIActionSheetDelegate>

@end

@implementation FLPostButton

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
    }
    
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];

    self.imageView.bounds = CGRectMake(0, 0, kPostButtonImageViewWidth, kPostButtonImageViewHeight);
    self.imageView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2 - self.titleLabel.font.lineHeight);
    
    self.titleLabel.bounds = CGRectMake(0, 0, self.bounds.size.width, self.titleLabel.font.lineHeight);
    self.titleLabel.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height - self.titleLabel.font.lineHeight / 2 + 4);
    
    
}

+ (instancetype)postButton {
    
    FLPostButton *button = [[FLPostButton alloc]init];
    
    [button setImage:[UIImage imageNamed:@"tabbar_post_normal"] forState:UIControlStateNormal];
    [button setTitle:@"发布" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:10];
    
    [button sizeToFit];
    
    [button addTarget:button action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    
    return button;

}

- (void)clickPublish {
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UIViewController *viewController = tabBarController.selectedViewController;
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil
                                                            delegate:self
                                                   cancelButtonTitle:@"取消"
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:@"拍照", @"从相册选取", @"淘宝一键转卖", nil];
    [actionSheet showInView:viewController.view];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"buttonIndex = %ld", (long)buttonIndex);
}


@end
