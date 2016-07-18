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
            UIApplication.sharedApplication().openURL(url)
                        }
    }

    
    var engine = StandardEngine.sharedInstance
    
    
    @IBOutlet weak var Rows: UITextField!
    
    //UISTepper increments rows by 10 when clicked
    @IBAction func IncrementRows(sender: AnyObject) {
        engine.rows += 10
        Rows.text = engine.rows.description
    }
    
    
    
    @IBOutlet weak var Columns: UITextField!

    //UISTepper increments columns by 10 when clicked
    @IBAction func IncrementC(sender: AnyObject) {
        engine.cols += 10
        Columns.text = engine.cols.description
        
    }
    
    //var standardengine : StandardEngine!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        engine = StandardEngine.sharedInstance

    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

