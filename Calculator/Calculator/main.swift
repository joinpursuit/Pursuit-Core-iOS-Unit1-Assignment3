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

// dictionary of shorhand closures to do operations
var operations: ([String: (Double, Double) -> Double]) = ["+": { $0 + $1 },
"-": { $0 - $1 },
"*": { $0 * $1 },
"/": { $0 / $1 },
"?": {
    
        let randomOperand = Int.random(in: 0...3)
        var operandKey = ""
        if randomOperand == 0   {
            operandKey = "+"
            return $0 + $1
        }
        else if randomOperand == 1  {
            operandKey = "-"
            return $0 - $1
        }
        else if randomOperand == 2  {
            operandKey = "*"
            return $0 * $1
        }
        else    {
            operandKey = "/"
            return $0 / $1
        }
    }
]

/*
func guessOperator(operandQ : String, operand : String)    {
    var operatorGuess = ""
    if operandQ == "?"   {
        print("Guess operator")
        operatorGuess = readLine() ?? ""
    }
    repeat{ if operatorGuess == operand {
        print("Correctomundo")
    }
    else    {print("Try Again")}
    } while operatorGuess != operand
}
*/

// prompt user for entry
print("Enter your operation, e.g 5 + 3")

// store entered string
let userEntry : String = readLine() ?? ""


// split user entry into array
var entryParts = userEntry.components(separatedBy: " ")

print(entryParts)

// variable for each element
let firstTermArray = Double(entryParts[0])
let secondTermArray = Double(entryParts[2])
let operandArray = entryParts[1]

//  store array variables in tupple to access separate parts
let operationString : (termOne : Double?, termTwo : Double?, operand : String)
operationString = (firstTermArray, secondTermArray, operandArray)
let firstTermTuple = operationString.0
let secondTermTuple = operationString.1
let operandTuple = operationString.2

print(operationString)

// function, takes  paramaters of sparsed string to determine key for dictionary of closures
// and perform according operation closure

func basicCalculation(operandEntry : String?, termOne : Double?, termTwo : Double?, operationsClosure: ([String: (Double, Double) -> Double])) -> Double {
    
    var result = 0.0
    if let operate = operations[operandEntry ?? ""]    {
        result = operate(termOne ?? 0, termTwo ?? 0)
    }
    
    return result
}


// call function use tuple parts for necessary arguments for function into dictionary closure
print(basicCalculation(operandEntry: operandTuple, termOne : firstTermTuple, termTwo: secondTermTuple, operationsClosure: operations))


/*
let closureOperation = mathStuffFactory(opString: "+")
let result = closureOperation(45.0, 5.0)
print("result of operation is \(result)")
*/

//if let validTermOne = operationString.0 {}

// user will enter something like 5 + 3
// let array = str.components(separatedBy: ", ")
