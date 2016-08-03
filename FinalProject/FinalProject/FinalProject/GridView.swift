//
//  GridView.swift
//  FinalProject
//
//  Created by JiangYuan on 7/24/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

@IBDesignable class GridView: UIView {
    
    var engine = StandardEngine.sharedInstance
    
    func toggle(value:CellState) -> CellState
    {
        switch value
        {
        case .Alive:
            return .Empty
        case .Empty:
            return .Alive
        case .Born:
            return .Empty
        case .Died:
            return .Alive
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
        case .Alive:
            return livingColor
        case .Empty:
            return emptyColor
        case .Born:
            return bornColor
        case .Died:
            return diedColor
        }
    }
    
    
    var rows: Int {
        get {
            
            if let configuration = engine.configuration{
                let rowValues = configuration.contents.map({ return $0.0 })
                return (rowValues.maxElement() ?? 19) + 1
            }
            return engine.rows
        }
        set{
            self.rows = newValue
        }
    }
    var cols: Int {
        get {
            if let configuration = engine.configuration {
                let colValues = configuration.contents.map({ return $0.1 })
                return (colValues.maxElement() ?? 19) + 1
            }
            return engine.cols
        }
        
        set{
            self.cols = newValue
        }
    }
    
    var grid: [[CellState]] {
        set{self.grid = newValue}
        
        get {
            var currentGrid = [[CellState]](count: rows, repeatedValue: [CellState](count: cols, repeatedValue: .Empty))
            
            guard let configuration = engine.configuration else {
                for row in 0..<rows {
                    for col in 0..<cols {
                        currentGrid[row][col] = engine.grid[(row,col)]
                    }
                }
                
                return currentGrid
            }
            
            configuration.contents.forEach { point in
                currentGrid[point.0][point.1] = .Alive
            }
            
            return currentGrid
        }
    }
    
    
    var points: [(Int, Int)] {
        get {
            return self.points
        }
        set {
            self.points = newValue
            grid = [[CellState]](count: rows, repeatedValue: [CellState](count: cols, repeatedValue: .Empty))
            for i in 0..<points.count {
                grid[self.points[i].0][self.points[i].1] = .Alive
            }
        }
    }
    
    @IBInspectable var gridWidth: CGFloat = 2.0
    
    override func drawRect(rect: CGRect) {
        let width: CGFloat = self.bounds.width
        let height: CGFloat = self.bounds.height
        
        let plusPath = UIBezierPath()
        
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
        
        for r in 0..<rows {
            for c in 0..<cols {
                let path = UIBezierPath(ovalInRect: CGRectMake(CGFloat(c)*gridLength,CGFloat(r)*gridHeight,gridLength,gridHeight))
                
                let colornew: UIColor = color(grid[r][c])
                colornew.setFill()
                path.fill()
                
                setNeedsDisplayInRect(CGRect(x: CGFloat(c)*gridLength, y: CGFloat(r)*gridHeight, width: gridLength, height: gridHeight))
            }
        }
    }
    
    
    
    
    func getPointState(value: CGPoint) -> CellState {
        let width: CGFloat = self.bounds.width
        let height: CGFloat = self.bounds.height
        
        let gridLength:CGFloat = width/CGFloat(cols)
        let gridHeight:CGFloat = height/CGFloat(rows)
        
        let x = Int((value.x)/gridLength)
        let y = Int((value.y)/gridHeight)
        
        return grid[y][x]
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch : UITouch = touches.first! {
            
            let width: CGFloat = self.bounds.width
            let height: CGFloat = self.bounds.height
            let gridLength:CGFloat = width/CGFloat(cols)
            let gridHeight:CGFloat = height/CGFloat(rows)
            
            let x = Int((touch.locationInView(self).x)/gridLength)
            let y = Int((touch.locationInView(self).y)/gridHeight)
            
            let before = getPointState(touch.locationInView(self))
            
            if let _ = engine.configuration {
                engine.configuration?.contents.append((y,x))
            } else {
                engine.grid.cells[y*cols+x].state = toggle(before)
            }
            
            setNeedsDisplayInRect(CGRect(x: CGFloat(x)*gridLength, y: CGFloat(y)*gridHeight, width: gridLength, height: gridHeight))
        }
        
    }
    
}