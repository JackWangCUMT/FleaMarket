//
//  FLQRViewController.m
//  FleaMarket
//
//  Created by lovelydd on 15/11/28.
//  Copyright © 2015年 xiaomutou. All rights reserved.
//

#import "FLQRViewController.h"
#import "UIViewController+Addition.h"
#import "PageManager.h"
#import "UIImage+Addition.h"
#import "UIConfig.h"
#import <AVFoundation/AVFoundation.h>
#import "FLQRAimImageView.h"

@interface FLQRViewController ()<AVCaptureMetadataOutputObjectsDelegate>

@property (strong, nonatomic) AVCaptureDevice * device;
@property (strong, nonatomic) AVCaptureDeviceInput * input;
@property (strong, nonatomic) AVCaptureMetadataOutput * output;
@property (strong, nonatomic) AVCaptureSession * session;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer * preview;

@property (strong, nonatomic) UILabel *hitLabel;
@end

@implementation FLQRViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    self.extendedLayoutIncludesOpaqueBars = YES;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self fl_translucentNavBar];
    
    [self fl_cusomNavBarItemWithImage:@"qrcode_back"
                            highlight:@""
                                title:@""
                                 type:FLNavBarItemTypeLeft
                               action:^{
        
                              
                                   [[PageManager manager] pop];
    }];
    
    [self fl_cusomNavBarItemWithImage:@"qrcode_flash_normal"
                            highlight:@""
                                title:@""
                                 type:FLNavBarItemTypeRight
                               action:^{
                                   
                                   
                               }];
    
    _hitLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    _hitLabel.text = @"正在载入";
    _hitLabel.backgroundColor = [UIColor grayColor];
    _hitLabel.alpha = 0.2;
    _hitLabel.center = self.view.center;
    _hitLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_hitLabel];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    double delayInSeconds = 0.1;
    //创建一个调度时间,相对于默认时钟或修改现有的调度时间。
    dispatch_time_t delayInNanoSeconds =dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    //推迟两纳秒执行
    dispatch_queue_t concurrentQueue =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(delayInNanoSeconds, concurrentQueue, ^(void){

        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_hitLabel removeFromSuperview];
        });
    });
    
    [self defaultConfig];
    
}

- (void)defaultConfig {
    
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // Session
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    
    // 条码类型 AVMetadataObjectTypeQRCode
    _output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    
    // Preview
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:_session];
    _preview.videoGravity =AVLayerVideoGravityResize;
    _preview.frame = CGRectMake(0, 0, FLSCREENWIDHT, FLSCREENHEIGHT);
    [self.view.layer insertSublayer:_preview atIndex:0];
    
    [_session startRunning];
    
    FLQRAimImageView *aimImageView = [[FLQRAimImageView alloc] init];
    aimImageView.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.5);
    [self.view addSubview:aimImageView];
    
    //修正扫描区域
    CGFloat screenHeight = self.view.frame.size.height;
    CGFloat screenWidth = self.view.frame.size.width;
    CGRect cropRect = CGRectMake((screenWidth - aimImageView.frame.size.width) / 2,
                                 (screenHeight - aimImageView.frame.size.height) / 2,
                                 aimImageView.frame.size.width,
                                 aimImageView.frame.size.height);
    
    [_output setRectOfInterest:CGRectMake(cropRect.origin.y / screenHeight,
                                          cropRect.origin.x / screenWidth,
                                          cropRect.size.height / screenHeight,
                                          cropRect.size.width / screenWidth)];
}

#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue;
    if ([metadataObjects count] >0)
    {
        //停止扫描
        [_session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    
    NSLog(@" %@",stringValue);
    
    [[PageManager manager] pop];
    
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
