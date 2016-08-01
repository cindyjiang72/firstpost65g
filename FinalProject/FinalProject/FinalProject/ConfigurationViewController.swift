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


class ConfigurationViewController: UITableViewController {
    
    let engine = StandardEngine.sharedInstance
    
    var configurations: [Configuration] {
        get {
            return engine.configurations
        }
        set(newValue) {
            engine.configurations = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(addUrlNoti), name: "urlUpdated", object: nil)
        
        let url = NSURL(string: "https://dl.dropboxusercontent.com/u/7544475/S65g.json")!
        let fetcher = Fetcher()
        fetcher.requestJSON(url) { (json, message) in
            
            if let json = json, array = json as? Array<Dictionary<String,AnyObject>> {
                self.configurations += array.map({ (elementJSON) in
                    return Configuration.fromJSON(elementJSON)
                })

                
                let op = NSBlockOperation {
                    self.tableView.reloadData()
                }
                NSOperationQueue.mainQueue().addOperation(op)
                
                //self.engine.configurations = self.configurations
                
                NSNotificationCenter.defaultCenter().postNotificationName("rowsClicked", object: nil, userInfo: json as? [NSObject : AnyObject])
            }
            
        }

    }
    
    func addUrlNoti(notification: NSNotification){
        
    }
    

    @IBAction func addName(sender: AnyObject) {
        configurations.append(Configuration(title: "Add a new configuration...", contents: []))
        let itemRow = configurations.count - 1
        let itemPath = NSIndexPath(forRow:itemRow, inSection: 0)
        tableView.insertRowsAtIndexPaths([itemPath], withRowAnimation: .Automatic)

//        var newElement: Configuration
//        var newcontents = [(Int, Int)]()
//        newcontents.append((20,20))
//        newElement = Configuration(title: "Add a new configuration...", contents: newcontents)
//        self.configurations.append(newElement)
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
            tableView.deleteRowsAtIndexPaths([indexPath],
                                             withRowAnimation: .Automatic)
        }
    }
    
    func configurationsDidUpdate(withConfigurations: [Configuration]) {
        // do something with new configurations
        
        tableView.reloadData()
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let editingRow = (sender as! UITableViewCell).tag
        
        let editingString = configurations[editingRow].title
        let editingPoints = configurations[editingRow].contents
        
        guard let editingVC = segue.destinationViewController as? ConfigurationEditorViewController
            else {
                preconditionFailure("Another wtf?")
        }
        
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