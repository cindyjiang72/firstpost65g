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
        case Living
        case Empty
        case Born
        case Dead
    }

    
    func Description() -> String {
        switch self {
        default:
            return self.description
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
            grid = [[CellState]](count: rows, repeatedValue: Array(count:cols, repeatedValue: .Empty))
            setNeedsDisplay()
        }
        
    }
    @IBInspectable var cols: Int = 20{
        didSet{
            grid = [[CellState]](count: rows, repeatedValue: Array(count:cols, repeatedValue: .Empty))
            setNeedsDisplay()
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
            grid[y][x] = toggle(before)
            
            
            
            setNeedsDisplayInRect(CGRect(x: CGFloat(x)*gridLength, y: CGFloat(y)*gridHeight, width: gridLength, height: gridHeight))
        }

    }
    

    
    
    func neighbors(coor:(Int, Int))->[(Int, Int)]
    {
        var f = [(Int, Int)]()
        let r = rows-1
        print(r)
        let c = cols-1
        
        if coor.0+1<=r
        {
            f.append((coor.0+1, coor.1))
        }
        else
        {
            f.append((coor.0-r, coor.1))
        }//+o
        
        
        
        
        if coor.1+1<=c
        {
            f.append((coor.0, coor.1+1))
        }
        else
        {
            f.append((coor.0, coor.1-c))
            
        }//o+
        
        
        
        if coor.0+1<=r
        {
            if coor.1+1<=c
            {
                f.append((coor.0+1, coor.1+1))
            }
            else
            {
                f.append((coor.0+1, coor.1-c))
            }
        }
        else
        {
            if coor.1+1<=c
            {
                f.append((coor.0-r, coor.1+1))
            }
            else
            {
                f.append((coor.0-r, coor.1-c))
            }
        }//++
        
        if coor.0-1>=0
        {
            
            f.append((coor.0-1, coor.1))//-o
            
            if coor.1+1<=c
            {
                f.append((coor.0-1, coor.1+1))
            }
            else
            {
                f.append((coor.0-1, coor.1-c))
            }//-+
            
            
            if coor.1-1>=0
            {
                f.append((coor.0-1, coor.1-1))
            }
            else
            {
                f.append((coor.0-1, coor.1+c))
            }//--
        }
        else //coor.0-1<0
        {
            f.append((coor.0+r, coor.1))//-o
            
            if coor.1+1<=c
            {
                f.append((coor.0+r, coor.1+1))
            }
            else
            {
                f.append((coor.0+r, coor.1-c))
            }//-+
            
            if coor.1-1>=0
            {
                f.append((coor.0+r, coor.1-1))
            }
            else
            {
                f.append((coor.0+r, coor.1+c))
            }//--
        }
        
        
        if coor.1-1>=0
        {
            
            f.append((coor.0, coor.1-1))//0-
            
            if coor.0+1<=r
            {
                f.append((coor.0+1, coor.1-1))
            }
            else
            {
                f.append((coor.0-r, coor.1-1))
            }//+-
            
        }
        else //Ro-1<0
        {
            f.append((coor.0, coor.1+c))//0-
            
            if coor.0+1<=r
            {
                f.append((coor.0+1, coor.1+c))
            }
            else
            {
                f.append((coor.0-r, coor.1+c))
            }//+-
            
        }
        
        return f
        
    }
    


    func step2() -> [[CellState]]
    {
        
        var after = [[CellState]](count:rows, repeatedValue: Array(count:cols, repeatedValue:.Empty))
        
        
        for Ro in 0...rows-1
        {
            for Co in 0...cols-1
            {
                switch grid[Ro][Co]{
                    
                case .Empty, .Dead:
                    var afterAlive = 0
                    var final = neighbors((Ro,Co))
                    
                    for i in 0...7
                    {
                        if grid[final[i].0][final[i].1] == .Living || grid[final[i].0][final[i].1] == .Born
                        {
                            afterAlive += 1
                        }
                    }
                    
                    if afterAlive == 3
                    {
                        after[Ro][Co] = .Born
                        
                    }
                    else {
                        after[Ro][Co] = .Empty
                    }
                    
                case .Living, .Born:
                    var afterAlive = 0
                    var final = neighbors((Ro,Co))
                    
                    for i in 0...7
                    {
                        if grid[final[i].0][final[i].1] == .Living || grid[final[i].0][final[i].1] == .Born
                        {
                            afterAlive += 1
                        }
                    }
                    
                    if afterAlive == 2 || afterAlive == 3
                    {
                        after[Ro][Co] = .Living
                        
                    }
                    else {
                        after[Ro][Co] = .Dead
                    }
                
                }
            }
            

        
        }
        grid = after
        setNeedsDisplay()
        return grid
    }
    
    

}
    