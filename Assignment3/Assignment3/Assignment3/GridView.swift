//
//  GridView.swift
//  Assignment3
//
//  Created by JiangYuan on 7/9/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class GridView: UIView {

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
    
    var grid = [[CellState]]()
    
    @IBInspectable var rows: Int = 20{
        didSet{
            grid = [[CellState]](count: cols, repeatedValue: Array(count:rows, repeatedValue: .Empty))
            
        }
        
    }
    @IBInspectable var cols: Int = 20{
        didSet{
            grid = [[CellState]](count: cols, repeatedValue: Array(count:rows, repeatedValue: .Empty))
            
        }
    }

    
  
    @IBInspectable var livingColor: UIColor = UIColor.greenColor()
    @IBInspectable var emptyColor: UIColor = UIColor.grayColor()
    @IBInspectable var bornColor: UIColor = UIColor.greenColor()
    @IBInspectable var diedColor: UIColor = UIColor.grayColor()
    @IBInspectable var gridColor: UIColor = UIColor.blackColor()
    
    @IBInspectable var gridWidth: CGFloat
    



}

