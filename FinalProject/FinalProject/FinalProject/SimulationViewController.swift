//
//  SecondViewController.swift
//  FinalProject
//
//  Created by JiangYuan on 7/24/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController, EngineDelegate {
    
    //comment on the source of Icon
    @IBAction func LinkIcon(sender: AnyObject) {
        if let url = NSURL(string: "https://icons8.com") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var gridview: GridView!
    
    var engine = StandardEngine.sharedInstance
    
    func engineDidUpdate(withGrid: GridProtocol) {
        gridview.setNeedsDisplay()
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        engine.delegate = self
        gridview.setNeedsDisplay()
    }
    
    
    @IBAction func stepHit(sender: AnyObject) {
        engine.step()
    }

    
    @IBAction func resetHit(sender: AnyObject) {
        engine.grid = Grid(engine.rows, engine.cols) { _,_ in .Empty }
        gridview.setNeedsDisplay()
    }
    

}

