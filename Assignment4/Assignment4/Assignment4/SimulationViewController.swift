//
//  SecondViewController.swift
//  Assignment4
//
//  Created by JiangYuan on 7/13/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController {

    @IBAction func buttonHit(sender: AnyObject) {
        if let url = NSURL(string: "https://icons8.com") {
            UIApplication.sharedApplication().openURL(url)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

