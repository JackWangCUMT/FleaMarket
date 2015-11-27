//
//  FLTabbar.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/23.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLTabbar.h"
#import "FLPostButton.h"

@interface FLTabbar ()


@property (nonatomic, strong) FLPostButton *postButton;
@end


@implementation FLTabbar


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        FLPostButton *button = [FLPostButton postButton];
        [self addSubview:button];
        self.postButton = button;
    }
    
    return self;
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
   
    CGFloat barWidth = self.frame.size.width;
    CGFloat barHeight = self.frame.size.height;
    
    
    
     NSInteger buttonIndex = 0;
    CGFloat buttonW = barWidth / 5;
    CGFloat buttonH = barHeight;
//    CGFloat buttonY = 1;
    
    for (UIView *view in self.subviews) {
        
        NSString *viewClass = NSStringFromClass([view class]);
        if (![viewClass isEqualToString:@"UITabBarButton"]) continue;
        
        CGFloat buttonX = buttonIndex * buttonW;
        if (buttonIndex >= 2) { // 右边2个按钮
            buttonX += buttonW;
        }
        
        view.frame = CGRectMake(buttonX, 0, buttonW, buttonH);
        
        buttonIndex ++;
    }
    
    self.postButton.center = CGPointMake(barWidth * 0.5, barHeight * 0.3);
}

@end
