//
//  FLRefreshHeader.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/26.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLRefreshHeader.h"
#import "FLRefreshImageView.h"

@interface FLRefreshHeader ()


@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) FLRefreshImageView *flishImageView;
@property (weak, nonatomic) UIImageView *activityImageView;

@end

@implementation FLRefreshHeader
#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 50;
    
    // 添加label
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor grayColor];
    label.font = [UIFont boldSystemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.label = label;
    
    
    FLRefreshImageView *imageView = [[FLRefreshImageView alloc] init];
    [self addSubview:imageView];
    self.flishImageView = imageView;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.label.frame = self.bounds;
    
    self.flishImageView.bounds = CGRectMake(0, 0, 60, 60);
    self.flishImageView.center = CGPointMake(self.mj_w * 0.5 + 80, self.mj_h * 0.5 + 10);
    
//    self.logo.bounds = CGRectMake(0, 0, self.bounds.size.width, 100);
//    self.logo.center = CGPointMake(self.mj_w * 0.5, - self.logo.mj_h + 20);
//    
//    self.loading.center = CGPointMake(self.mj_w - 30, self.mj_h * 0.5);
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    
    switch (state) {
        case MJRefreshStateIdle:

            self.label.text = @"下拉刷新";
             [self.flishImageView changeState:FLRefreshImageViewTypeNormal];
            [self dismissActivity];
            break;
        case MJRefreshStatePulling:

            self.label.text = @"松开看看";
             [self.flishImageView changeState:FLRefreshImageViewTypePulling];
            break;
        case MJRefreshStateRefreshing:

            self.label.text = @"";
                [self.flishImageView changeState:FLRefreshImageViewTypeRefreshing];
            
            [self showActivityView];
            break;
        default:
            break;
    }
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
 
    if (self.state == MJRefreshStatePulling) {
        
        
        CGPoint new = [change[@"new"] CGPointValue];
        CGFloat offsetY = fabsf(new.y) - 50 ;
        NSLog(@"contentOffset :%f",offsetY);
        [self.flishImageView changePullingMouthLength:offsetY];
        
    }

}

- (void)showActivityView {
    
    if (!_activityImageView) {
        
         UIImageView *activity = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 52, 16)];
        _activityImageView = activity;
        activity.center = CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5);
        [self addSubview:activity];
    }
    
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=29; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_v1_%05d", i]];
        [refreshingImages addObject:image];
    }
    
    _activityImageView.animationImages = refreshingImages;
    _activityImageView.animationDuration = 1.0f;
    _activityImageView.animationRepeatCount = 100;
    [_activityImageView startAnimating];
    
    [self.flishImageView startRefreshingMouthAnimation];
}

- (void)dismissActivity {
    
    [_activityImageView stopAnimating];
    [_activityImageView removeFromSuperview];
    _activityImageView = nil;
    
    
}



@end
