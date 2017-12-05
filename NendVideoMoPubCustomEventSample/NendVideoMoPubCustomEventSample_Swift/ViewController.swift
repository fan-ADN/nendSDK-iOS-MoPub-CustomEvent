//
//  ViewController.swift
//  NendVideoMoPubCustomEventSample_Swift
//
//  Copyright © 2017年 F@N Communications. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let adUnitId = "your ad unit id"

    override func viewDidLoad() {
        super.viewDidLoad()
        MoPub.sharedInstance().initializeRewardedVideo(withGlobalMediationSettings: [], delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func loadAd(_ sender: Any) {
        let settings = NendInstanceMediationSettings()
        settings.userId = "your user id"
        MPRewardedVideo.loadAd(withAdUnitID: adUnitId, withMediationSettings: [settings])
    }
    
    @IBAction func showAd(_ sender: Any) {
        if MPRewardedVideo.hasAdAvailable(forAdUnitID: adUnitId) {
            MPRewardedVideo.presentAd(forAdUnitID: adUnitId, from: self, with: nil)
        }
    }
}

extension UIViewController: MPRewardedVideoDelegate {
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
