//
//  FLPublicButton.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/25.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLPublicButton.h"
#import "UIConfig.h"

@implementation FLPublicButton


-(void)awakeFromNib {
    
    [super awakeFromNib];

}
-(instancetype)initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
    if (self) {
     
        
        self.layer.cornerRadius = 5.0f;
        self.layer.borderColor = RGB(56, 169, 220).CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.masksToBounds = YES;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
        [self sizeToFit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

@end
