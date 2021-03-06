//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var beforeAlive = 0
var before = [[Bool]](count:10, repeatedValue: Array(count:10, repeatedValue:false))

for Col in 0...9
{
    for Row in 0...9
    {
        if arc4random_uniform(3) == 1
        {
            before[Col][Row] = true
            beforeAlive += 1
        }
        
    }
}

//ShowText.text = "The number of alive cells before is: \(beforeAlive)"



var after = [[Bool]](count:10, repeatedValue: Array(count:10, repeatedValue:false))


for Co in 0...9
{
    for Ro in 0...9
    {
        switch before[Co][Ro]{
        case true:
            var afterAlive = 0
            if Co+1<=9
            {
                if before[Co+1][Ro] == true
                {
                    afterAlive += 1
                }
            }
            else
            {
                if before[Co-9][Ro] == true
                {
                    afterAlive += 1
                }
            }//+o
            
            if Ro+1<=9
            {
                if before[Co][Ro+1] == true
                {
                    afterAlive += 1
                }
            }
            else
            {
                if before[Co][Ro-9] == true
                {
                    afterAlive += 1
                }
                
            }//o+
            
            if Co+1<=9
            {
                if Ro+1<=9
                {
                    if before[Co+1][Ro+1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co+1][Ro-9] == true
                    {
                        afterAlive += 1
                    }
                }
            }
            else
            {
                if Ro+1<=9
                {
                    if before[Co-9][Ro+1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co-9][Ro-9] == true
                    {
                        afterAlive += 1
                    }
                }
            }//++
            
            
            
            if Co-1>=0
            {
                
                if before[Co-1][Ro] == true
                {
                    afterAlive += 1
                }//-o
                
                if Ro+1<=9
                {
                    if before[Co-1][Ro+1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co-1][Ro-9] == true
                    {
                        afterAlive += 1
                    }
                }//-+
                
                
                if Ro-1>=0
                {
                    if before[Co-1][Ro-1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co-1][Ro+9] == true
                    {
                        afterAlive += 1
                    }
                }//--
            }
            else //Co-1<0
            {
                if before[Co+9][Ro] == true
                {
                    afterAlive += 1
                }//-o
                
                if Ro+1<=9
                {
                    if before[Co+9][Ro+1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co+1][Ro-9] == true
                    {
                        afterAlive += 1
                    }
                }//-+
                
                if Ro-1>=0
                {
                    if before[Co+9][Ro-1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co+9][Ro+9] == true
                    {
                        afterAlive += 1
                    }
                }//--
            }
            
            
            
            
            if Ro-1>=0
            {
                
                if before[Co][Ro-1] == true
                {
                    afterAlive += 1
                }//0-
                
                if Co+1<=9
                {
                    if before[Co+1][Ro-1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co-9][Ro-1] == true
                    {
                        afterAlive += 1
                    }
                }//+-
                
            }
            else //Ro-1<0
            {
                if before[Co][Ro+9] == true
                {
                    afterAlive += 1
                }//0-
                
                if Co+1<=9
                {
                    if before[Co+1][Ro+9] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co-9][Ro+9] == true
                    {
                        afterAlive += 1
                    }
                }//+-
                
            }
            
            
            if afterAlive == 2
            {
                after[Co][Ro] = true
            }
            else
            {
                if afterAlive == 3{
                    after[Co][Ro] = true
                }
                
            }
            
        case false:
            var afterAlive = 0
            if Co+1<=9
            {
                if before[Co+1][Ro] == true
                {
                    afterAlive += 1
                }
            }
            else
            {
                if before[Co-9][Ro] == true
                {
                    afterAlive += 1
                }
            }//+o
            
            if Ro+1<=9
            {
                if before[Co][Ro+1] == true
                {
                    afterAlive += 1
                }
            }
            else
            {
                if before[Co][Ro-9] == true
                {
                    afterAlive += 1
                }
                
            }//o+
            
            if Co+1<=9
            {
                if Ro+1<=9
                {
                    if before[Co+1][Ro+1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co+1][Ro-9] == true
                    {
                        afterAlive += 1
                    }
                }
            }
            else
            {
                if Ro+1<=9
                {
                    if before[Co-9][Ro+1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co-9][Ro-9] == true
                    {
                        afterAlive += 1
                    }
                }
            }//++
            
            
            
            if Co-1>=0
            {
                
                if before[Co-1][Ro] == true
                {
                    afterAlive += 1
                }//-o
                
                if Ro+1<=9
                {
                    if before[Co-1][Ro+1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co-1][Ro-9] == true
                    {
                        afterAlive += 1
                    }
                }//-+
                
                
                if Ro-1>=0
                {
                    if before[Co-1][Ro-1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co-1][Ro+9] == true
                    {
                        afterAlive += 1
                    }
                }//--
            }
            else //Co-1<0
            {
                if before[Co+9][Ro] == true
                {
                    afterAlive += 1
                }//-o
                
                if Ro+1<=9
                {
                    if before[Co+9][Ro+1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co+1][Ro-9] == true
                    {
                        afterAlive += 1
                    }
                }//-+
                
                if Ro-1>=0
                {
                    if before[Co+9][Ro-1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co+9][Ro+9] == true
                    {
                        afterAlive += 1
                    }
                }//--
            }
            
            
            
            
            if Ro-1>=0
            {
                
                if before[Co][Ro-1] == true
                {
                    afterAlive += 1
                }//0-
                
                if Co+1<=9
                {
                    if before[Co+1][Ro-1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co-9][Ro-1] == true
                    {
                        afterAlive += 1
                    }
                }//+-
                
            }
            else //Ro-1<0
            {
                if before[Co][Ro+9] == true
                {
                    afterAlive += 1
                }//0-
                
                if Co+1<=9
                {
                    if before[Co+1][Ro+9] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co-9][Ro+9] == true
                    {
                        afterAlive += 1
                    }
                }//+-
                
            }
            
            if afterAlive == 3
            {
                after[Co][Ro] = true
            }
            
        }
    }
}

var counts = 0
for Colu in 0...9
{
    for Rows in 0...9
    {
        if after[Colu][Rows] == true
        {
            counts += 1
            
        }
        
    }
}

ShowText.text = "The number of alive cells after is: \(counts)"


func step(before:[[Bool]])->[[Bool]]
{
    
    var beforeAlive = 0
    var before = [[Bool]](count:10, repeatedValue: Array(count:10, repeatedValue:false))
    
    for Col in 0...9
    {
        for Row in 0...9
        {
            if arc4random_uniform(3) == 1
            {
                before[Col][Row] = true
                beforeAlive += 1
            }
            
        }
    }
    
    ShowText.text = "The number of alive cells before is: \(beforeAlive)"
    
    var after = [[Bool]](count:10, repeatedValue: Array(count:10, repeatedValue:false))
    
    
    for Co in 0...9
    {
        for Ro in 0...9
        {
            switch before[Co][Ro]{
            case true:
                var afterAlive = 0
                if Co+1<=9
                {
                    if before[Co+1][Ro] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co-9][Ro] == true
                    {
                        afterAlive += 1
                    }
                }//+o
                
                if Ro+1<=9
                {
                    if before[Co][Ro+1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co][Ro-9] == true
                    {
                        afterAlive += 1
                    }
                    
                }//o+
                
                if Co+1<=9
                {
                    if Ro+1<=9
                    {
                        if before[Co+1][Ro+1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co+1][Ro-9] == true
                        {
                            afterAlive += 1
                        }
                    }
                }
                else
                {
                    if Ro+1<=9
                    {
                        if before[Co-9][Ro+1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co-9][Ro-9] == true
                        {
                            afterAlive += 1
                        }
                    }
                }//++
                
                
                
                if Co-1>=0
                {
                    
                    if before[Co-1][Ro] == true
                    {
                        afterAlive += 1
                    }//-o
                    
                    if Ro+1<=9
                    {
                        if before[Co-1][Ro+1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co-1][Ro-9] == true
                        {
                            afterAlive += 1
                        }
                    }//-+
                    
                    
                    if Ro-1>=0
                    {
                        if before[Co-1][Ro-1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co-1][Ro+9] == true
                        {
                            afterAlive += 1
                        }
                    }//--
                }
                else //Co-1<0
                {
                    if before[Co+9][Ro] == true
                    {
                        afterAlive += 1
                    }//-o
                    
                    if Ro+1<=9
                    {
                        if before[Co+9][Ro+1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co+1][Ro-9] == true
                        {
                            afterAlive += 1
                        }
                    }//-+
                    
                    if Ro-1>=0
                    {
                        if before[Co+9][Ro-1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co+9][Ro+9] == true
                        {
                            afterAlive += 1
                        }
                    }//--
                }
                
                
                
                
                if Ro-1>=0
                {
                    
                    if before[Co][Ro-1] == true
                    {
                        afterAlive += 1
                    }//0-
                    
                    if Co+1<=9
                    {
                        if before[Co+1][Ro-1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co-9][Ro-1] == true
                        {
                            afterAlive += 1
                        }
                    }//+-
                    
                }
                else //Ro-1<0
                {
                    if before[Co][Ro+9] == true
                    {
                        afterAlive += 1
                    }//0-
                    
                    if Co+1<=9
                    {
                        if before[Co+1][Ro+9] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co-9][Ro+9] == true
                        {
                            afterAlive += 1
                        }
                    }//+-
                    
                }
                
                
                if afterAlive == 2
                {
                    after[Co][Ro] = true
                }
                else
                {
                    if afterAlive == 3{
                        after[Co][Ro] = true
                    }
                    
                }
                
            case false:
                var afterAlive = 0
                if Co+1<=9
                {
                    if before[Co+1][Ro] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co-9][Ro] == true
                    {
                        afterAlive += 1
                    }
                }//+o
                
                if Ro+1<=9
                {
                    if before[Co][Ro+1] == true
                    {
                        afterAlive += 1
                    }
                }
                else
                {
                    if before[Co][Ro-9] == true
                    {
                        afterAlive += 1
                    }
                    
                }//o+
                
                if Co+1<=9
                {
                    if Ro+1<=9
                    {
                        if before[Co+1][Ro+1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co+1][Ro-9] == true
                        {
                            afterAlive += 1
                        }
                    }
                }
                else
                {
                    if Ro+1<=9
                    {
                        if before[Co-9][Ro+1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co-9][Ro-9] == true
                        {
                            afterAlive += 1
                        }
                    }
                }//++
                
                
                
                if Co-1>=0
                {
                    
                    if before[Co-1][Ro] == true
                    {
                        afterAlive += 1
                    }//-o
                    
                    if Ro+1<=9
                    {
                        if before[Co-1][Ro+1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co-1][Ro-9] == true
                        {
                            afterAlive += 1
                        }
                    }//-+
                    
                    
                    if Ro-1>=0
                    {
                        if before[Co-1][Ro-1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co-1][Ro+9] == true
                        {
                            afterAlive += 1
                        }
                    }//--
                }
                else //Co-1<0
                {
                    if before[Co+9][Ro] == true
                    {
                        afterAlive += 1
                    }//-o
                    
                    if Ro+1<=9
                    {
                        if before[Co+9][Ro+1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co+1][Ro-9] == true
                        {
                            afterAlive += 1
                        }
                    }//-+
                    
                    if Ro-1>=0
                    {
                        if before[Co+9][Ro-1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co+9][Ro+9] == true
                        {
                            afterAlive += 1
                        }
                    }//--
                }
                
                
                
                
                if Ro-1>=0
                {
                    
                    if before[Co][Ro-1] == true
                    {
                        afterAlive += 1
                    }//0-
                    
                    if Co+1<=9
                    {
                        if before[Co+1][Ro-1] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co-9][Ro-1] == true
                        {
                            afterAlive += 1
                        }
                    }//+-
                    
                }
                else //Ro-1<0
                {
                    if before[Co][Ro+9] == true
                    {
                        afterAlive += 1
                    }//0-
                    
                    if Co+1<=9
                    {
                        if before[Co+1][Ro+9] == true
                        {
                            afterAlive += 1
                        }
                    }
                    else
                    {
                        if before[Co-9][Ro+9] == true
                        {
                            afterAlive += 1
                        }
                    }//+-
                    
                }
                
                if afterAlive == 3
                {
                    after[Co][Ro] = true
                }
                
            }
        }
    }
    

    return after
    
    
}





func neighbors(coor:(Int, Int))->[(Int, Int)]
{
    var f = [(Int, Int)]()
    
    if coor.0+1<=9
    {
        f.append((coor.0+1, coor.1))
    }
    else
    {
        f.append((coor.0-9, coor.1))
    }//+o
    
    if coor.1+1<=9
    {
        f.append((coor.0, coor.1+1))
    }
    else
    {
        f.append((coor.0, coor.1-9))
        
    }//o+
    
    if coor.0+1<=9
    {
        if coor.1+1<=9
        {
            f.append((coor.0+1, coor.1+1))
        }
        else
        {
            f.append((coor.0+1, coor.1-9))
        }
    }
    else
    {
        if coor.1+1<=9
        {
            f.append((coor.0-9, coor.1+1))
        }
        else
        {
            f.append((coor.0-9, coor.1-9))
        }
    }//++
    
    if coor.0-1>=0
    {
        
        f.append((coor.0-1, coor.1))//-o
        
        if coor.1+1<=9
        {
            f.append((coor.0-1, coor.1+1))
        }
        else
        {
            f.append((coor.0-1, coor.1-9))
        }//-+
        
        
        if coor.1-1>=0
        {
            f.append((coor.0-1, coor.1-1))
        }
        else
        {
            f.append((coor.0-1, coor.1+9))
        }//--
    }
    else //coor.0-1<0
    {
        f.append((coor.0+9, coor.1))//-o
        
        if coor.1+1<=9
        {
            f.append((coor.0+9, coor.1+1))
        }
        else
        {
            f.append((coor.0+1, coor.1-9))
        }//-+
        
        if coor.1-1>=0
        {
            f.append((coor.0+9, coor.1-1))
        }
        else
        {
            f.append((coor.0+9, coor.1+9))
        }//--
    }
    
    
    if coor.1-1>=0
    {
        
        f.append((coor.0, coor.1-1))//0-
        
        if coor.0+1<=9
        {
            f.append((coor.0+1, coor.1-1))
        }
        else
        {
            f.append((coor.0-9, coor.1-1))
        }//+-
        
    }
    else //Ro-1<0
    {
        f.append((coor.0, coor.1+9))//0-
        
        if coor.0+1<=9
        {
            f.append((coor.0+1, coor.1+9))
        }
        else
        {
            f.append((coor.0-9, coor.1+9))
        }//+-
        
    }
    
    return f
    
}

var final = neighbors((0,0))

for i in 0...7
{
    print(final[i])
}






func text(c:(Int, Int))->[(Int, Int)]
{
    var stuff = [(Int, Int)]()
    
    stuff.append((c.0 + 1, c.1 + 1))
}

var finals = text((0,0))

print(finals)

print((1,1))





