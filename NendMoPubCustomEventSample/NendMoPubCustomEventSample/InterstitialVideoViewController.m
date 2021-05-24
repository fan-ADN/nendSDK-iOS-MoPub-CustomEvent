//
//  InterstitialVideoViewController.m
//  NendMoPubCustomEventSample
//
//  Copyright © 2018年 FAN Communications. All rights reserved.
//

#import "InterstitialVideoViewController.h"
#import "MPInterstitialAdController.h"
#import "NendInstanceMediationSettings.h"
#import "MoPub.h"

static NSString *const kAdUnitId = @"your_ad_unit_id";

@interface InterstitialVideoViewController () <MPInterstitialAdControllerDelegate>
@property (nonatomic) MPInterstitialAdController *interstitial;
@end

@implementation InterstitialVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    if (self.interstitial) {
        [MPInterstitialAdController removeSharedInterstitialAdController:self.interstitial];
        self.interstitial = nil;
    }
}

- (IBAction)load:(id)sender {
    
    self.interstitial = [MPInterstitialAdController interstitialAdControllerForAdUnitId:kAdUnitId];
    self.interstitial.delegate = self;
    
    NendInstanceMediationSettings *mediationSettings = [NendInstanceMediationSettings new];
    mediationSettings.userId = @"testUser";
    [mediationSettings setAge:18];
    [mediationSettings setGender:NendAdGenderMale];
    [mediationSettings setBirthdayWithYear:2000 month:1 day:1];
    [mediationSettings addCustomIntegerValue:123 forKey:@"integerKey"];
    [mediationSettings addCustomDoubleValue:123.45 forKey:@"doubleKey"];
    [mediationSettings addCustomStringValue:@"test" forKey:@"stringKey"];
    [mediationSettings addCustomBoolValue:YES forKey:@"boolKey"];
    
    [self.interstitial loadAd];
}

- (IBAction)show:(id)sender {
    if (self.interstitial.ready) {
        [self.interstitial showFromViewController:self];
    }
}

#pragma mark - MPInterstitialAdControllerDelegate
- (void)interstitialDidLoadAd:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}

- (void)interstitialDidFailToLoadAd:(MPInterstitialAdController *)interstitial withError:(NSError *)error {
    NSLog(@"%s: %@, %@", __FUNCTION__, interstitial, error.description);
}

- (void)interstitialWillPresent:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}

- (void)interstitialDidPresent:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}

- (void)interstitialWillDismiss:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}

- (void)interstitialDidDismiss:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}

- (void)interstitialDidExpire:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}

- (void)interstitialDidReceiveTapEvent:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}

@end
