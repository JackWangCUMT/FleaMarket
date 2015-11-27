//
//  FLADBannerView.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/24.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLADBannerView.h"

#import <SDCycleScrollView.h>
#import "UIConfig.h"

static CGFloat kADBannerViewHeight = 150;

@interface FLADBannerView ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) NSArray *urls;
@end

@implementation FLADBannerView


- (instancetype)initWithUrls:(NSArray *)urls {
    
    self.urls = urls;
    return [self initWithFrame:CGRectMake(0, 0, FLSCREENWIDHT, kADBannerViewHeight)];
    
}
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //网络加载 --- 创建带标题的图片轮播器
        SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds imageURLStringsGroup:nil]; // 模拟网络延时情景
        cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        cycleScrollView2.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        cycleScrollView2.delegate = self;
        cycleScrollView2.dotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
        cycleScrollView2.placeholderImage = [UIImage imageNamed:@"placeholder"];
        [self addSubview:cycleScrollView2];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            cycleScrollView2.imageURLStringsGroup = self.urls;
        });

    }
    
    return self;
}


#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
}


@end
