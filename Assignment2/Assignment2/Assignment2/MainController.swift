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
        
        var beforeAlive = 0
        var before = [[Bool]](count:10, repeatedValue: Array(count:10, repeatedValue:false))
        
        for Col in 0...9
        {
            for Row in 0...9
            {
                if arc4random_uniform(3) == 1
                {
                    before[Col][Row] = true
                    beforeAlive += 1
                }
                
            }
        }
        
        ShowText.text = "The number of alive cells before is: \(beforeAlive)"
        
        

        var after = [[Bool]](count:10, repeatedValue: Array(count:10, repeatedValue:false))
        var afterAlive = 0
        
        for Co in 0...9
        {
            for Ro in 0...9
            {
                switch before[Co][Ro]{
                case true:
                    if Co+1<=9
                    {
                        if before[Co+1][Ro] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co-9][Ro] == true
                        {
                            afterAlive += 1
                        }
                    }//+o
                    
                    if Ro+1<=9
                    {
                        if before[Co][Ro+1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co][Ro-9] == true
                        {
                            afterAlive += 1
                        }
                        
                    }//o+
                    
                    if Co+1<=9
                    {
                        if Ro+1<=9
                        {
                            if before[Co+1][Ro+1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co+1][Ro-9] == true
                            {
                                afterAlive += 1
                            }
                        }
                    }
                    else
                    {
                        if Ro+1<=9
                        {
                            if before[Co-9][Ro+1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co-9][Ro-9] == true
                            {
                                afterAlive += 1
                            }
                        }
                    }//++
                    
                    
                    
                    if Co-1>=0
                    {
                        
                        if before[Co-1][Ro] == true
                        {
                            afterAlive += 1
                        }//-o
                        
                        if Ro+1<=9
                        {
                            if before[Co-1][Ro+1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co-1][Ro-9] == true
                            {
                                afterAlive += 1
                            }
                        }//-+
                        
                        
                        if Ro-1>=0
                        {
                            if before[Co-1][Ro-1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co-1][Ro+9] == true
                            {
                                afterAlive += 1
                            }
                        }//--
                    }
                    else //Co-1<0
                    {
                        if before[Co+9][Ro] == true
                        {
                            afterAlive += 1
                        }//-o
                        
                        if Ro+1<=9
                        {
                            if before[Co+9][Ro+1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co+1][Ro-9] == true
                            {
                                afterAlive += 1
                            }
                        }//-+
                        
                        if Ro-1>=0
                        {
                            if before[Co+9][Ro-1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co+9][Ro+9] == true
                            {
                                afterAlive += 1
                            }
                        }//--
                    }
                    
                    
                    
                    
                    if Ro-1>=0
                    {
                        
                        if before[Co][Ro-1] == true
                        {
                            afterAlive += 1
                        }//0-
                        
                        if Co+1<=9
                        {
                            if before[Co+1][Ro-1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co-9][Ro-1] == true
                            {
                                afterAlive += 1
                            }
                        }//+-
                        
                    }
                    else //Ro-1<0
                    {
                        if before[Co][Ro+9] == true
                        {
                            afterAlive += 1
                        }//0-
                        
                        if Co+1<=9
                        {
                            if before[Co+1][Ro+9] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co-9][Ro+9] == true
                            {
                                afterAlive += 1
                            }
                        }//+-
                        
                    }
                    
                    
                    if afterAlive == 2
                    {
                        after[Co][Ro] = true
                    }
                    else
                    {
                        if afterAlive == 3{
                            after[Co][Ro] = true
                        }
                        
                    }
                    
                case false:
                    
                    if Co+1<=9
                    {
                        if before[Co+1][Ro] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co-9][Ro] == true
                        {
                            afterAlive += 1
                        }
                    }//+o
                    
                    if Ro+1<=9
                    {
                        if before[Co][Ro+1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co][Ro-9] == true
                        {
                            afterAlive += 1
                        }
                        
                    }//o+
                    
                    if Co+1<=9
                    {
                        if Ro+1<=9
                        {
                            if before[Co+1][Ro+1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co+1][Ro-9] == true
                            {
                                afterAlive += 1
                            }
                        }
                    }
                    else
                    {
                        if Ro+1<=9
                        {
                            if before[Co-9][Ro+1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co-9][Ro-9] == true
                            {
                                afterAlive += 1
                            }
                        }
                    }//++
                    
                    
                    
                    if Co-1>=0
                    {
                        
                        if before[Co-1][Ro] == true
                        {
                            afterAlive += 1
                        }//-o
                        
                        if Ro+1<=9
                        {
                            if before[Co-1][Ro+1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co-1][Ro-9] == true
                            {
                                afterAlive += 1
                            }
                        }//-+
                        
                        
                        if Ro-1>=0
                        {
                            if before[Co-1][Ro-1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co-1][Ro+9] == true
                            {
                                afterAlive += 1
                            }
                        }//--
                    }
                    else //Co-1<0
                    {
                        if before[Co+9][Ro] == true
                        {
                            afterAlive += 1
                        }//-o
                        
                        if Ro+1<=9
                        {
                            if before[Co+9][Ro+1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co+1][Ro-9] == true
                            {
                                afterAlive += 1
                            }
                        }//-+
                        
                        if Ro-1>=0
                        {
                            if before[Co+9][Ro-1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co+9][Ro+9] == true
                            {
                                afterAlive += 1
                            }
                        }//--
                    }
                    
                    
                    
                    
                    if Ro-1>=0
                    {
                        
                        if before[Co][Ro-1] == true
                        {
                            afterAlive += 1
                        }//0-
                        
                        if Co+1<=9
                        {
                            if before[Co+1][Ro-1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co-9][Ro-1] == true
                            {
                                afterAlive += 1
                            }
                        }//+-
                        
                    }
                    else //Ro-1<0
                    {
                        if before[Co][Ro+9] == true
                        {
                            afterAlive += 1
                        }//0-
                        
                        if Co+1<=9
                        {
                            if before[Co+1][Ro+9] == true
                            {
                                afterAlive += 1
                            }
                        }
                        else
                        {
                            if before[Co-9][Ro+9] == true
                            {
                                afterAlive += 1
                            }
                        }//+-
                        
                    }
                    
                    if afterAlive == 3
                    {
                        after[Co][Ro] = true
                    }
                    
                }
            }
        }
        
        var counts = 0
        for Colu in 0...9
        {
            for Rows in 0...9
            {
                if after[Colu][Rows] == true
                {
                    counts += 1
                    
                }
                
            }
        }
        
        ShowText.text = "The number of alive cells after is: \(counts)"
        
        
        
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

