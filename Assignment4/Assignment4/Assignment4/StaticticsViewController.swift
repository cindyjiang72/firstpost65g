//
//  Statictics.swift
//  Assignment4
//
//  Created by JiangYuan on 7/13/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class StaticticsViewController: UIViewController {
    
    //comment on the source of icon
    @IBAction func buttonClicked(sender: AnyObject) {
        if let url = NSURL(string: "https://icons8.com") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //subsribe to notifications published by StandardEngine
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SimulationViewController.gotNotification(_:)), name: "TestName", object: nil)
    }
    
    
    @objc func gotNotification(notification : NSNotification) {
        if let userInfo = notification.userInfo {
            print("Did receive notification from \(userInfo["Notification"]) in observer")
        }

    }
    
    
//    func countLiving() -> Int {
//        
//    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
