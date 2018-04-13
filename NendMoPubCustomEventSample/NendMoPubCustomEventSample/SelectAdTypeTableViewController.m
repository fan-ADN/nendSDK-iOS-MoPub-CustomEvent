//
//  SelectAdTypeTableViewController.m
//  NendMoPubCustomEventSample
//
//  Copyright © 2018年 F@N Communications. All rights reserved.
//

#import "SelectAdTypeTableViewController.h"

@interface SelectAdTypeTableViewController ()
@property (nonatomic) NSArray *adTypes;
@property (nonatomic) NSArray *segueNames;
@end

@implementation SelectAdTypeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CustomEventSample";
    
    self.adTypes = @[@"Banner", @"Interstitial", @"Rewarded Video", @"Interstitial Video"];
    self.segueNames = @[@"ShowBannerType",  @"ShowInterstitial", @"ShowRewardedVideo", @"ShowInterstitialVideo"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.adTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.adTypes[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:self.segueNames[indexPath.row] sender:indexPath];
}

@end
