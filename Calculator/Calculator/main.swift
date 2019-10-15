//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

// returns a closure... then a Double
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

// ASK THE USER WHETHER THEY WANT A PROBLEM LVL 1 or LVL 2

print("Enter a type of calculation, 1 (regular) or 2 (higher order)")
let userResponse = readLine()?.lowercased() ?? ""

    switch userResponse {
    case "1":
        sleep(1)
        print()
        print("Enter your operation. (Ex: 5 * 2)")
        let userInput = readLine() ?? ""
        let userInputArr = userInput.components(separatedBy: " ")


        let closureOperation = mathStuffFactory(opString: userInputArr[1])
        let result = closureOperation(Double(userInputArr[0]) ?? 0.0,(Double(userInputArr[2]) ?? 0.0))

        print("result of operation is \(result)")
    case "2":
        sleep(1)
        print()
        print("Enter your operation. (Ex: 1,2,3,6,4,3,6,8,9,4 by < 5)")
    default:
      print("Please enter a valid response! 🤬")
    }

//let userInput = readLine() ?? ""
//var userInputArr = userInput.components(separatedBy: " ")
//
//
//let closureOperation = mathStuffFactory(opString: userInputArr[1])
//let result = closureOperation(Double(userInputArr[0]) ?? 0.0,(Double(userInputArr[2]) ?? 0.0))
//
//print("result of operation is \(result)")


//var operations: ([String: (Double, Double) -> Double]) = [
//    "+": { $0 + $1 },
//    "-": { $0 - $1 },
//    "*": { $0 * $1 },
//    "/": { $0 / $1 }
//]
