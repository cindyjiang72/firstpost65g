//
//  FirstViewController.swift
//  FinalProject
//
//  Created by JiangYuan on 7/24/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController {

    @IBAction func LinkIcon(sender: AnyObject) {
        if let url = NSURL(string: "https://icons8.com") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    var engine = StandardEngine.sharedInstance
    
    @IBOutlet weak var refreshRate: UISlider!

    @IBAction func SliderChanged(sender: UISlider!) {
        print(refreshRate)
        engine.refreshRate = Double(refreshRate.value)
        
    }
    
    
    @IBAction func refreshSwitch(uiSwitch: UISwitch!) {
        if uiSwitch.on {
            engine.refreshTimer?.invalidate()
            let sel = #selector(StandardEngine.timerDidFire(_:))
            engine.refreshTimer = NSTimer.scheduledTimerWithTimeInterval(1/engine.refreshRate,
                                                                         target: engine,
                                                                         selector: sel,
                                                                         userInfo: nil,
                                                                         repeats: true)
            
            
        }
        else {
            engine.refreshTimer?.invalidate()
        }
    }
    
    @IBOutlet weak var Rows: UITextField!
    
    @IBAction func IncrementR(sender: AnyObject) {
        engine.rows += 10

        Rows.text = engine.rows.description
        
        
    }
    
    @IBOutlet weak var Columns: UITextField!
    
    @IBAction func IncrementC(sender: AnyObject) {
        engine.cols += 10

        Columns.text = engine.cols.description
    }
    
    @IBAction func RowsEntered(sender: AnyObject) {
        engine.rows = Int(Rows.text!)!
    }
    
    
    @IBAction func ColsEntered(sender: AnyObject) {
        engine.cols = Int(Columns.text!)!

    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }


}

