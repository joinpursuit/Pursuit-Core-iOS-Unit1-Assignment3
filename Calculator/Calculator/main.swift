//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

//func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
//  switch opString {
//  case "+":
//    return {x, y in x + y } // short hand closure sequence
//  case "-":
//    return {x, y in x - y }
//  case "*":
//    return {x, y in x * y }
//  case "/":
//    return {x, y in x / y }
//  default:
//    return {x, y in x + y }
//  }
//}

/*
let closureOperation = mathStuffFactory(opString: "+")
let result = closureOperation(45, 5)
print("result of operation is:", result)
*/

var operations: ([String: (Double, Double) -> Double]) = ["+": { $0 + $1 },
"-": { $0 - $1 },
"*": { $0 * $1 },
"/": { $0 / $1 }]

func getUserInput () -> String {
    guard let userInput = readLine() else {
        return "You did not enter a valid response"
    }
    return userInput
}

//regularCalc used to create regular calculations
func regularCalc() -> String {
    print("Enter your operation. e.g 5 + 3")
    let userReadline = getUserInput()
    
    let operands:Set = ["+", "-", "*", "/", "?"]
    
    //value used to set a default operand if no operand exists
    var operand:Character = "X"
    let trimmedUserReadLine = userReadline.replacingOccurrences(of: " ", with: "")
    
    //trims the string for consistancy of at least 3 characters
    print(trimmedUserReadLine)


    //gets operand
    for char in trimmedUserReadLine {
        if operands.contains(String(char)){
            operand = char
        } else {
            return "User did not enter an operand to evaluate an expression. Consider using +, -, *, /, or ? as operands"
        }
        
    }
    print(operand)
    
    return userReadline
}

//highOrderCalc used to create high order calculations
func highOrderCalc() {
    
}

// loop should start here
//Start of calculator to prompt user response
print("Enter type of calculation, 1 (regular) or 2 (high order)")
var validCalcChoice = Int()
if let calcChoice = Int(getUserInput()) {
    validCalcChoice = calcChoice
} else {
    print("User did not enter a valid integer response")
}

//begining of branch between regular and high order function
switch validCalcChoice{
case 1:
    regularCalc()
case 2:
    highOrderCalc()
default:
    print("User did not enter a valid integer response to choose between type of calculation, 1 (regular) or 2 (high order)")
}

