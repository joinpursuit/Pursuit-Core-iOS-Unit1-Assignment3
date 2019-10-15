//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    //var opString =
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
//let closureOperation = mathStuffFactory(opString: "+")
//let result = closureOperation(45, 5)
//print(result)
//
//
print("This is a calculater, please enter a simple math problem to see the result")
var repeatCalculation = true

// write a function that takes in the user response from readline and output will be the
// result of the calculation

simpleMathLoop: repeat {
    
 var operatorString = ""
func calculateOperation(str: String) -> Double {
    let userEntryArray = str.components(separatedBy: " ") // 2 + 2 => ["2", "+", "2"]
   let operand1 = Double(userEntryArray[0]) ?? 0.0
   let operand2 = Double(userEntryArray[2]) ?? 0.0
   let operatorSymbol = userEntryArray[1] //+, -, *, /
    let validOperators: Set<Character> = ["-", "+", "*", "/", "?"]

    
    if !validOperators.contains(Character(operatorSymbol)) {
       print("Invalid operator")
        return 0.0
    }
    
    
   let operationClosure = mathStuffFactory(opString: operatorSymbol)
   let result = operationClosure(operand1, operand2)
   
    if userEntryArray.count != 3 { // 0, 1, 2
        
        print("Please type in your equasion as this: 2 + 2 ")
        return 0.0
   // } else if operatorString == "?" {
       // var randomOperation = mathStuffFactory(opString: operatorSymbol.randomElement())
    }
//    let operand1 = Double(userEntryArray[0]) ?? 0.0
//    let operand2 = Double(userEntryArray[2]) ?? 0.0
//    let operatorSymbol = userEntryArray[1] //+, -, *, /
//    operatorString = operatorSymbol
//    let operationClosure = mathStuffFactory(opString: operatorSymbol)
//    let result = operationClosure(operand1, operand2)
    
    return result
}

let userEntry = readLine() ?? ""


        let resultCalculation = calculateOperation(str: userEntry)

        print("\(userEntry) = \(resultCalculation)")
    


} while repeatCalculation

