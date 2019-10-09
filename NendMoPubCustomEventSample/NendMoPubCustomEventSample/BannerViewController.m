//
//  BannerViewController.m
//  NendMoPubCustomEventSample
//
//  Copyright © 2018年 F@N Communications. All rights reserved.
//

#import "BannerViewController.h"
#import "MPAdView.h"

static NSString *const kAdUnitId = @"your ad unit id";

@interface BannerViewController () <MPAdViewDelegate>
@property (nonatomic) MPAdView *bannerView;
@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bannerView = [[MPAdView alloc] initWithAdUnitId:kAdUnitId];
    self.bannerView.delegate = self;
    CGSize supportedAdSize = CGSizeMake(320.0f, 50.0f);
    self.bannerView.frame = CGRectMake((self.view.bounds.size.width - supportedAdSize.width) / 2,
                                       self.view.bounds.size.height - supportedAdSize.height,
                                       supportedAdSize.width, supportedAdSize.height);
    [self.view addSubview:self.bannerView];
    [self.bannerView loadAd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MPAdViewDelegate

- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}

- (void)adViewDidLoadAd:(MPAdView *)view adSize:(CGSize)adSize {
    NSLog(@"%s: %@, adSize: %@", __FUNCTION__, view, NSStringFromCGSize(adSize));
}

- (void)adView:(MPAdView *)view didFailToLoadAdWithError:(NSError *)error {
    NSLog(@"%s: %@, %@", __FUNCTION__, view, error.description);
}

- (void)willPresentModalViewForAd:(MPAdView *)view {
    NSLog(@"%s: %@", __FUNCTION__, view);
}

- (void)didDismissModalViewForAd:(MPAdView *)view {
    NSLog(@"%s: %@", __FUNCTION__, view);
}

- (void)willLeaveApplicationFromAd:(MPAdView *)view {
    NSLog(@"%s: %@", __FUNCTION__, view);
}

@end
