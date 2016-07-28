//
//  File.swift
//  FinalProject
//
//  Created by JiangYuan on 7/24/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController, EngineDelegate {
    
    @IBOutlet weak var emptyTextField: UITextField!
    @IBOutlet weak var bornTextField: UITextField!
    @IBOutlet weak var aliveTextField: UITextField!
    @IBOutlet weak var deadTextField: UITextField!
    
    @IBAction func IconLink(sender: AnyObject) {
        if let url = NSURL(string: "https://icons8.com") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        StandardEngine.sharedInstance.delegate = self
        setupTextFields(StandardEngine.sharedInstance.grid)
    }
    
    func engineDidUpdate(withGrid: GridProtocol) {
        setupTextFields(withGrid)
    }
    
    func setupTextFields(grid: GridProtocol) {
        emptyTextField.text = grid.empty.description
        bornTextField.text = grid.born.description
        aliveTextField.text = grid.alive.description
        deadTextField.text = grid.dead.description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
