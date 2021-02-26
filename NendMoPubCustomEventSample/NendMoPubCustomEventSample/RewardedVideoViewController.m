//
//  RewardedVideoViewController.m
//  NendMoPubCustomEventSample
//
//  Copyright © 2018年 FAN Communications. All rights reserved.
//

#import "RewardedVideoViewController.h"
#import "MoPub.h"
#import "MPRewardedAds.h"
#import "NendInstanceMediationSettings.h"
#import <CoreLocation/CoreLocation.h>

static NSString *const kAdUnitId = @"your ad unit id";

@interface RewardedVideoViewController () <MPRewardedAdsDelegate>
@property (nonatomic) CLLocationManager *locationManager;
@end

@implementation RewardedVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MPRewardedAds setDelegate:self forAdUnitId:kAdUnitId];
    
    // If you use location in your app, but would like to disable location passing.
//    [MoPub sharedInstance].locationUpdatesEnabled = NO;
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [MPRewardedAds removeDelegate:self];
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
    [MPRewardedAds loadRewardedAdWithAdUnitID:kAdUnitId withMediationSettings:@[mediationSettings]];
}

- (IBAction)showAd:(id)sender {
    if ([MPRewardedAds hasAdAvailableForAdUnitID:kAdUnitId]) {
        [MPRewardedAds presentRewardedAdForAdUnitID:kAdUnitId fromViewController:self withReward:nil];
    }
}

#pragma mark - MPRewardedAdsDelegate
- (void)rewardedAdDidLoadForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedAdDidFailToLoadForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
    NSLog(@"%s: %@, error: %@", __FUNCTION__, adUnitID, error);
}
- (void)rewardedAdDidFailToShowForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
    NSLog(@"%s: %@, error: %@", __FUNCTION__, adUnitID, error);
}
- (void)rewardedAdWillPresentForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedAdDidPresentForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedAdWillDismissForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedAdDidDismissForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedAdWillLeaveApplicationForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedAdDidReceiveTapEventForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}
- (void)rewardedAdShouldRewardForAdUnitID:(NSString *)adUnitID reward:(MPReward *)reward {
    NSLog(@"%s: %@, reward: %@ %@", __FUNCTION__, adUnitID, reward.currencyType, reward.amount);
}
- (void)rewardedAdDidExpireForAdUnitID:(NSString *)adUnitID {
    NSLog(@"%s: %@", __FUNCTION__, adUnitID);
}

@end
