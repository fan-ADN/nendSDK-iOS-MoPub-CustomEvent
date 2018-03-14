//
//  RewardedVideoViewController.m
//  NendMoPubCustomEventSample
//
//  Copyright © 2018年 F@N Communications. All rights reserved.
//

#import "RewardedVideoViewController.h"
#import "MoPub.h"
#import "MPRewardedVideo.h"
#import "NendInstanceMediationSettings.h"

static NSString *const kAdUnitId = @"your ad unit id";

@interface RewardedVideoViewController () <MPRewardedVideoDelegate>

@end

@implementation RewardedVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[MoPub sharedInstance] initializeRewardedVideoWithGlobalMediationSettings:nil delegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadAd:(id)sender {
    NendInstanceMediationSettings *mediationSettings = [NendInstanceMediationSettings new];
    mediationSettings.userId = @"your-user-id";
    [mediationSettings setAge:18];
    [mediationSettings setGender:NendAdGenderMale];
    [mediationSettings setBirthdayWithYear:2000 month:1 day:1];
    [mediationSettings addCustomIntegerValue:123 forKey:@"integerKey"];
    [mediationSettings addCustomDoubleValue:123.45 forKey:@"doubleKey"];
    [mediationSettings addCustomStringValue:@"test" forKey:@"stringKey"];
    [mediationSettings addCustomBoolValue:YES forKey:@"boolKey"];
    [MPRewardedVideo loadRewardedVideoAdWithAdUnitID:kAdUnitId withMediationSettings:@[mediationSettings]];
}

- (IBAction)showAd:(id)sender {
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
- (void)rewardedVideoAdDidExpireForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}

@end
