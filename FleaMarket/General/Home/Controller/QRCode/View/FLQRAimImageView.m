//
//  FLQRAimImageView.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/28.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLQRAimImageView.h"

@implementation FLQRAimImageView


- (instancetype)init {
    
    UIImage *aimImage = [UIImage imageNamed:@"qrcode_aim"];
    return [self initWithImage:aimImage];
}

- (instancetype)initWithImage:(UIImage *)image {
    
    self = [super initWithImage:image];
    if (self) {
        
        
        UIView *redLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 2)];
        redLine.backgroundColor = [UIColor redColor];
        redLine.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        [self addSubview:redLine];
        
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
     
        NSLog(@"initWithFram 执行了");
    }
    return self;
}

@end
