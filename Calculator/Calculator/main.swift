//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (_ x:Double, _ y:Double) -> Double {
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

//print(mathStuffFactory(opString: "" )(1,1))

var num1: Double = 0.0
var num2: Double = 0.0
var stringOperator = " "
var isThisADouble = false
var isThisAnotherDouble = false
var isThisAnOperator = false
//var arrayOfOperatorForRandom = ["+","-","/","*", "?"]


let validOperation = true

while validOperation {
    print("Enter a two digit operation: 5 + 5")
    let userOperation = readLine() ?? "not a value"
    
    let componentOfOperation = userOperation.components(separatedBy: " ")
    
    if let firstNum = Double(componentOfOperation[componentOfOperation.startIndex]){
        num1 = firstNum
    } else {
        print("this is not a valid entry")
        continue
    }
    if let secondNum = Double(componentOfOperation[componentOfOperation.endIndex-1]){
        num2 = secondNum
    } else {
        print("this is not a valid entry")
        continue
    }
    
    guard componentOfOperation[1] != "/" || num2 != 0 else { //still get a fatal error if I do not enter a second character - for later
        print("Invalid operation")
        continue}
    
    print(mathStuffFactory(opString: componentOfOperation[1])(num1, num2)) // proof for fatal error
    
}
