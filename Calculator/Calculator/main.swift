//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

var operators = ["+", "-", "*", "/"]
var calcStatus = true

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
        print(mathResult)
        
    } else if !operators.contains(operation) {
        // placeholder for looping
    } else {
    let closureOperation = mathStuffFactory(opString: operation)
    let mathResult = closureOperation(x ?? 1.0, y ?? 1.0)
   print(mathResult)
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
        print("You got it right")
    } else {
        print("Not the right answer")
    }
}


func customMap(arr:[Double], closure: (Double) -> Double) -> [Double] {
    var transformedArr = [Double]()
    for num in arr {
        //perform transformation based on closure an append result in transformedArr
        transformedArr.append(closure(num))
    }
return transformedArr
}

//func reduce(starting: Double, input: [Double] , operatorPicked: String) -> Double {
//    var initialValue = starting
//    for int in input {
//
//    }
//    return 0
//}

func filterFunc(arr:[Double], closure:(Double) -> Bool) -> [Double] {
    var result = [Double]()
    
    for num in arr{
        if closure(num) {
            result.append(num)
        }
    }
    return result
}





print("Welcome to the calculator")
repeat {
print("enter 1 for regular function and 2 for high order functions")
    let modeSelect = readLine()?.lowercased() ?? " "
switch modeSelect {
case "1":
    print("enter a valid operation e.g x * y")
    userInput()
    
case "2":
    print("Please select a higher order function to use. Map, Reduce or Filter")
    
    let userInputsFilter = (readLine() ?? "").components(separatedBy: " ")
    let removingCommas = userInputsFilter[1].components(separatedBy: ",")
    let stringToArr = removingCommas.compactMap { Double($0) }
    let byNum = Double(userInputsFilter[4]) ?? 0
    print(userInputsFilter)
    print(stringToArr)
    if userInputsFilter[0] == "filter" {
        switch userInputsFilter[3] {
        case ">":
            print(filterFunc(arr: stringToArr, closure: {$0 > byNum}))
            
        case "<":
            print(filterFunc(arr: stringToArr, closure: {$0 < byNum}))
        default:
            print("Invalid input")
            calcStatus = true
        }
    }
        
    if userInputsFilter[0] == "map" {
        switch userInputsFilter[3] {
        case "+":
            print(customMap(arr: stringToArr, closure: {$0 + byNum}))
        case"-":
            print(customMap(arr: stringToArr, closure: {$0 - byNum}))
        case"*":
            print(customMap(arr: stringToArr, closure: {$0 * byNum}))
        case"/":
            print(customMap(arr: stringToArr, closure: {$0 / byNum}))
        default:
            print("Invalid input")
            calcStatus = true
        }
    }
            
    
default :
    print("invalid input")
    calcStatus = true
    
}
    
} while calcStatus == true



var userInputsFilter = readLine()?.components(separatedBy: " ")

let closureOperation = mathStuffFactory(opString: "+")
let result = closureOperation(45, 5)







