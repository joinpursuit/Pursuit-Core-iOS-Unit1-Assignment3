//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

var operators = ["+", "-", "*","/"]

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
    let userOperation = readLine()?.components(separatedBy: " ")
    let x = Double(userOperation?[0] ?? "1.0")
    let y = Double(userOperation?[2] ?? "1.0")
    var operation = userOperation?[1] ?? " "
    if operation == "?" {
        operation = operators.randomElement() ?? "+"
        var closureOperation = mathStuffFactory(opString: operation)
        let randomValue = closureOperation(x ?? 1.0, y ?? 1.0)
    } else  if operation != operators.description {
        print("enter a valid operator")
    } else {
    let closureOperation = mathStuffFactory(opString: operation)
    let result = closureOperation(x ?? 1.0, y ?? 1.0)
    print(result)
}
}

func randomOperator() {
    
}




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





