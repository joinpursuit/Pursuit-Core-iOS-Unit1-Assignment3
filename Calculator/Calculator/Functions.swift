//
//  Functions.swift
//  Calculator
//
//  Created by Jian Ting Li on 11/1/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

//part1 functions
func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    switch opString {
    case "+":
        return {x, y in x + y }
    case "-":
        return {x, y in x - y }
    case "*":
        return {x, y in x * y }
    case "/":
        return {x, y in x / y }
    default:
        return {x, y in x + y }
    }
}   //this one is also used in part2

func numsCheckFromString(num1: String, num2: String) -> Bool {
    if let _ = Int(num1), let _ = Int(num2) {
        return true
    }
    return false
}

func calculationFromString(strNum1: String, strNum2: String, instruction: (Double, Double) -> Double) -> Double {
    guard let strNum1Unwrap = Double(strNum1), let strNum2Unwrap = Double(strNum2) else {return 0}
    return instruction(strNum1Unwrap, strNum2Unwrap)
}



//part2 functions
func customFilter(arr: [Double], givenValue: Double, filter: (Double, Double) -> Bool) -> [Double] {
    var output = [Double]()
    for num in arr {
        if filter(num, givenValue) {
            output.append(num)
        }
    }
    return output
}

let greaterThanNum = { (arrNum: Double, comparingNum: Double) -> Bool in
    return arrNum > comparingNum
}

let lessThanNum = { (arrNum: Double, comparingNum: Double) -> Bool in
    return arrNum < comparingNum
}



func customMap(arr: [Double], instruction: (Double) -> Double) -> [Double] {
    var output = [Double]()
    for num in arr {
        output.append(instruction(num))
    }
    return output
}

func customMapMathFactory(operatorStr: String, givenValue: Double) -> (Double) -> Double {
    switch operatorStr {
    case "+":
        return { (arrNum: Double) -> Double in return arrNum + givenValue}
    case "-":
        return { (arrNum: Double) -> Double in return arrNum - givenValue}
    case "*":
        return { (arrNum: Double) -> Double in return arrNum * givenValue}
    case "/":
        return { (arrNum: Double) -> Double in return arrNum / givenValue}
    default:
        return { (arrNum: Double) -> Double in return arrNum + givenValue}
    }
}



func customReduce( arr: [Double], initial: Double, reduce: (Double, Double) -> Double) -> Double {
    var currentValue = initial
    var nextValue = 0.0
    for num in arr {
        nextValue = num
        currentValue = reduce(currentValue, nextValue)
    }
    return currentValue
}



func checkStrNumsInArr(arr: [String]) -> Bool {
    for strNum in arr {
        if let _ = Double(strNum) {
            continue
        } else {
            return false
        }
    }
    return true
}
