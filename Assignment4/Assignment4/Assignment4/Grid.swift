//
//  Grid.swift
//  Assignment4
//
//  Created by JiangYuan on 7/17/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import Foundation

    //CellState Enum
    enum CellState : String
    {
        case Living
        case Empty
        case Born
        case Dead
    }

    //GridProtocol
    protocol GridProtocol {
        init(rows: UInt, cols: UInt)
        var rows: UInt { get }
        var cols: UInt { get }
        func neighbors(coor:(Int, Int))->[(Int, Int)]
        subscript(row: UInt, col: UInt) -> CellState? { get set }
    }

    //EngineDelegate Protocol
    protocol EngineDelegate {
        func engineDidUpdate(withGrid: GridProtocol)
    
    }

    //EngineProtocol
    protocol EngineProtocol {
        var delegate : EngineDelegate? { get set }
        var grid : GridProtocol { get }
        var refreshRate : Double { get set }
        var refreshTimer : NSTimer? { get set }
        var rows: UInt { get set }
        var cols: UInt { get set }
        init(rows: UInt, cols: UInt)
        func step() -> GridProtocol
    }



    //class Grid implements GridProtocol
    class Grid : GridProtocol {
        
        var gridgrid : [[CellState]]
        
        required init(rows: UInt, cols: UInt) {
            self.rows = rows
            self.cols = cols
            gridgrid = [[CellState]](count: Int(rows), repeatedValue: Array(count:Int(cols), repeatedValue: .Empty))
            
        }
        var rows: UInt
        var cols: UInt
        
        
        func neighbors(coor:(Int, Int))->[(Int, Int)]
        {
            var f = [(Int, Int)]()
            let r = Int(rows)-1
            let c = Int(cols)-1
            
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
                    f.append((coor.0+c, coor.1-r))
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

        
        subscript(row: UInt, col: UInt) -> CellState? {
            get {
                return gridgrid[Int(row)][Int(col)]
            }
            set (newValue) {
                if newValue == nil { return }
                if row < 0 || row >= rows || col < 0 || col >= cols { return }
                gridgrid[Int(row)][Int(col)] = newValue!
            }
        }

    }


    //StandardEngine class implements EngineProtocol
    class StandardEngine : EngineProtocol {
    
        var delegate : EngineDelegate?
        var grid : GridProtocol
        var refreshRate = 0.0 //variables are unable to default in the protocol so set in class Standard Engine
        var refreshTimer : NSTimer?
        
        
        private static var _sharedInstance = StandardEngine(rows: 10, cols: 10)
        static var sharedInstance: StandardEngine {
            get {
                return _sharedInstance
            }
        }
        
        //private (set) lazy var sharedInstance = StandardEngine(rows: 10, cols: 10)
        
        var rows: UInt = 10 {
            didSet {
                if let delegate = delegate {
                    delegate.engineDidUpdate(grid)
                }
                
            }
        }
        var cols: UInt = 10 {
            didSet {
                if let delegate = delegate {
                    delegate.engineDidUpdate(grid)
                    
                }
            }
        }

        required init(rows: UInt, cols: UInt) {
            self.rows = rows
            self.cols = cols
            grid = Grid(rows: rows, cols: cols)
        }
        
        

        
        func step() -> GridProtocol
        {
            //var before = [[Bool]](count: Int(rows), repeatedValue: Array(count:Int(cols), repeatedValue: Bool()))
            var after = [[CellState]](count: Int(rows), repeatedValue: Array(count:Int(cols), repeatedValue: .Empty))
            
            
            //var before: GridProtocol = Grid(rows: rows, cols: cols)
            
            for r in 0...Int(rows-1)
            {
                for c in 0...Int(cols-1)
                {
                    if grid[r,c] == .Living {
                        before[r][c] = true
                    }
                    if grid[r,c] == .Born {
                        before[r][c] = true
                    }
                    if grid[r][c] == .Empty {
                        before[r][c] = true
                    }
                    if grid[r][c] == .Dead {
                        before[r][c] = true
                    }
                }
            }
            
            for r in 0...Int(rows-1)
            {
                for c in 0...Int(cols-1)
                {
                    switch grid[r][c] {
                    case .Living:
                        var afterAlive = 0
                        var final = Grid(rows: rows, cols: cols).neighbors((r,c))
                        
                        for i in 0...7 {
                            if before[final[i].0][final[i].1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        
                        if afterAlive == 2 || afterAlive == 3
                        {
                            after[r][c] = .Living}
                        else {
                                after[r][c] = .Dead
                            }
                        
                    case .Born:
                        var afterAlive = 0
                        var final = Grid(rows: rows, cols: cols).neighbors((r,c))
                        
                        for i in 0...7 {
                            if before[final[i].0][final[i].1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        
                        if afterAlive == 2 || afterAlive == 3
                        {
                            after[r][c] = .Living}
                        else {
                            after[r][c] = .Dead
                        }

                    case .Empty:
                        var afterAlive = 0
                        var final = Grid(rows: rows, cols: cols).neighbors((r,c))
                        
                        for i in 0...7 {
                            if before[final[i].0][final[i].1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        
                        if afterAlive == 3
                        {
                            after[r][c] = .Born}
                        else {
                            after[r][c] = .Empty
                        }

                        
                    case .Dead:
                        var afterAlive = 0
                        var final = Grid(rows: rows, cols: cols).neighbors((r,c))
                        
                        for i in 0...7 {
                            if before[final[i].0][final[i].1] == true
                            {
                                afterAlive += 1
                            }
                        }
                        
                        if afterAlive == 3
                        {
                            after[r][c] = .Born}
                        else {
                            after[r][c] = .Empty
                        }
                        
                    }
                }
            }
            
            return after
        }
        

        
        //send notification as grid
        @objc func SendNotification() {
            let Instance : GridProtocol = Grid(rows: rows, cols: cols)
            NSNotificationCenter.defaultCenter().postNotificationName("EngineNotification", object: nil, userInfo: ["Notification" : StructChangedNotification(s: Instance)])
        }
        
}

//wraps grid array in an object
class StructChangedNotification {
    let myStruct : GridProtocol
    
    init(s : GridProtocol) {
        myStruct = s
    }
}


