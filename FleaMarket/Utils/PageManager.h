//
//  PageManager.h
//  FleaMarket
//
//  Created by lovelydd on 15/11/28.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PageManager : NSObject

+ (instancetype)manager;

- (void)pushWithController:(NSString *)controllerName param:(id)param;

- (void)pop;
@end


OBJC_EXTERN NSString * const QRCodeController;