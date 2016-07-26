//
//  FirstViewController.swift
//  Assignment4
//
//  Created by JiangYuan on 7/13/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController{
    
    //comment on the source of icon
    @IBAction func HitButton(sender: AnyObject) {
            if let url = NSURL(string: "https://icons8.com") {
            UIApplication.sharedApplication().openURL(url)}
    }

    
    
    var engine = StandardEngine.sharedInstance
    
    @IBOutlet weak var refreshRate: UISlider!
    
    
    
    @IBAction func changeSlider(sender: UISlider!) {
//        if let text = sender.text,
//            interval = Double(text)  {
//            example.refreshInterval = interval
//        }
//        else  {
//            example.refreshInterval = 0
//        }
        print(refreshRate)
        engine.refreshRate = Double(refreshRate.value)
        
    }
    
    
    
    @IBAction func refreshSwitch(uiSwitch: UISwitch) {
        
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
    
    
    //UISTepper increments rows by 10 when clicked
    @IBAction func IncrementRows(sender: AnyObject) {
        engine.rows += 10
        Rows.text = engine.rows.description
        //engine.rows = UInt(Rows.text!)!
    }
    
    
    
    
    
    @IBOutlet weak var Columns: UITextField!

    //UISTepper increments columns by 10 when clicked
    @IBAction func IncrementC(sender: AnyObject) {
        engine.cols += 10
        Columns.text = engine.cols.description
        //engine.cols = UInt(Columns.text!)!
    }


    
    
    
    
    
    
    @IBAction func RowsEntered(sender: AnyObject) {
        engine.rows = UInt(Rows.text!)!
    }
    
    @IBAction func ColsEntered(sender: AnyObject) {
        engine.cols = UInt(Columns.text!)!
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    


}

