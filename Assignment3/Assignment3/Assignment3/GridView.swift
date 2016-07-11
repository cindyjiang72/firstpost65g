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
    
    func color(value: CellState) -> UIColor
    {
        switch value
        {
        case .Living:
            return livingColor
        case .Empty:
            return emptyColor
        case .Born:
            return bornColor
        case .Dead:
            return diedColor
        }
    }
    
    @IBInspectable var gridWidth: CGFloat = 2.0
    
    override func drawRect(rect: CGRect) {
        
        let width: CGFloat = self.bounds.width
        let height: CGFloat = self.bounds.height
        
        let plusPath = UIBezierPath()
        
        //let gridLength: CGFloat = width/CGFloat(max(rows,cols))
        //let gridHeight: CGFloat = width/CGFloat(max(rows,cols))
        
        let gridLength:CGFloat = width/CGFloat(cols)
        let gridHeight:CGFloat = height/CGFloat(rows)
        
        for i in 0...rows{
            
            plusPath.moveToPoint(CGPoint(x:0.0,y:CGFloat(i)*gridHeight))
            plusPath.addLineToPoint(CGPoint(x:width,y:CGFloat(i)*gridHeight))

            
        }
        
        for j in 0...cols{
            
            plusPath.moveToPoint(CGPoint(x:CGFloat(j)*gridLength,y:0.0))
            plusPath.addLineToPoint(CGPoint(x:CGFloat(j)*gridLength,y:height))

            
        }
        
        gridColor.setStroke()
        plusPath.lineWidth = gridWidth
        plusPath.stroke()
        
        
        
        
        
        for r in 1...rows {
            for c in 1...cols {
                let path = UIBezierPath(ovalInRect: CGRectMake(CGFloat(r-1)*gridLength,CGFloat(c-1)*gridHeight,gridLength,gridHeight))
                let colorr: UIColor = color(grid[r-1][c-1])
                colorr.setFill()
                path.fill()

            }
        }
        
   
        
        
        
        
    }
    



}

