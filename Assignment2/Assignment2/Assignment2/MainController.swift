//
//  MainController.swift
//  Assignment2
//
//  Created by JiangYuan on 7/1/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    



}

class Problem2ViewController: UIViewController {
    @IBOutlet weak var ShowText: UITextView!
    @IBAction func Hit(sender: AnyObject) {
         ShowText.text = "Hi there!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Problem 2"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    
}

class Problem3ViewController: UIViewController {
    
    @IBOutlet weak var myText: UITextView!

    @IBAction func myButton(sender: AnyObject) {
        myText.text = "Hi there!"
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Problem 3"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    
}

class Problem4ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func hitButton(sender: AnyObject) {
        textView.text = "Hi there!"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Problem 4"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}