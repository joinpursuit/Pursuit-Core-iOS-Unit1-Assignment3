//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func isOperator(_ operation: String) -> Bool {
    if(operation != "+" || operation != "-" || operation != "*" || operation != "/"){
        return false
    }else {
        return true
    }
}

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

var operationsMessage = """
    Select an operation from the following list:
    Type \"+\" to perform addition.
    Type \"-\" to perform subtraction.
    Type \"*\" to perform multiplication.
    Type \"\\" to perform division.
"""

var operationChoice: String = ""
var operationClosure: (Double,Double) -> (Double)

print(operationsMessage)
operationChoice = readLine() ?? ""

while (operationChoice.count != 1 || !isOperator(operationChoice)){
    if(operationChoice.count != 1){
        print("Not a valid operation.")
        print(operationsMessage)
        operationChoice = readLine() ?? ""
    }else if (!isOperator(operationChoice)){
        print("Not a valid operation.")
        print(operationsMessage)
        operationChoice = readLine() ?? ""
    }
}

print(isOperator(operationChoice))

operationClosure = mathStuffFactory(opString: operationChoice)
print(operationClosure(10,5))
