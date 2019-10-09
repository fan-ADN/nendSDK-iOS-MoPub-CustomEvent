//
//  BannerViewController.swift
//  NendMoPubCustomEventSwiftSample
//
//  Copyright © 2018年 F@N Communications. All rights reserved.
//

import UIKit

class BannerViewController: UIViewController {

    let adUnitId = "your ad unit id"
    var adView: MPAdView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.adView = MPAdView(adUnitId: self.adUnitId)
        self.adView.delegate = self
        let supportedAdSize = CGSize(width: 320.0, height: 50.0)
        self.adView.frame = CGRect(x: (self.view.frame.size.width - supportedAdSize.width)/2,
                                   y: self.view.frame.size.height - supportedAdSize.height,
                                   width: supportedAdSize.width,
                                   height: supportedAdSize.height)
        self.view.addSubview(self.adView)
        self.adView.loadAd()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension BannerViewController: MPAdViewDelegate {
    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }
    
    func adViewDidLoadAd(_ view: MPAdView!, adSize: CGSize) {
        print("\(#function), adSize: \(String(describing: adSize))")
    }
    
    func adView(_ view: MPAdView!, didFailToLoadAdWithError error: Error!) {
        print("\(#function), error: \(String(describing: error))")
    }
    
    func willLeaveApplication(fromAd view: MPAdView!) {
        print(#function)
    }
    
    func didDismissModalView(forAd view: MPAdView!) {
        print(#function)
    }
    
    func willPresentModalView(forAd view: MPAdView!) {
        print(#function)
    }
}
