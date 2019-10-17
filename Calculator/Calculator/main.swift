//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
  switch opString {
  case "+":
    return {x, y in x + y } // short hand closure sequence
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

/*
let closureOperation = mathStuffFactory(opString: "+")
let result = closureOperation(45, 5)
print("result of operation is:", result)
*/

//var operations: ([String: (Double, Double) -> Double]) = ["+": { $0 + $1 },
//"-": { $0 - $1 },
//"*": { $0 * $1 },
//"/": { $0 / $1 }]

func getUserInput () -> String {
    guard let userInput = readLine() else {
        return "You did not enter a valid response"
    }
    return userInput
}

//regularCalc used to create regular calculations
func regularCalc() {
    print("Enter your operation. e.g 5 + 3")
    let userReadline = getUserInput()
    
    let operatorsArr:[Character] = ["+", "-", "*", "/", "?"]
    
    //value used to set a default operand if no operand exists
    var operatorChar:Character = "X"
    var operandsString = [String]()
    
    //trims the string for consistancy of at least 3 characters
    let trimmedUserReadLine = userReadline.replacingOccurrences(of: " ", with: "")
    print(trimmedUserReadLine)
    
    
    //checks to see if a operator is existant
    var operatorCheck = false
    for operators in operatorsArr {
        if trimmedUserReadLine.contains(operators){
            operatorCheck = true
            break
        } else {
            operatorCheck = false
        }
        //guard attempt of checking if userEntered an operator
//        guard trimmedUserReadLine.contains(operators) else {
//            //regularCalc()
//            return print("Operator not found to evaluate the given input: \(userReadline). Consider using the operators: +, -, *, /, or ?")
//        }
    }
    
    // if operator exists the rest of the code is run
    guard operatorCheck
    else {
        return print("Operator not found to evaluate the given input: \(userReadline). Consider using the operators: +, -, *, /, or ?")
    }
        
    //gets operator
    for char in trimmedUserReadLine {
        if operatorsArr.contains(char){
            operatorChar = char
        }
    }
    
    //gets the operands of a expression as data type string and store them into an array
    
    //another way of getting the operands via trimmedString:
    
    
    operandsString = trimmedUserReadLine.components(separatedBy: String(operatorChar))
    
    //gets operands as an Int and store them to an array of Int
    let operandsDoubleArr = operandsString.compactMap{Double($0)}
    
    guard operandsDoubleArr.count >= 2 else {
        return print("User did not enter at least 2 integers to evaluate the given expression")
    }
    
    print("The operator char is:", operatorChar)
    print("The operands are:", operandsDoubleArr)
    
    //return userReadline
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

