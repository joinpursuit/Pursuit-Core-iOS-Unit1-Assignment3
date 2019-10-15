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
func getUserInput () -> String {
    guard let userInput = readLine() else {
        return "You did not enter a valid response"
    }
    return userInput
}
//regularCalc used to create regular
func regularCalc() {
    
}

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

