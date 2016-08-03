//
//  ConfigurationViewController.swift
//  FinalProject
//
//  Created by JiangYuan on 7/24/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

struct Configuration {
    var title: String
    var contents: [(Int, Int)]
    
    static func fromJSON(json: [String: AnyObject]) -> Configuration {
        let contentsJSON = json["contents"] as! [[Int]]
        let contents: [(Int, Int)] = contentsJSON.map({ return ($0.first!, $0.last!) })
        let title = json["title"] as! String
        
        return Configuration(title: title, contents: contents)
    }
}


class ConfigurationViewController: UITableViewController, EngineDelegate {
    
    let engine = StandardEngine.sharedInstance
    
    var configurations: [Configuration] {
        get {
            return engine.configurations
        }
        set(newValue) {
            engine.configurations = newValue
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        engine.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(addUrlNotification), name: "urlUpdated", object: nil)
        
        engine.loadConfigurations("https://dl.dropboxusercontent.com/u/7544475/S65g.json")

    }
    
    
    
    func engineDidUpdate(withGrid: GridProtocol) {}
    
    func configurationsDidUpdate(withConfigurations: [Configuration]) {
        tableView.reloadData()
    }
    
    
    func addUrlNotification(notification: NSNotification){}
    
    
    @IBAction func addName(sender: AnyObject) {
        
        let new = Configuration(title: "Add a new configuration...", contents: [])
        self.configurations.append(new)
        
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configurations.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Default")
            else {
                preconditionFailure("missing Default reuse identifier")
        }
        let row = indexPath.row
        guard let nameLabel = cell.textLabel else {
            preconditionFailure("wtf?")
        }
        nameLabel.text = configurations[row].title
        cell.tag = row
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        StandardEngine.sharedInstance.configuration = configurations[indexPath.row]
    }
    
    override func tableView(tableView: UITableView,
                            commitEditingStyle editingStyle: UITableViewCellEditingStyle,
                                               forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            configurations.removeAtIndex(indexPath.row)
        }
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let editingRow = (sender as! UITableViewCell).tag
        
        let editingString = configurations[editingRow].title
        let editingPoints = configurations[editingRow].contents
        
        guard let editingVC = segue.destinationViewController as? ConfigurationEditorViewController
            else {
                preconditionFailure("Another wtf?")
        }
        
        editingVC.index = editingRow
        editingVC.name = editingString
        editingVC.points = editingPoints
        
        editingVC.commit = {
            self.configurations[editingRow].title = $0
            let indexPath = NSIndexPath(forRow: editingRow, inSection: 0)
            self.tableView.reloadRowsAtIndexPaths([indexPath],
                                                    withRowAnimation: .Automatic)
        }
        
        editingVC.commitpoints = {
            self.configurations[editingRow].contents = $0
            let indexPath = NSIndexPath(forRow: editingRow, inSection: 0)
            self.tableView.reloadRowsAtIndexPaths([indexPath],
                                                  withRowAnimation: .Automatic)
        }
    }
    
    
    @IBAction func cancelChangeOnGridView(segue:UIStoryboardSegue) {
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