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

var shoppingList:NSMutableArray = ["catfish", "water", "tulips", "blue paint", 47]
var copyList = shoppingList

//shoppingList.append("toothpaste")
//shoppingList.append(47)

shoppingList.addObject(47)

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






























