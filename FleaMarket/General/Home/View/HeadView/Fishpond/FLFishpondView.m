//
//  FLFishpondView.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/25.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLFishpondView.h"
#import <iCarousel/iCarousel.h>

#import "FLFishpondItemView.h"


@interface FLFishpondView () <iCarouselDataSource,iCarouselDelegate>


@property (nonatomic, strong) iCarousel *iCarouselView;
@end


@implementation FLFishpondView


#pragma mark - Life Cycle
-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.iCarouselView = [[iCarousel alloc] initWithFrame:self.bounds];
        self.iCarouselView.delegate = self;
        self.iCarouselView.dataSource = self;
        self.iCarouselView.type = iCarouselTypeLinear;
        self.iCarouselView.pagingEnabled = YES;
        [self addSubview:self.iCarouselView];
    }
    
    return self;
}

#pragma mark - iCarouselDelegate
- (NSInteger)numberOfItemsInCarousel:(__unused iCarousel *)carousel
{
    return 10;
}

- (UIView *)carousel:(__unused iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
//        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 130)];
//        view.contentMode = UIViewContentModeCenter;
//        view.backgroundColor = [UIColor redColor];
//        label = [[UILabel alloc] initWithFrame:view.bounds];
//        label.backgroundColor = [UIColor clearColor];
//        label.font = [label.font fontWithSize:50];
//        label.tag = 1;
//        [view addSubview:label];
        
        view = [[[NSBundle mainBundle] loadNibNamed:@"FLFishpondItemView" owner:self options:nil] lastObject];
        view.layer.shadowColor = [UIColor blackColor].CGColor;
        
        view.layer.shadowOffset = CGSizeMake(1, 0);
        
        view.layer.shadowOpacity = 0.5;
        
        view.layer.shadowRadius = 1.1;
        
        
        
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    
    return view;
}

- (NSInteger)numberOfPlaceholdersInCarousel:(__unused iCarousel *)carousel
{
    //note: placeholder views are only displayed on some carousels if wrapping is disabled
    return 2;
}

- (UIView *)carousel:(__unused iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        view.contentMode = UIViewContentModeCenter;
        
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        label.font = [label.font fontWithSize:50.0f];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    label.text = (index == 0)? @"[": @"]";
    
    return view;
}

- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * self.iCarouselView.itemWidth);
}

- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return YES;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.05f;
        }
        case iCarouselOptionFadeMax:
        {
            if (self.iCarouselView.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}

@end
