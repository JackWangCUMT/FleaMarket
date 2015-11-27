//
//  FLRefreshImageView.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/26.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLRefreshImageView.h"

@interface FLRefreshImageView () {
    
    UIImageView *pullingMouthImageView;
    UIImageView *refreshingMouthImageView;
    

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
        [self addSubview:refreshingMouthImageView];
    }
    
    refreshingMouthImageView.hidden = NO;
}

- (void)dismissRefreshingMouth {
    
    refreshingMouthImageView.hidden = YES;
}


- (void)changePullingMouthLength:(CGFloat)length {
    
        //TODO:这里嘴巴要跟着手势拉伸动起来
    
    
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
