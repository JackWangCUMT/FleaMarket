//
//  FLRefreshImageView.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/26.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLRefreshImageView.h"
#import <objc/objc.h>
#import <objc/runtime.h>

@interface FLRefreshImageView () {
    
    UIImageView *pullingMouthImageView;
    UIImageView *refreshingMouthImageView;
    
    CGFloat offsetY;
}

@end

@implementation FLRefreshImageView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
     
        
    }
    return self;
    
}

-(instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.image = [UIImage imageNamed:@"refresh_normal"];
        self.contentMode = UIViewContentModeScaleAspectFit;
        
    }
    
    return self;
}

- (void)changeState:(FLRefreshImageViewType)type {
    
    self.image = nil;
    switch (type) {
        
        case FLRefreshImageViewTypeNormal: {
            NSLog(@"FLRefreshImageViewTypeNormal");
            self.image = [UIImage imageNamed:@"refresh_normal"];
            [self dismissRefreshingMouth];
            [self dismissPullingMouth];
            break;
        }
        case FLRefreshImageViewTypePulling: {
             NSLog(@"FLRefreshImageViewTypePulling");
            self.image = [UIImage imageNamed:@"refresh_pulling"];
            [self showPullingMouth];
            [self dismissRefreshingMouth];
            break;
        }
        case FLRefreshImageViewTypeRefreshing: {
               NSLog(@"FLRefreshImageViewTypeRefreshing");
            self.image = [UIImage imageNamed:@"refresh_loading"];
            [self showRefreshingMouth];
            [self dismissPullingMouth];
            
            break;
        }
        default: {
            break;
        }
            
           
    }
}

- (void)showPullingMouth {
    
    if (!pullingMouthImageView) {
        pullingMouthImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        pullingMouthImageView.image = [UIImage imageNamed:@"refresh_pulling_0"];
//        pullingMouthImageView.layer.anchorPoint = CGPointMake(0.5, 0);
        pullingMouthImageView.layer.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        [self addSubview:pullingMouthImageView];
    }
    
    pullingMouthImageView.hidden = NO;
}

- (void)dismissPullingMouth {

    pullingMouthImageView.hidden = YES;
}

- (void)showRefreshingMouth {
    
    if (!refreshingMouthImageView) {
        refreshingMouthImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        refreshingMouthImageView.image = [UIImage imageNamed:@"refresh_loading_0"];
//        refreshingMouthImageView.layer.anchorPoint = CGPointMake(1, 0.5);
        [self addSubview:refreshingMouthImageView];
    }
    
    refreshingMouthImageView.hidden = NO;
}

- (void)dismissRefreshingMouth {
    
    refreshingMouthImageView.hidden = YES;
}


- (void)changePullingMouthLength:(CGFloat)length {
    
        //TODO:这里嘴巴要跟着手势拉伸动起来
//    [self showPullingMouth];

    if (offsetY == length) {
        
        NSLog(@"相等了");
        return;
    }
    
//    [pullingMouthImageView.layer removeAnimationForKey:@"scale"];
    
    offsetY = length;
    length = length / 50;
//    CABasicAnimation *scaleAnimation;
//    scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
//    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
//    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1+length, 1.0)];
////    scaleAnimation.duration = 0.2;
//    scaleAnimation.cumulative = YES;
//    scaleAnimation.repeatCount = 1;
//    scaleAnimation.removedOnCompletion= NO;
//    scaleAnimation.fillMode=kCAFillModeForwards;
////    scaleAnimation.autoreverses = NO;
////    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.2:0.0 :0.8 :1.0];
////    scaleAnimation.speed = 1.0f;
////    scaleAnimation.beginTime = 0.0f;
//    
//
//    [pullingMouthImageView.layer addAnimation:scaleAnimation forKey:@"scale"];
    
    [UIView animateWithDuration:0.1 animations:^{
        
               pullingMouthImageView.layer.transform = CATransform3DMakeScale(1.0, 1 + length, 1.0);
//        pullingMouthImageView.layer.position = CGPointMake(self.bounds.size.height / 2, self.bounds.size.height / 2);
    }];



}

//震动的动画
- (void)startRefreshingMouthAnimation {
    
    CABasicAnimation *momAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    momAnimation.fromValue = [NSNumber numberWithFloat:-0.6];
    momAnimation.toValue = [NSNumber numberWithFloat:0.6];
    momAnimation.duration = 0.3;
    momAnimation.repeatCount = CGFLOAT_MAX;
    momAnimation.autoreverses = YES;
    momAnimation.delegate = self;
    [refreshingMouthImageView.layer addAnimation:momAnimation forKey:@"animateLayer"];
}

@end
