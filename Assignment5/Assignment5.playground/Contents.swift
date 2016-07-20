//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//func isLeap(year: Int) -> Bool {
//    if year % 100 == 0
//        {
//        return year % 400 == 0}
//    else
//        {
//             return year % 400 == 0
//        }
//    }

func isLeap(year: Int) -> Bool {
    return (year % 100 == 0) ? (year % 400 == 0) : (year % 4 == 0)
}

isLeap(1960)