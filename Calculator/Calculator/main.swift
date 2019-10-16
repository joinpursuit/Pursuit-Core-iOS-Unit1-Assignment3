//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

var operators = ["+", "-", "*", "/"]




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

func userInput() {
    let userOperation = readLine()?.components(separatedBy: " ") ?? [" "]
    let x = Double(userOperation[0])
    let y = Double(userOperation[2])
    let operation = userOperation[1]
    var mathResult = 0.0
    if operation == "?" {
    guard let x = x, let y = y else {
            print("Invalid inputs")
            return
        }
        mathResult = randomOperator(x: x, y: y, operatorSign: operation)
        print("\(x) \(operation) \(y) = \(mathResult)")

    } else if !operators.contains(operation) {

    } else {
    let closureOperation = mathStuffFactory(opString: operation)
    let mathResult = closureOperation(x ?? 1.0, y ?? 1.0)
   print("\(String(describing: x)) \(operation) \(String(describing: y)) = \(mathResult)")
    }
}

func randomOperator(x: Double, y: Double, operatorSign: String) -> Double{
    var result = 0.0
    guard let randomOperator = operators.randomElement() else {
        return 0.0
    }
     let closureOperation = mathStuffFactory(opString: randomOperator)
     result = closureOperation(x, y)
    print(result)
    guessingGame(operation: randomOperator)
    
    
    return result
}

func guessingGame(operation: String) {
    guard let userGuessSign = readLine() else {
        print("invalid input")
        return
    }
    
    guard operators.contains(userGuessSign) else {
        print("This is not a valid mathematical operator")
        return
    }
    
    if userGuessSign == operation {
        print("You got it write")
    } else {
        print("Not the right answer")
    }
}

//calculator loop:
print("Welcome to the calculator")
print("enter 1 for regular function and 2 for high order functions")
var modeSelect = readLine()?.lowercased() ?? " "
switch modeSelect {
case "1":
    print("enter a valid operation e.g x * y")
    userInput()
    
case "2":
    break
    
default :
    break
}
    






let closureOperation = mathStuffFactory(opString: "+")
let result = closureOperation(45, 5)





