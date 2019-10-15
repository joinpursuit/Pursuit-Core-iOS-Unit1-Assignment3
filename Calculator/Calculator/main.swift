//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (Double, Double) -> Double {      // closure
  switch opString {
  case "+":
    return {x, y in x + y }     // shorthand syntax
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

print("Hello welcome to my calculator")
print()



var userInput = readLine() ?? "a"
//var userInputArr = userInput.components(separatedBy: " ")

//let operationClosure = mathStuffFactory(opString: userInputArr[1])
//let result = operationClosure( Double(userInputArr[0]) ?? 0.0 , Double(userInputArr[2]) ?? 0.0)



// write a function that takes a string and returns a double
// sepearte the string into an array
func validCount(in str: String) -> Double {
    var userInputArr = userInput.components(separatedBy: " ")
    if userInputArr.count == 3 {
        let operationClosure = mathStuffFactory(opString: userInputArr[1])
        let result = operationClosure( Double(userInputArr[0]) ?? 0.0 , Double(userInputArr[2]) ?? 0.0)
        return result
    }
    else {
    print("Type in a number followed by an operation followed by a number.")
        userInput = readLine() ?? "a"
    }
    return 0.0
}






