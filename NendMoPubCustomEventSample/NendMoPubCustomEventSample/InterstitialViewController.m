//
//  InterstitialViewController.m
//  NendMoPubCustomEventSample
//
//  Copyright © 2018年 FAN Communications. All rights reserved.
//

#import "InterstitialViewController.h"
#import "MPInterstitialAdController.h"
#import "NendInstanceMediationSettings.h"

static NSString *const kAdUnitId = @"your ad unit id";

@interface InterstitialViewController () <MPInterstitialAdControllerDelegate>
@property (nonatomic) MPInterstitialAdController *interstitial;
@end

@implementation InterstitialViewController

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
