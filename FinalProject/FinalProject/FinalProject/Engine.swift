//
//  Engine.swift
//  FinalProject
//
//  Created by JiangYuan on 7/24/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import UIKit

typealias Position = (row:Int, col: Int)

enum CellState {
    case Empty
    case Died
    case Born
    case Alive
    
    func isLiving() -> Bool {
        switch self {
        case .Alive, .Born: return true
        case .Died, .Empty: return false
        }
    }
    
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
}

typealias Cell = (position: Position, state: CellState)

protocol GridProtocol {
    var rows: Int { get }
    var cols: Int { get }
    var cells: [Cell] { get set }
    
    var living: Int { get }
    var dead:   Int { get }
    var alive:  Int { get }
    var born:   Int { get }
    var died:   Int { get }
    var empty:  Int { get }
    
    subscript (i:Int, j:Int) -> CellState { get set }
    
    func neighbors(pos: Position) -> [Position]
    func livingNeighbors(position: Position) -> Int
}

protocol  EngineDelegate: class {
    func engineDidUpdate(withGrid: GridProtocol)
    func configurationsDidUpdate(withConfigurations: [Configuration])
}

extension EngineDelegate {
    func configurationsDidUpdate(withConfigurations: [Configuration]) {
        // default implementatin does nothing
    }
}

protocol EngineProtocol {
    var rows: Int { get set }
    var cols: Int { get set }
    var grid: GridProtocol { get }
    weak var delegate: EngineDelegate? { get set }
    
    
    
    var refreshRate:  Double { get set }
    var refreshTimer: NSTimer? { get set }
    
    func cellToggled(row:Int, col:Int)
    func step() -> GridProtocol
    func loadConfigurations(urlString: String)
}

typealias CellInitializer = (Position) -> CellState

class StandardEngine: EngineProtocol {
    
    private static var _sharedInstance: StandardEngine = StandardEngine(20,20)
    static var sharedInstance: StandardEngine { get { return _sharedInstance } }
    
    
    var configuration: Configuration?
    
    var configurations = [Configuration]() {
        didSet {
            delegate?.configurationsDidUpdate(configurations)
        }
    }
    
    
    func loadConfigurations(urlString: String) {
        let url = NSURL(string: urlString)!
        let fetcher = Fetcher()
        fetcher.requestJSON(url) { (json, message) in
            
            if let json = json, array = json as? Array<Dictionary<String,AnyObject>> {
                
                let op = NSBlockOperation {
                    self.configurations = array.map({ (elementJSON) in
                        return Configuration.fromJSON(elementJSON)
                    })
                }
                NSOperationQueue.mainQueue().addOperation(op)
                
            }
        }
    }
    
    func setGridFromConfiguration() {
        if let configuration = configuration {
            self.grid = Grid(rows, cols) { position in
                if configuration.contents.contains({return $0.0 == position.row && $0.1 == position.col }) {
                    return .Alive
                } else { return .Empty }
            }
        }
        
    }
    
    
    var grid: GridProtocol {
        didSet {
            delegate?.engineDidUpdate(grid)
        }
    }
    
    var rows: Int = 20 {
        didSet {
            grid = Grid(self.rows, self.cols) { _,_ in .Empty }
            delegate?.engineDidUpdate(grid)
        }
    }
    
    var cols: Int = 20 {
        didSet {
            grid = Grid(self.rows, self.cols) { _,_ in .Empty }
            delegate?.engineDidUpdate(grid)
        }
    }
    
    weak var delegate: EngineDelegate?
    
    var refreshRate = 0.0 {
        didSet {
            if refreshRate != 0 {
                if let timer = refreshTimer { timer.invalidate() }
                let sel = #selector(StandardEngine.timerDidFire(_:))
                refreshTimer = NSTimer.scheduledTimerWithTimeInterval(1/refreshRate,
                                                                      target: self,
                                                                      selector: sel,
                                                                      userInfo: nil,
                                                                      repeats: true)
            }
            else if let timer = refreshTimer {
                timer.invalidate()
                self.refreshTimer = nil
            }
        }
        
    }
    
    @objc func timerDidFire(timer:NSTimer) {
        step()
    }
    
    var refreshTimer: NSTimer?
    
    subscript (i:Int, j:Int) -> CellState {
        get {
            return grid.cells[i*cols+j].state
        }
        set {
            grid.cells[i*cols+j].state = newValue
        }
    }
    
    func cellToggled(row: Int, col: Int) {
        grid[row,col] = grid[row,col].toggle(grid[row,col])
    }
    
    init(_ rows: Int, _ cols: Int, cellInitializer: CellInitializer = {_ in .Empty }) {
        self.rows = rows
        self.cols = cols
        self.grid = Grid(rows,cols, cellInitializer: cellInitializer)
    }
    
    func step() -> GridProtocol {
        var newGrid = Grid(self.rows, self.cols)
        newGrid.cells = grid.cells.map {
            switch grid.livingNeighbors($0.position) {
            case 2 where $0.state.isLiving(),
            3 where $0.state.isLiving():  return Cell($0.position, .Alive)
            case 3 where !$0.state.isLiving(): return Cell($0.position, .Born)
            case _ where $0.state.isLiving():  return Cell($0.position, .Died)
            default:                           return Cell($0.position, .Empty)
            }
        }
        grid = newGrid
        if let delegate = delegate { delegate.engineDidUpdate(grid) }
        return grid
    }
}

struct Grid: GridProtocol {
    private(set) var rows: Int
    private(set) var cols: Int
    var cells: [Cell]
    
    var living: Int { return cells.reduce(0) { return  $1.state.isLiving() ?  $0 + 1 : $0 } }
    var dead:   Int { return cells.reduce(0) { return !$1.state.isLiving() ?  $0 + 1 : $0 } }
    var alive:  Int { return cells.reduce(0) { return  $1.state == .Alive  ?  $0 + 1 : $0 } }
    var born:   Int { return cells.reduce(0) { return  $1.state == .Born   ?  $0 + 1 : $0 } }
    var died:   Int { return cells.reduce(0) { return  $1.state == .Died   ?  $0 + 1 : $0 } }
    var empty:  Int { return cells.reduce(0) { return  $1.state == .Empty  ?  $0 + 1 : $0 } }
    
    init (_ rows: Int, _ cols: Int, cellInitializer: CellInitializer = {_ in .Empty }) {
        self.rows = rows
        self.cols = cols
        self.cells = (0..<rows*cols).map {
            let pos = Position($0/cols, $0%cols)
            return Cell(pos, cellInitializer(pos))
        }
    }
    
    subscript (i:Int, j:Int) -> CellState {
        get {
            return cells[i*cols+j].state
        }
        set {
            cells[i*cols+j].state = newValue
        }
    }
    
    private static let offsets:[Position] = [
        (-1, -1), (-1, 0), (-1, 1),
        ( 0, -1),          ( 0, 1),
        ( 1, -1), ( 1, 0), ( 1, 1)
    ]
    
    func neighbors(pos: Position) -> [Position] {
        return Grid.offsets.map { Position((pos.row + rows + $0.row) % rows,
            (pos.col + cols + $0.col) % cols) }
    }
    
    func livingNeighbors(position: Position) -> Int {
        return neighbors(position)
            .reduce(0) {
                self[$1.row,$1.col].isLiving() ? $0 + 1 : $0
        }
    }
}



