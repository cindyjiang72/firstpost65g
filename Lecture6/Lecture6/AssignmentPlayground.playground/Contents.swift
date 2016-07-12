//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

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
                for i in 0...7
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
                    
                    
                    if grid[Ro][Co] ==.Born {
                        if after[Ro][Co] == true {
                            grid[Ro][Co] = .Living
                        }
                        else {
                            grid[Ro][Co] = .Died
                        }
                    }
                    
                    if grid[Ro][Co] ==.Living {
                        if after[Ro][Co] == true {
                            grid[Ro][Co] = .Living
                        }
                        else {
                            grid[Ro][Co] = .Died
                        }
                    }
                    
                    if grid[Ro][Co] ==.Died {
                        if after[Ro][Co] == true {
                            grid[Ro][Co] = .Born
                        }
                        else {
                            grid[Ro][Co] = .Empty
                        }
                    }
                    
                    if grid[Ro][Co] ==.Empty {
                        if after[Ro][Co] == true {
                            grid[Ro][Co] = .Born
                        }
                        else {
                            grid[Ro][Co] = .Empty
                        }
                    }
                    
                    
                    
                    }
                
            case false:
                var afterAlive = 0
                var final = neighbors((Ro,Co))
                for i in 0...7
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
                    after[Ro][Co] = false
                }
                
                
                
                if grid[Ro][Co] ==.Born {
                    if after[Ro][Co] == true {
                        grid[Ro][Co] = .Living
                    }
                    else {
                        grid[Ro][Co] = .Died
                    }
                }
                
                if grid[Ro][Co] ==.Living {
                    if after[Ro][Co] == true {
                        grid[Ro][Co] = .Living
                    }
                    else {
                        grid[Ro][Co] = .Died
                    }
                }
                
                if grid[Ro][Co] ==.Died {
                    if after[Ro][Co] == true {
                        grid[Ro][Co] = .Born
                    }
                    else {
                        grid[Ro][Co] = .Empty
                    }
                }
                
                if grid[Ro][Co] ==.Empty {
                    if after[Ro][Co] == true {
                        grid[Ro][Co] = .Born
                    }
                    else {
                        grid[Ro][Co] = .Empty
                    }
                }

                
            }
        }
    }
    
    
    return after
    
}