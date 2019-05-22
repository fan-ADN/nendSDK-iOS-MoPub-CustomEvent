//
//  SelectAdTypeTableViewController.swift
//  NendMoPubCustomEventSwiftSample
//
//  Copyright © 2018年 F@N Communications. All rights reserved.
//

import UIKit

class SelectAdTypeTableViewController: UITableViewController {
    
    let items = [
        (name: "Banner", segue: "ShowBannerType"),
        (name: "Interstitial", segue: "ShowInterstitial"),
        (name: "Rewarded Video", segue: "ShowRewardedVideo"),
        (name: "Interstitial Video", segue: "ShowInterstitialVideo")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "CustomEventSample"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel!.text = self.items[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: self.items[indexPath.row].segue, sender: nil)
    }

}
