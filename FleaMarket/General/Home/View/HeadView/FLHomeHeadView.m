//
//  FLHomeHeadView.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/24.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLHomeHeadView.h"
#import "FLADBannerView.h"
#import "FLFishpondView.h"
#import "UIColor+Addition.h"

#import "UIConfig.h"

#import <Masonry.h>




@interface FLHomeHeadView ()

@property (nonatomic, strong)FLADBannerView *bannerView;
@property (nonatomic, strong) FLFishpondView *fishpondView;
@end

@implementation FLHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = kHomeBackGroundColor;
        
        NSArray *urls =  @[
                           @"http://sc.jb51.net/uploads/allimg/140628/11-14062Q633155b.jpg",
                           @"http://pic2.ooopic.com/10/56/19/43b1OOOPIC57.jpg",
                           @"http://pic2.ooopic.com/10/55/95/26b1OOOPICf8.jpg"
                           ];
        
        self.bannerView = [[FLADBannerView alloc] initWithUrls:urls];
        [self addSubview:self.bannerView];
        
        self.fishpondView = [[FLFishpondView alloc] initWithFrame:CGRectMake(0, self.bannerView.frame.size.height + 10, self.bounds.size.width, 220)];
        [self addSubview:self.fishpondView];
    }
    
    return self;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
@end
