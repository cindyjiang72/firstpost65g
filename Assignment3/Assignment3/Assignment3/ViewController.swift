//
//  ViewController.swift
//  Assignment3
//
//  Created by JiangYuan on 7/8/16.
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
    
    enum CellState : String
    {
        case Living = "Living"
        
        case Empty = "Empty"
        
        case Born = "Born"
        
        case Dead = "Dead"
        
    }
    
    
    func description(value: CellState) -> CellState
    {
        switch value
        {
        case .Living:
            return .Living
        case .Empty:
            return .Empty
        case .Born:
            return .Born
        case .Dead:
            return .Dead
        }
    }
    
    func allValues(value: CellState) -> [CellState]
    {
        return [.Living, .Empty, .Born, .Dead]
    }
    
    func toggle(value:CellState) -> CellState
    {
        switch value
        {
        case .Living:
            return .Empty
        case .Empty:
            return .Living
        case .Born:
            return .Empty
        case .Dead:
            return .Living
        }

    }
}

    @IBDesignable class GridView: UIView {
        
        



        
        @IBInspectable var rows: Int = 20
        @IBInspectable var cols: Int = 20

        
    }

    
    
    
    
    




