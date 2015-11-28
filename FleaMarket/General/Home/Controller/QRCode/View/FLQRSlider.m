//
//  FLQRSlider.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/28.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLQRSlider.h"

@implementation FLQRSlider



- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.minimumValue = 0; //最小值
        self.maximumValue = 1; //最大值
        self.value = 0; //默认值
        self.minimumTrackTintColor = [UIColor whiteColor];
        self.maximumTrackTintColor = [UIColor whiteColor];
        UIImage *image = [UIImage imageNamed:@"qrcode_slider_thumbImage"];
        [self setThumbImage:image forState:UIControlStateNormal];
    }
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
