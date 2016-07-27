//
//  SecondViewController.swift
//  FinalProject
//
//  Created by JiangYuan on 7/24/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController, EngineDelegate {

    @IBAction func LinkIcon(sender: AnyObject) {
        if let url = NSURL(string: "https://icons8.com") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    var engine = StandardEngine.sharedInstance
    
    @IBOutlet weak var gridview: GridView!

    
    func engineDidUpdate(withGrid: GridProtocol) {
        gridview.rows = Int(withGrid.rows)
        gridview.cols = Int(withGrid.cols)
        gridview.setNeedsDisplay()
    }
    
    

    @IBAction func stepHit(sender: AnyObject) {
        engine.step()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        engine.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

