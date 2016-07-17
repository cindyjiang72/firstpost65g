//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//func step2(before:[[Bool]])->[[Bool]]
//{
//    let numrow = before.count
//    let numcol = before[0].count
//    var after = [[Bool]](count:numrow, repeatedValue: Array(count:numcol, repeatedValue:Bool()))
//    
//
//    

//    for Ro in 0...numrow-1
//    {
//        for Co in 0...numcol-1
//        {
//            switch before[Ro][Co]{
//            case true:
//                var afterAlive = 0
//                var final = neighbors((Ro,Co))
//                for i in 0...7
//                {
//                    if before[final[i].0][final[i].1] == true
//                    {
//                        afterAlive += 1
//                    }
//                }
//                
//                
//                if afterAlive == 2
//                {
//                    after[Ro][Co] = true
//                    
//                }
//                else
//                {
//                    if afterAlive == 3{
//                        after[Ro][Co] = true
//                    }
//                    else {
//                        after[Ro][Co] = false
//                    }
//                    
//                    
//                    if grid[Ro][Co] ==.Born {
//                        if after[Ro][Co] == true {
//                            grid[Ro][Co] = .Living
//                        }
//                        else {
//                            grid[Ro][Co] = .Died
//                        }
//                    }
//                    
//                    if grid[Ro][Co] ==.Living {
//                        if after[Ro][Co] == true {
//                            grid[Ro][Co] = .Living
//                        }
//                        else {
//                            grid[Ro][Co] = .Died
//                        }
//                    }
//                    
//                    if grid[Ro][Co] ==.Died {
//                        if after[Ro][Co] == true {
//                            grid[Ro][Co] = .Born
//                        }
//                        else {
//                            grid[Ro][Co] = .Empty
//                        }
//                    }
//                    
//                    if grid[Ro][Co] ==.Empty {
//                        if after[Ro][Co] == true {
//                            grid[Ro][Co] = .Born
//                        }
//                        else {
//                            grid[Ro][Co] = .Empty
//                        }
//                    }
//                    
//                    
//                    
//                    }
//                
//            case false:
//                var afterAlive = 0
//                var final = neighbors((Ro,Co))
//                for i in 0...7
//                {
//                    if before[final[i].0][final[i].1] == true
//                    {
//                        afterAlive += 1
//                    }
//                }
//                if afterAlive == 3
//                {
//                    after[Ro][Co] = true
//                }
//                else {
//                    after[Ro][Co] = false
//                }
//                
//                
//                
//                if grid[Ro][Co] ==.Born {
//                    if after[Ro][Co] == true {
//                        grid[Ro][Co] = .Living
//                    }
//                    else {
//                        grid[Ro][Co] = .Died
//                    }
//                }
//                
//                if grid[Ro][Co] ==.Living {
//                    if after[Ro][Co] == true {
//                        grid[Ro][Co] = .Living
//                    }
//                    else {
//                        grid[Ro][Co] = .Died
//                    }
//                }
//                
//                if grid[Ro][Co] ==.Died {
//                    if after[Ro][Co] == true {
//                        grid[Ro][Co] = .Born
//                    }
//                    else {
//                        grid[Ro][Co] = .Empty
//                    }
//                }
//                
//                if grid[Ro][Co] ==.Empty {
//                    if after[Ro][Co] == true {
//                        grid[Ro][Co] = .Born
//                    }
//                    else {
//                        grid[Ro][Co] = .Empty
//                    }
//                }
//
//                
//            }
//        }
//    }
//    
//    
//    return after
//    
//}


let rows = 20
let cols = 20

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

var co = (0,0)
print(neighbors(co))

