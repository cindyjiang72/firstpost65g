//
//  ConfigurationEditorViewController.swift
//  FinalProject
//
//  Created by JiangYuan on 7/24/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

class ConfigurationEditorViewController: UIViewController {
    
    @IBOutlet weak var ConfigurationGridView: GridView!
    @IBOutlet weak var nameTextField: UITextField!
 

    var name:String?
    var points: [(Int, Int)]?
    
    var commit: (String -> Void)?
    var commitpoints: ([(Int, Int)] -> Void)?

    @IBAction func saveClicked(sender: AnyObject) {
        
        guard let newText = nameTextField.text, commit = commit
            else { return }

        
        guard let newcontents = points , commitpoints = commitpoints
            else { return }
        
        
        commit(newText)
        
        commitpoints(newcontents)
        
        navigationController!.popViewControllerAnimated(true)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = name
        
        
        var pp = [(Int, Int)]()
        for i in 0..<ConfigurationGridView.rows {
            for j in 0..<ConfigurationGridView.cols {
                //if ConfigurationGridView.grid(i,j) == .Alive {
                pp.append((i,j))
                //}
            }
        }
        points = pp
        
        
        
     
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
       
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}