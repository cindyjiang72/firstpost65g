//
//  Grid.swift
//  Assignment4
//
//  Created by JiangYuan on 7/17/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import Foundation

    enum CellState : String
    {
        case Living //= "Living"
    
        case Empty //= "Empty"
    
        case Born //= "Born"
    
        case Dead //= "Dead"
    
    }

    protocol GridProtocol {
        init(rows: UInt, cols: UInt)
        var rows: UInt { get }
        var cols: UInt { get }
        func neighbors(coor:(Int, Int))->[(Int, Int)]
        subscript(row: UInt, col: UInt) -> CellState? { get set }
    }

    protocol EngineDelegate {
        func engineDidUpdate(withGrid: GridProtocol)
    
    }

    protocol EngineProtocol {
        var delegate : EngineDelegate? { get set }
        var grid : GridProtocol { get }
        var refreshRate : Double { get set }
        var refreshTimer : NSTimer { get set }
        var rows: UInt { get set }
        var cols: UInt { get set }
        init(rows: UInt, cols: UInt)
        func step() -> GridProtocol
    }



    class Grid : GridProtocol {
        
        required init(rows: UInt, cols: UInt) {
            self.rows = rows
            self.cols = cols
        }
        var rows: UInt //= 20
        var cols: UInt //= 20
        
//        var r = Int(rows)
//        var c = Int(cols)
        
        var grid : [[CellState]] {
            var r = Int(rows)
            var c = Int(cols)
            
            grid = [[CellState]](count: r, repeatedValue: Array(count:c, repeatedValue: .Empty))
        }
        
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

        
        subscript(rows: UInt, cols: UInt) -> CellState? {
            get {
//                if cells.count < Int(row*col) { return nil }
//                return cells[Int(row * col + col)]
                return grid[Int(rows)][Int(cols)]
            }
            set (newValue) {
//                if newValue == nil { return }
//                if row < 0 || row >= rows || col < 0 || col >= cols { return }
//                let cellRow = row * cols + col
//                cells[Int(cellRow)] = newValue!
                grid[rows][cols] = newValue!
            }
        }
        


    }


//    class StandardEngine : EngineProtocol {
//        
//    }

