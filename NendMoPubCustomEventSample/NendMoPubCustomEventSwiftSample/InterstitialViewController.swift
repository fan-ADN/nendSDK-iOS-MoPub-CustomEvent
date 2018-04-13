//
//  InterstitialViewController.swift
//  NendMoPubCustomEventSwiftSample
//
//  Copyright © 2018年 F@N Communications. All rights reserved.
//

import UIKit

class InterstitialViewController: UIViewController {

    let adUnitId = "your ad unit id"
    var interstitial: MPInterstitialAdController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadAd(_ sender: Any) {
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

extension InterstitialViewController: MPInterstitialAdControllerDelegate {
    
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