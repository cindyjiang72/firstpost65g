//: Playground - noun: a place where people can play

import Foundation

let immutableString = "hello, playground" //let:immutable
var str = "Hello, playground"

str = "another string"

var myInt = 42
let myConstant = 50.0/51

let implicitDouble = 70.0 //let compiler figure out what type of variable is
let explicitDouble: Double = 70

let label = "the width is "
var width = 75
let widthLabel = label + String(width)
String(94)
let apples = 3
let oranges = 5

var appleSummary = "I have \(apples) apples"
appleSummary = "I have \(oranges) apples"
let orangeSummary = "I have \(oranges) oranges"

var aFloat:Float

var shoppingList = ["catfish", "water", "tulips", "blue paint", 47]
var copyList = shoppingList

//shoppingList.append("toothpaste")
shoppingList.append(47)

//shoppingList.addObject(47)

copyList

var occupation:Dictionary<String, String> = [
    "malcon": "captain",
    "kalyee": "mechanic"
]

occupation["Jayne"] = "Public Relations"


//var occupationNames = occupation.map{
 //   (k:String, v:String)-> String in
  //  return k}

var occupationNames = occupation.map{ $0.0}.map { $0; "blah"}

occupation

var r = 50...100
var g = r.generate()

g.next()
g.next()

var g1 = [11,21,31,41,51].generate()

var tuple1 = (1,2)

tuple1.0
tuple1.1

var tuple2 = (first:"van", last:"Simmons")
tuple2.0
tuple2.last


for (k,v) in occupation
{
    print("\(k),\(v)")
}




class Person {
    func doubler(x: Int) -> Int {
        return x*2
    }
    
    var tripler = {(x:Int)->Int in return x*3}
    var quadrupler = {(x:Int)->Int in return x*4}
    
    func apply(x: Int, functionToApply:Int->Int) -> Int {
        return functionToApply(x)
    }
}

var karan = Person()

karan.apply(5, functionToApply: karan.doubler)
karan.apply(5, functionToApply: karan.tripler)
karan.apply(5, functionToApply: karan.quadrupler)


func doubler(x:Int) -> Int //Int->Int is a TYPE!!
{
    return x*2
}
doubler(4)

func doublerDoubler(x:Double) -> Double
{
    return x*2
}

func progression(v:Int,f:Int->Int) -> Int
{
    return f(v)
}

progression(4,f:doubler)

//progression(4,f:doublerDoubler)

var tf = false
tf = true

var arrArr:Array<Array<Bool>> = [[true]] //array of array of booleans

var closure = {(x:Int)->Int in return x*2}

closure(6)

progression(6,f:closure)



progression(6)
{
    (x:Int)->Int in return x*2
}

progression(6,f:{(x:Int)->Int in return x*2})




var optionalN:Int? = nil//n could be an int or nothing
var implicitOptionalN:Int! = 12

if let n = optionalN {
    let doublerN = doubler(n)
}

//doubler(n) //doubler says n has to be an int

doubler(implicitOptionalN)

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
//var afterAlive = 0

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

//ShowText.text = "The number of alive cells after is: \(counts)"



