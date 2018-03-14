//
//  RewardedVideoViewController.swift
//  NendMoPubCustomEventSwiftSample
//
//  Copyright © 2018年 F@N Communications. All rights reserved.
//

import UIKit

class RewardedVideoViewController: UIViewController {

    let adUnitId = "your ad unit id"

    override func viewDidLoad() {
        super.viewDidLoad()

        MoPub.sharedInstance().initializeRewardedVideo(withGlobalMediationSettings: [], delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        print("\(#function) \(adUnitID)")
    }
    
    public func rewardedVideoAdDidFailToLoad(forAdUnitID adUnitID: String!, error: Error!) {
        print("\(#function) error: \(error)")
    }
    
    public func rewardedVideoAdDidFailToPlay(forAdUnitID adUnitID: String!, error: Error!) {
        print("\(#function) error: \(error)")
    }
    
    public func rewardedVideoAdWillAppear(forAdUnitID adUnitID: String!) {
        print("\(#function) \(adUnitID)")
    }
    
    public func rewardedVideoAdDidAppear(forAdUnitID adUnitID: String!) {
        print("\(#function) \(adUnitID)")
    }
    
    public func rewardedVideoAdWillDisappear(forAdUnitID adUnitID: String!) {
        print("\(#function) \(adUnitID)")
    }
    
    public func rewardedVideoAdDidDisappear(forAdUnitID adUnitID: String!) {
        print("\(#function) \(adUnitID)")
    }
    
    public func rewardedVideoAdWillLeaveApplication(forAdUnitID adUnitID: String!) {
        print("\(#function) \(adUnitID)")
    }
    
    public func rewardedVideoAdDidReceiveTapEvent(forAdUnitID adUnitID: String!) {
        print("\(#function) \(adUnitID)")
    }
    
    public func rewardedVideoAdShouldReward(forAdUnitID adUnitID: String!, reward: MPRewardedVideoReward!) {
        print("\(#function) \(reward.currencyType) : \(reward.amount)")
    }
}
