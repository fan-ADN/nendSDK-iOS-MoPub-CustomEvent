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
    
    self.bannerView = [[MPAdView alloc] initWithAdUnitId:kAdUnitId size:MOPUB_BANNER_SIZE];
    self.bannerView.delegate = self;
    self.bannerView.frame = CGRectMake((self.view.bounds.size.width - MOPUB_BANNER_SIZE.width) / 2,
                                       self.view.bounds.size.height - MOPUB_BANNER_SIZE.height,
                                       MOPUB_BANNER_SIZE.width, MOPUB_BANNER_SIZE.height);
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

- (void)adViewDidLoadAd:(MPAdView *)view {
    NSLog(@"%s: %@", __FUNCTION__, view);
}

- (void)adViewDidFailToLoadAd:(MPAdView *)view {
    NSLog(@"%s: %@", __FUNCTION__, view);
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
