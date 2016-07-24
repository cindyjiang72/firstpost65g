//: Playground - noun: a place where people can play

import UIKit


func isLeap(year: Int) -> Bool {
    return (year % 100 == 0) ? (year % 400 == 0) : (year % 4 == 0)
}



let regular = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30]
let leap = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30]

func julianDate(year:Int, month: Int, day: Int) -> Int {

    return (1900..<year).reduce(0){isLeap($1) ? $0 + 366 : $0 + 365}
        + (isLeap(year) ? leap[0...month-1].reduce(0){$0 + $1} : regular[0...month-1].reduce(0){$0 + $1}) + day

}

julianDate(1960, month: 9, day: 28)
julianDate(1900, month: 1, day: 1)
julianDate(1900, month: 12, day: 31)
julianDate(1901, month: 1, day: 1)
julianDate(1901, month: 1, day: 1) - julianDate(1900, month: 1, day: 1)
julianDate(2001, month: 1, day: 1) - julianDate(2000, month: 1, day: 1)

isLeap(1960)
isLeap(1900)
isLeap(2000)
