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

//let result = closureOperation(45, 5)
print("Welcome! Please enter an equation. Example: 5 + 2 ")
var userInput = readLine() ?? "0"
var seperator = userInput.components(separatedBy: " ")
let closureOperation = mathStuffFactory(opString: "+")
let result = closureOperation(Double(seperator[0]) ?? 0.0 , Double(seperator[2]) ?? 0.0)



print("result of operation is: \(result)")
//result
func str (in input: [String]) -> Double {

    if userInput.count == 3 {
        return result
    }
    else{
        userInput = readLine() ?? "0"
        print("Please enter an equation. Example: 7 + 2")
    }
    return 0.0
}





