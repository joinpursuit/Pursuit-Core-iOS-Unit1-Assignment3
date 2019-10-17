//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    var opString = opString
    if opString == "?" {
        opString = ["+", "-", "*", "/"].randomElement() ?? "*"
    }
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

func arithemticCalcution(in input: String) -> Double {
    let seperator = input.components(separatedBy: " ")
    var result = 0.0
    if seperator.count != 3 {
        print("Please enter an equation. Example: 7 + 2")
    } else {
        let opString = seperator[1]
        let closureOperation = mathStuffFactory(opString: opString)
        result = closureOperation(Double(seperator[0]) ?? 0.0 , Double(seperator[2]) ?? 0.0)
    }
    
    return result
}

print("""
Welcome to the calculator.
Please enter "1" for normal operations.
Enter "2" for higher order operations.
""")

var userChoice = readLine()
var decision = Int(userChoice!) ?? 1
decision = Int(userChoice!) ?? 2

if decision == 1{
    print("Please enter an equation. Example: 5 + 2 ")
    let userInput = readLine() ?? "0"
    let result = arithemticCalcution(in: userInput)
    print(result)
}








