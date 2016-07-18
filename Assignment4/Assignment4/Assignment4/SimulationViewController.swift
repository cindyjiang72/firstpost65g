//
//  SecondViewController.swift
//  Assignment4
//
//  Created by JiangYuan on 7/13/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController, EngineDelegate {

    //comment on the source of icon
    @IBAction func buttonHit(sender: AnyObject) {
        if let url = NSURL(string: "https://icons8.com") {
                        UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func StepHit(sender: AnyObject) {
        //StandardEngine.step()
        
    }

    
    
    
    func engineDidUpdate(withGrid: [[CellState]]) {
        
    }

    
    var engine : EngineProtocol!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        StandardEngine.sharedInstance.rows = 20
        StandardEngine.sharedInstance.cols = 20
        
        //engine.delegate = self

        engine = StandardEngine.sharedInstance
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SimulationViewController.gotNotification(_:)), name: "TestName", object: nil)
            }
    
    
    @objc func gotNotification(notification : NSNotification) {
        if let userInfo = notification.userInfo {
            print("Did receive notification from \(userInfo["Notification"]) in observer")
        }
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    
    


}

