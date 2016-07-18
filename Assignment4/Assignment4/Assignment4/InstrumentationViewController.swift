//
//  FirstViewController.swift
//  Assignment4
//
//  Created by JiangYuan on 7/13/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController, EngineDelegate {
    
    var engine : EngineProtocol!
    
    func engineDidUpdate(withGrid: [[CellState]]) {
        Rows.text = String(withGrid.count)
        Columns.text = String(withGrid[0].count)
    }
    
    
    //comment on the source of icon
    @IBAction func HitButton(sender: AnyObject) {
            if let url = NSURL(string: "https://icons8.com") {
            UIApplication.sharedApplication().openURL(url)
                        }
    }
    
    @IBAction func IncrementC(sender: AnyObject) {
        engine.cols += 10
        
    }

    
    
    @IBOutlet weak var Rows: UITextField!
    
    @IBAction func IncrementR(sender: AnyObject) {
        engine.rows += 10
        
        
    }
    
    @IBOutlet weak var Columns: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        StandardEngine.sharedInstance.rows = 20
        engine = StandardEngine.sharedInstance


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

