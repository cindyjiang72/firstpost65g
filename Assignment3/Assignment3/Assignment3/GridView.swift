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
    
    //grid = [[CellState]](count: cols, repeatedValue: Array(count:rows, repeatedValue: .Empty))

    
  
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
        

        
        for r in 1...rows {
            for c in 1...cols {
                let path = UIBezierPath(ovalInRect: CGRectMake(CGFloat(r-1)*gridLength,CGFloat(c-1)*gridHeight,gridLength,gridHeight))
                let colornew: UIColor = color(grid[r-1][c-1])
                colornew.setFill()
                path.fill()
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
        
        return grid[x][y]
        
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
             grid[x][y] = toggle(before)
            
            
            
            setNeedsDisplayInRect(CGRect(x: CGFloat(x)*gridLength, y: CGFloat(y)*gridHeight, width: gridLength, height: gridHeight))
        }

    }
    
        
    
    
    
    
    
    
    
    func neighbors(coor:(Int, Int))->[(Int, Int)]
    {
        var f = [(Int, Int)]()
        let r = rows-1
        let c = cols-1
        
        if coor.0+1<=c
        {
            f.append((coor.0+1, coor.1))
        }
        else
        {
            f.append((coor.0-c, coor.1))
        }//+o
        
        if coor.1+1<=r
        {
            f.append((coor.0, coor.1+1))
        }
        else
        {
            f.append((coor.0, coor.1-r))
            
        }//o+
        
        if coor.0+1<=c
        {
            if coor.1+1<=r
            {
                f.append((coor.0+1, coor.1+1))
            }
            else
            {
                f.append((coor.0+1, coor.1-r))
            }
        }
        else
        {
            if coor.1+1<=r
            {
                f.append((coor.0-c, coor.1+1))
            }
            else
            {
                f.append((coor.0-c, coor.1-r))
            }
        }//++
        
        if coor.0-1>=0
        {
            
            f.append((coor.0-1, coor.1))//-o
            
            if coor.1+1<=r
            {
                f.append((coor.0-1, coor.1+1))
            }
            else
            {
                f.append((coor.0-1, coor.1-r))
            }//-+
            
            
            if coor.1-1>=0
            {
                f.append((coor.0-1, coor.1-1))
            }
            else
            {
                f.append((coor.0-1, coor.1+r))
            }//--
        }
        else //coor.0-1<0
        {
            f.append((coor.0+c, coor.1))//-o
            
            if coor.1+1<=r
            {
                f.append((coor.0+c, coor.1+1))
            }
            else
            {
                f.append((coor.0+1, coor.1-r))
            }//-+
            
            if coor.1-1>=0
            {
                f.append((coor.0+c, coor.1-1))
            }
            else
            {
                f.append((coor.0+c, coor.1+r))
            }//--
        }
        
        
        if coor.1-1>=0
        {
            
            f.append((coor.0, coor.1-1))//0-
            
            if coor.0+1<=c
            {
                f.append((coor.0+1, coor.1-1))
            }
            else
            {
                f.append((coor.0-c, coor.1-1))
            }//+-
            
        }
        else //Ro-1<0
        {
            f.append((coor.0, coor.1+r))//0-
            
            if coor.0+1<=c
            {
                f.append((coor.0+1, coor.1+r))
            }
            else
            {
                f.append((coor.0-c, coor.1+r))
            }//+-
            
        }
        
        return f
        
    }
    
    
    func step2(before:[[Bool]])->[[Bool]]
    {
        let numrow = before.count
        let numcol = before[0].count
        var after = [[Bool]](count:numrow, repeatedValue: Array(count:numcol, repeatedValue:Bool()))
        
        for Ro in 0...numrow-1
        {
            for Co in 0...numcol-1
            {
                switch before[Ro][Co]{
                case true:
                    var afterAlive = 0
                    var final = neighbors((Ro,Co))
                    for i in 0...(numrow*numcol-2)
                    {
                        if before[final[i].0][final[i].1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    
                    
                    if afterAlive == 2
                    {
                        after[Ro][Co] = true
                    }
                    else
                    {
                        if afterAlive == 3{
                            after[Ro][Co] = true
                        }
                        else {
                            after[Ro][Co] = false
                        }
                    }
                    
                    
                case false:
                    var afterAlive = 0
                    var final = neighbors((Ro,Co))
                    for i in 0...(numrow*numcol-2)
                    {
                        if before[final[i].0][final[i].1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    if afterAlive == 3
                    {
                        after[Ro][Co] = true
                    }
                    else {
                        after[Ro][Co] = true
                    }
                    
                }
            }
        }
        
        
        return after
        
    }
    
    
    func boolto(value: Bool) -> CellState {
        switch value
        {
        case true:
            return .Living
//        case .Empty:
//            return emptyColor
//        case .Born:
//            return bornColor
        case false:
            return .Dead
        }    }
    


    
    
    @IBOutlet weak var GridView: UIView!
    
    @IBAction func runButton(sender:UIButton){
        
        var newBool = [[Bool]](count:cols, repeatedValue: Array(count:rows, repeatedValue:Bool()))

        for r in 1...rows {
            for c in 1...cols {
                if grid[r-1][c-1] == .Empty {
                    newBool[r-1][c-1] = false
                }
                else {
                    newBool[r-1][c-1] = true
                }
                
            }
        }
        
        let width: CGFloat = self.bounds.width
        let height: CGFloat = self.bounds.height
        let gridLength:CGFloat = width/CGFloat(cols)
        let gridHeight:CGFloat = height/CGFloat(rows)
        
        var afterBool = step2(newBool)
        
        for rr in 1...rows {
            for cc in 1...cols {
                setNeedsDisplayInRect(CGRect(x: CGFloat(rr)*gridLength, y: CGFloat(cc)*gridHeight, width: gridLength, height: gridHeight))
                grid[rr][cc] = boolto(afterBool[rr][cc])
                
            }
        }
        

        
    }

    

    
}

    
    
    
    
    
    
    


    





