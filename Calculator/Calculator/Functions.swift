//
//  Functions.swift
//  Calculator
//
//  Created by Jian Ting Li on 11/1/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

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
}

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

func customMap(_ arr: [Int], _ instruction: (Int) -> Int) -> [Int] {
    var output = [Int]()
    for num in arr {
        output.append(instruction(num))
    }
    return output
}

func customFilter(_ arr: [Int], _ filter: (Int) -> Bool) -> [Int] {
    var output = [Int]()
    for num in arr {
        if filter(num) {
            output.append(num)
        }
    }
    return output
}

func customReduce(_ arr: [Int], _ initial: Int, _ reduce: (Int, Int) -> Int) -> Int {
    var currentValue = initial
    var nextValue = 0
    for num in arr {
        nextValue = num
        currentValue = reduce(currentValue, nextValue)
    }
    return currentValue
}
