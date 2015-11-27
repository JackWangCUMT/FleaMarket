//
//  FLHomeViewController.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/23.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLHomeViewController.h"
#import "FLADBannerView.h"

#import "FLHomeHeadView.h"

#import "UIConfig.h"

#import <MJRefresh.h>
#import "FLRefreshHeader.h"

#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVAssetTrackGroup.h>

#import <AssetsLibrary/AssetsLibrary.h>
#import <AssetsLibrary/ALAsset.h>
#import <AVFoundation/AVAssetTrack.h>


@interface FLHomeViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation FLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = kHomeBackGroundColor;
    
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_title"]];
    self.navigationItem.titleView = titleView;
    
    [self fl_cusomNavBarItemWithImage:@"home_scan"
                            highlight:@"home_scan"
                                title:@""
                                 type:FLNavBarItemTypeLeft
                               action:^{
        
    }];
    
    [self fl_cusomNavBarItemWithImage:@"home_search"
                            highlight:@"home_search"
                                title:@""
                                 type:FLNavBarItemTypeRight
                               action:^{
                                   
                               }];

    
    

    
    FLHomeHeadView *tableView = [[FLHomeHeadView alloc] initWithFrame:CGRectMake(0, 0, FLSCREENWIDHT, 380)];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, FLSCREENWIDHT, FLSCREENHEIGHT - 64 - 49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = tableView;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];
    [self.view addSubview:self.tableView];
    
    FLRefreshHeader *header =[FLRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_header = header;
    
    
}


- (void)loadNewData
{
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格

        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_header endRefreshing];
    });
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    cell.textLabel.text = @"A";
    return cell;
}



-(void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    self.view.backgroundColor = [UIColor grayColor];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
