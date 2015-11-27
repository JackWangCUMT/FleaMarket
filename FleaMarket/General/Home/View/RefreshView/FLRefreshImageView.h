//
//  FLRefreshImageView.h
//  FleaMarket
//
//  Created by lovelydd on 15/11/26.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, FLRefreshImageViewType) {
    FLRefreshImageViewTypeNormal = 0 ,
    FLRefreshImageViewTypePulling,
    FLRefreshImageViewTypeRefreshing
};
@interface FLRefreshImageView : UIImageView

- (void)changeState:(FLRefreshImageViewType)type;

- (void)changePullingMouthLength:(CGFloat)length;

- (void)startRefreshingMouthAnimation;
@end
