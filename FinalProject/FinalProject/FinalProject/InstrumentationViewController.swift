//
//  FirstViewController.swift
//  FinalProject
//
//  Created by JiangYuan on 7/24/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController {
    
    //comment on the source of Icon
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
        if !mySwitch.on {
            mySwitch.on = true
        }
        
    }

    
    @IBOutlet weak var mySwitch: UISwitch!
    
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
    
    @IBAction func rowStepperChanged(sender: UIStepper) {
        let numRows = Int(sender.value)
        engine.rows = numRows
        Rows.text = engine.rows.description
    }
    
    @IBOutlet weak var Columns: UITextField!
    
    @IBAction func colStepperChanged(sender: UIStepper) {
        let numCols = Int(sender.value)
        engine.cols = numCols
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

