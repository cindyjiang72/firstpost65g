//
//  FirstViewController.swift
//  Assignment4
//
//  Created by JiangYuan on 7/13/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController, EngineDelegate {
    
    //comment on the source of icon
    @IBAction func HitButton(sender: AnyObject) {
            if let url = NSURL(string: "https://icons8.com") {
            UIApplication.sharedApplication().openURL(url)
                        }
    }
    
    
    var engine : EngineProtocol!
    
    //override engineDidUpdate Func
    func engineDidUpdate(withGrid: [[CellState]]) {
        Rows.text = String(withGrid.count)
        Columns.text = String(withGrid[0].count)
    }
    
    
    
    @IBOutlet weak var Rows: UITextField!
    
    //UISTepper increments rows by 10 when clicked
    @IBAction func IncrementR(sender: AnyObject) {
        engine.rows += 10
        
    }
    
    
    
    @IBOutlet weak var Columns: UITextField!

    //UISTepper increments columns by 10 when clicked
    @IBAction func IncrementC(sender: AnyObject) {
        engine.cols += 10
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        StandardEngine.sharedInstance.rows = 20
        StandardEngine.sharedInstance.rows = 20
        engine = StandardEngine.sharedInstance

    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

