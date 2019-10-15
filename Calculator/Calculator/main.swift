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

let closureOperation = mathStuffFactory(opString: "+")

let result = closureOperation(45, 5)

// ASK THE USER WHETHER THEY WANT A PROBLEM LVL 1 or LVL 2

print("Enter a type of calculation, 1 (regular) or 2 (higher order)")
let userResponse = readLine()?.lowercased() ?? ""

func questionLevel(level: Int) -> (String) {
    switch level {
    case 1:
        sleep(1)
        print("Enter your operation. Ex: 5 * 2")
    case 2:
        sleep(1)
        print("Enter your operation. Ex: 1,2,3,6,4,3,6,8,9,4 by < 5")
    default:
        print("Please enter a valid response! 🤬")
    }
}

print("result of operation is \(result)")
