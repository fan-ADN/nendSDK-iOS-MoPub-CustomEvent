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
        
        self.adView = MPAdView(adUnitId: self.adUnitId, size: MOPUB_BANNER_SIZE)
        self.adView.delegate = self
        self.adView.frame = CGRect(x: (self.view.frame.size.width - MOPUB_BANNER_SIZE.width)/2,
                                   y: self.view.frame.size.height - MOPUB_BANNER_SIZE.height,
                                   width: MOPUB_BANNER_SIZE.width,
                                   height: MOPUB_BANNER_SIZE.height)
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
    
    func adViewDidLoadAd(_ view: MPAdView!) {
        print(#function)
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
