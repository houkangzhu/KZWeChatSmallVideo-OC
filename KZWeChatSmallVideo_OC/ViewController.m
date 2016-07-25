//
//  ViewController.m
//  KZWeChatSmallVideo_OC
//
//  Created by HouKangzhu on 16/7/18.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "ViewController.h"
#import "KZVideoViewController.h"
#import "KZVideoPlayer.h"
@interface ViewController ()<KZVideoViewControllerDelegate> {
    KZVideoModel *_videoModel;
}
@property (weak, nonatomic) IBOutlet UIView *showView;
@property (weak, nonatomic) IBOutlet UILabel *videoSizeLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.showView layoutIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


- (IBAction)shareAction:(id)sender {
    if (!_videoModel) {
        NSLog(@"先录制视频再分享");
        return;
    }
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[[NSURL fileURLWithPath:_videoModel.videoAbsolutePath]] applicationActivities:nil];
    activityVC.completionWithItemsHandler = ^(NSString * __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError) {
//        NSLog(@"分享完成!");
    };
    [self presentViewController:activityVC animated:YES completion:nil];
    
}


- (IBAction)startRecordAction:(id)sender {
    KZVideoViewController *videoVC = [[KZVideoViewController alloc] init];
    videoVC.delegate = self;
//    videoVC.savePhotoAlbum = YES;
    [videoVC startAnimationWithType:KZVideoViewShowTypeSmall];
}
- (IBAction)recordFullScreen:(id)sender {
    KZVideoViewController *videoVC = [[KZVideoViewController alloc] init];
    videoVC.delegate = self;
    [videoVC startAnimationWithType:KZVideoViewShowTypeSingle];
}

#pragma mark - KZVideoViewControllerDelegate
- (void)videoViewController:(KZVideoViewController *)videoController didRecordVideo:(KZVideoModel *)videoModel {
    _videoModel = videoModel;
    
    NSError *error = nil;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *attri = [fm attributesOfItemAtPath:_videoModel.videoAbsolutePath error:&error];
    if (error) {
        NSLog(@"error:%@",error);
    }
    else {
        self.videoSizeLable.text = [NSString stringWithFormat:@"视频总大小:%.0fKB",attri.fileSize/1024.0];
    }
    
    for (UIView *subview in self.showView.subviews) {
        [subview removeFromSuperview];
    }
    
    NSURL *videoUrl = [NSURL fileURLWithPath:_videoModel.videoAbsolutePath];
    KZVideoPlayer *player = [[KZVideoPlayer alloc] initWithFrame:self.showView.bounds videoUrl:videoUrl];
    [self.showView addSubview:player];
}

- (void)videoViewControllerDidCancel:(KZVideoViewController *)videoController {
    NSLog(@"没有录到视频");
}
@end
