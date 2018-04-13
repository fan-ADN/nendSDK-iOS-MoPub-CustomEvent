//
//  InterstitialVideoViewController.m
//  NendMoPubCustomEventSample
//
//  Copyright © 2018年 F@N Communications. All rights reserved.
//

#import "InterstitialVideoViewController.h"
#import "MPInterstitialAdController.h"
#import "NendInstanceMediationSettings.h"

static NSString *const kAdUnitId = @"your ad unit id";

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

- (void)interstitialDidFailToLoadAd:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}
- (void)interstitialWillAppear:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}

- (void)interstitialDidAppear:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}

- (void)interstitialWillDisappear:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}

- (void)interstitialDidDisappear:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}

- (void)interstitialDidExpire:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}

- (void)interstitialDidReceiveTapEvent:(MPInterstitialAdController *)interstitial {
    NSLog(@"%s: %@", __FUNCTION__, interstitial);
}

@end
