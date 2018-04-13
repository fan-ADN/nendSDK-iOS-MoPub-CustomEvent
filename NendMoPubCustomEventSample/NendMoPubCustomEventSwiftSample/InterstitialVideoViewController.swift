//
//  InterstitialVideoViewController.swift
//  NendMoPubCustomEventSwiftSample
//
//  Copyright © 2018年 F@N Communications. All rights reserved.
//

import UIKit

class InterstitialVideoViewController: UIViewController {

    let adUnitId = "your ad unit id"
    var interstitial: MPInterstitialAdController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        self.interstitial = MPInterstitialAdController.init(forAdUnitId: self.adUnitId)
        self.interstitial.delegate = self
        self.interstitial.loadAd()
    }
    
    @IBAction func showAd(_ sender: Any) {
        if self.interstitial.ready {
            self.interstitial.show(from: self)
        }
    }
}

extension InterstitialVideoViewController: MPInterstitialAdControllerDelegate {
    
    func interstitialDidLoadAd(_ interstitial: MPInterstitialAdController!) {
        print("\(#function) \(interstitial)")
    }
    
    func interstitialDidFail(toLoadAd interstitial: MPInterstitialAdController!) {
        print("\(#function) \(interstitial)")
    }
    
    func interstitialWillAppear(_ interstitial: MPInterstitialAdController!) {
        print("\(#function) \(interstitial)")
    }
    
    func interstitialDidAppear(_ interstitial: MPInterstitialAdController!) {
        print("\(#function) \(interstitial)")
    }
    
    func interstitialWillDisappear(_ interstitial: MPInterstitialAdController!) {
        print("\(#function) \(interstitial)")
    }
    
    func interstitialDidDisappear(_ interstitial: MPInterstitialAdController!) {
        print("\(#function) \(interstitial)")
    }
    func interstitialDidReceiveTapEvent(_ interstitial: MPInterstitialAdController!) {
        print("\(#function) \(interstitial)")
    }
}
