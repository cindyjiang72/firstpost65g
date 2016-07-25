//
//  ViewController.swift
//  Lecture10
//
//  Created by JiangYuan on 7/25/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var textView: UITextView!
    
    
    @IBAction func Fetch(sender: AnyObject) {
        let url = NSURL(string: )
        let fetcher = Fetcher()
        
        fetcher.requestJSON(url) { (json, message) in
            let op = NSBlockOperation {
                if let json = json {
                    self.textView.text = json.description
                }
                else if let message = message {
                    self.textView.text = message
                }
                else {
                    self.textView.text = "No data and no message"
                }
            }
         NSOperation.mainQueue.addOperation(op)
            
        }
    }
    


}

