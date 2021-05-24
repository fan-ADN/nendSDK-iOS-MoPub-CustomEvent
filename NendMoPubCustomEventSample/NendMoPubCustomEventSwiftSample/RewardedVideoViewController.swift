//
//  RewardedVideoViewController.swift
//  NendMoPubCustomEventSwiftSample
//
//  Copyright © 2018年 FAN Communications. All rights reserved.
//

import UIKit

class RewardedVideoViewController: UIViewController {

    let adUnitId = "your_ad_unit_id"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MPRewardedAds.setDelegate(self, forAdUnitId: adUnitId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        MPRewardedAds.remove(self)
    }

    @IBAction func loadAd(_ sender: Any) {
        let mediationSettings = NendInstanceMediationSettings()
        mediationSettings.userId = "your_user_id"
        mediationSettings.setAge(18)
        mediationSettings.setGender(NendMediatoinGender.adGenderMale)
        mediationSettings.setBirthdayWithYear(2000, month: 1, day: 1 )
        mediationSettings.addCustomIntegerValue(123, forKey: "integerKey")
        mediationSettings.addCustomDoubleValue(123.45, forKey: "doubleKey")
        mediationSettings.addCustomStringValue("test", forKey: "stringKey")
        mediationSettings.addCustomBoolValue(true, forKey: "boolKey")
        MPRewardedAds.loadRewardedAd(withAdUnitID: adUnitId, withMediationSettings: [mediationSettings])
    }
    
    @IBAction func showAd(_ sender: Any) {
        if MPRewardedAds.hasAdAvailable(forAdUnitID: adUnitId) {
            MPRewardedAds.presentRewardedAd(forAdUnitID: adUnitId, from: self, with: nil)
        }
    }

}

extension RewardedVideoViewController: MPRewardedAdsDelegate {
    func rewardedAdDidLoad(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    func rewardedAdDidFailToLoad(forAdUnitID adUnitID: String!, error: Error!) {
        print("\(#function) error: \(String(describing: error))")
    }
    
    func rewardedAdDidFailToShow(forAdUnitID adUnitID: String!, error: Error!) {
        print("\(#function) error: \(String(describing: error))")
    }
    
    func rewardedAdWillPresent(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    func rewardedAdDidPresent(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    func rewardedAdWillDismiss(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    func rewardedAdDidDismiss(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    func rewardedAdWillLeaveApplication(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    func rewardedAdDidReceiveTapEvent(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
    
    func rewardedAdShouldReward(forAdUnitID adUnitID: String!, reward: MPReward!) {
        print("\(#function) \(String(describing: reward.currencyType)) : \(String(describing: reward.amount))")
    }
    
    func rewardedAdDidExpire(forAdUnitID adUnitID: String!) {
        print("\(#function) \(String(describing: adUnitID))")
    }
}
