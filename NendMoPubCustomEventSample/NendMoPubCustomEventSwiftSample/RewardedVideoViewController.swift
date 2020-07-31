//
//  RewardedVideoViewController.swift
//  NendMoPubCustomEventSwiftSample
//
//  Copyright © 2018年 FAN Communications. All rights reserved.
//

import UIKit
import CoreLocation

class RewardedVideoViewController: UIViewController {

    let adUnitId = "your ad unit id"
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MPRewardedVideo.setDelegate(self, forAdUnitId: adUnitId)
        
        // If you use location in your app, but would like to disable location passing.
//        MoPub.sharedInstance().locationUpdatesEnabled = false
        
        self.locationManager = CLLocationManager()
        self.locationManager.requestWhenInUseAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        MPRewardedVideo.remove(self)
    }

    @IBAction func loadAd(_ sender: Any) {
        let mediationSettings = NendInstanceMediationSettings()
        mediationSettings.userId = "your user id"
        mediationSettings.setAge(18)
        mediationSettings.setGender(NendMediatoinGender.adGenderMale)
        mediationSettings.setBirthdayWithYear(2000, month: 1, day: 1 )
        mediationSettings.addCustomIntegerValue(123, forKey: "integerKey")
        mediationSettings.addCustomDoubleValue(123.45, forKey: "doubleKey")
        mediationSettings.addCustomStringValue("test", forKey: "stringKey")
        mediationSettings.addCustomBoolValue(true, forKey: "boolKey")
        MPRewardedVideo.loadAd(withAdUnitID: adUnitId, withMediationSettings: [mediationSettings])
    }
    
    @IBAction func showAd(_ sender: Any) {
        if MPRewardedVideo.hasAdAvailable(forAdUnitID: adUnitId) {
            MPRewardedVideo.presentAd(forAdUnitID: adUnitId, from: self, with: nil)
        }
    }

}

extension RewardedVideoViewController: MPRewardedVideoDelegate {
    public func rewardedVideoAdDidLoad(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    public func rewardedVideoAdDidFailToLoad(forAdUnitID adUnitID: String!, error: Error!) {
        print("\(#function) error: \(String(describing: error))")
    }
    
    public func rewardedVideoAdDidFailToPlay(forAdUnitID adUnitID: String!, error: Error!) {
        print("\(#function) error: \(String(describing: error))")
    }
    
    public func rewardedVideoAdWillAppear(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    public func rewardedVideoAdDidAppear(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    public func rewardedVideoAdWillDisappear(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    public func rewardedVideoAdDidDisappear(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    public func rewardedVideoAdWillLeaveApplication(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    public func rewardedVideoAdDidReceiveTapEvent(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    public func rewardedVideoAdShouldReward(forAdUnitID adUnitID: String!, reward: MPRewardedVideoReward!) {
        print("\(#function) \(String(describing: reward.currencyType)) : \(String(describing: reward.amount))")
    }
}
