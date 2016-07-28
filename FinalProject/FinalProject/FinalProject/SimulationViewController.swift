//
//  SecondViewController.swift
//  FinalProject
//
//  Created by JiangYuan on 7/24/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController, EngineDelegate {
    
    @IBOutlet weak var gridview: GridView!
    
    var engine = StandardEngine.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        engine.delegate = self
        gridview.setNeedsDisplay()
    }
    
    
    @IBAction func stepHit(sender: AnyObject) {
        engine.step()
        
    }

    @IBAction func LinkIcon(sender: AnyObject) {
        if let url = NSURL(string: "https://icons8.com") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    func engineDidUpdate(withGrid: GridProtocol) {
        gridview.setNeedsDisplay()
    }

}

