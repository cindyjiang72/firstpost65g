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
 
//    var name:String?
//    var commit: (String -> Void)?
//    
//    @IBOutlet weak var nameTextField: UITextField!
//    
//    @IBAction func save(sender: AnyObject) {
//        guard let newText = nameTextField.text, commit = commit
//            else { return }
//        commit(newText)
//        navigationController!.popViewControllerAnimated(true)
//    }

    var name:String?
    var commit: (GridView -> Void)?

//    @IBOutlet weak var nameTextField: UITextField!
//    
//    @IBAction func save(sender: AnyObject) {
//        guard let newText = nameTextField.text, commit = commit
//            else { return }
//        commit(newText)
//        navigationController!.popViewControllerAnimated(true)
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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