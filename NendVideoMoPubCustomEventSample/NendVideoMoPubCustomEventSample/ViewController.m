//
//  ViewController.m
//  NendVideoMoPubCustomEventSample
//
//  Copyright © 2017年 F@N Communications. All rights reserved.
//

#import "ViewController.h"

#import "MoPub.h"
#import "MPRewardedVideo.h"
#import "NendInstanceMediationSettings.h"

static NSString *const kAdUnitId = @"your ad unit id";

@interface ViewController () <MPRewardedVideoDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[MoPub sharedInstance] initializeRewardedVideoWithGlobalMediationSettings:nil delegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)load:(id)sender {
    NendInstanceMediationSettings *settings = [NendInstanceMediationSettings new];
    settings.userId = @"your user id";
    [MPRewardedVideo loadRewardedVideoAdWithAdUnitID:kAdUnitId withMediationSettings:@[settings]];
}

- (IBAction)show:(id)sender {
    if ([MPRewardedVideo hasAdAvailableForAdUnitID:kAdUnitId]) {
        [MPRewardedVideo presentRewardedVideoAdForAdUnitID:kAdUnitId fromViewController:self withReward:nil];
    }
}


#pragma mark - MPRewardedVideoDelegate

- (void)rewardedVideoAdDidLoadForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedVideoAdDidFailToLoadForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
    NSLog(@"%s: %@, error: %@", __FUNCTION__, adUnitID, error);
}
- (void)rewardedVideoAdDidFailToPlayForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
    NSLog(@"%s: %@, error: %@", __FUNCTION__, adUnitID, error);
}
- (void)rewardedVideoAdWillAppearForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedVideoAdDidAppearForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedVideoAdWillDisappearForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedVideoAdDidDisappearForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedVideoAdWillLeaveApplicationForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedVideoAdDidReceiveTapEventForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedVideoAdShouldRewardForAdUnitID:(NSString *)adUnitID reward:(MPRewardedVideoReward *)reward {
    NSLog(@"%s: %@, reward: %@ %@", __FUNCTION__, adUnitID, reward.currencyType, reward.amount);
}

@end
