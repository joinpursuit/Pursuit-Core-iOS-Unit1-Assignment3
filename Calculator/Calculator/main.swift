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
//print("Enter type of calculation you want to do: 1 regular or 2 high order")
//var userAnswer = readLine() ?? "1"
//if userAnswer == "1" {
var repeatCalculation = true
var validSymbol = ["+", "-", "*", "/"]
// write a function that takes in the user response from readline and output will be the
// result of the calculation

simpleMathLoop: repeat {
    
 //var operatorString = ""
func calculateOperation(str: String) -> Double {
    let userEntryArray = str.components(separatedBy: " ") // 2 + 2 => ["2", "+", "2"]
   let operand1 = Double(userEntryArray[0]) ?? 0.0
   let operand2 = Double(userEntryArray[2]) ?? 0.0
    var operatorSymbol = userEntryArray[1] //+, -, *, /
   
    if userEntryArray.count != 3 { // 0, 1, 2
        
        print("Please only do one operation at a time and type in your equasion as this: 2 + 2 ")
        return 0.0
    } else if operatorSymbol == "?" {
        print("Guess the symbol: +, -, * or / , that should be in place of '?'")
        operatorSymbol = validSymbol.randomElement() ?? "+"
        let operationClosure = mathStuffFactory(opString: operatorSymbol)
        let result = operationClosure(operand1, operand2)
        print("\(operand1) ? \(operand2) = \(result)")
        let userEnteredSymbol = readLine()
        if userEnteredSymbol == operatorSymbol {
            print("You guessed it right! Great Job!")
            print("\(operand1) \(operatorSymbol) \(operand2) = \(result)")
        } else {
            print("Oh no! Wrong answer...😢")
            print("\(operand1) \(operatorSymbol) \(operand2) = \(result)")
        }
    }
    let operationClosure = mathStuffFactory(opString: operatorSymbol)
    let result = operationClosure(operand1, operand2)
    return result
    }
   

let userEntry = readLine() ?? ""
let resultCalculation = calculateOperation(str: userEntry)

print("\(userEntry) = \(resultCalculation)")
    
} while repeatCalculation
    
    
//} else if userAnswer == "2" {
//    print("Enter type of calculation")
//}
//
//func filterFunction(arr: [Double], closure:(Double) -> Bool) -> [Double] {
//   var result = [Double]()
//    for num in arr {
//        if closure(num){
//            result.append(num)
//        }
//    }
//return result
//}
//let userInputForHigherOrddrFunction = readLine() ?? "filter 2,5,66,3,2  by < 9"
//let userEntryFunctionArray = userInputForHigherOrddrFunction.components(separatedBy: " ")
//
//func convertStringInputToDoubles(str: String) -> [Double] {
//    var doublesFromString = [Double]()
//    let numsArrayFromUserEntry = str.components(separatedBy: ",")
//    for num in numsArrayFromUserEntry {
//        doublesFromString.append(Double(num) ?? 0.0)
//    }
//    return doublesFromString
//}
//
//let onlyDoubleArrayFromUserEntry = convertStringInputToDoubles(str: userEntryFunctionArray[1])
//let lastNumberFromUserEntry = Double(userEntryFunctionArray[4]) ?? 0.0
//
//if userEntryFunctionArray[0] == "function" {
//    if userEntryFunctionArray[3] == ">" {
//        print(filterFunction(arr: onlyDoubleArrayFromUserEntry, closure: { $0 > lastNumberFromUserEntry}))
//    } else if userEntryFunctionArray[3] == "<" {
//        print(filterFunction(arr: onlyDoubleArrayFromUserEntry, closure: { $0 < lastNumberFromUserEntry}))
//    } else {
//        print("Please write your function correctly")
//    }
//}

//func higherOrderOperation(str:)


// let validOperators: Set<Character> = ["-", "+", "*", "/", "?"]
   // let validOperands: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
//    if !validOperators.contains(Character(operatorSymbol)) {
//       print("Invalid operator")
//        return 0.0
//    } else if
//      !validOperands.contains(Character(userEntryArray[0])) {
//       print("Enter number")
//    } else if operatorSymbol == "?" {
//       operatorSymbol = String(validOperators.randomElement() ?? "+" )
//        print("guess the symbol")
//
//        let guessSymbol = readLine() ?? ""
//       if guessSymbol == operatorSymbol{
//          print("You got it!")
//      }
//       // let userEntrySymbol = validOperators
//    }
//
//
//   let mathSymbolFromUser = mathStuffFactory(opString: operatorSymbol)
//   let result = mathSymbolFromUser(operand1, operand2)
//
// } else if operatorString == "?" {
       // var randomOperation = mathStuffFactory(opString: operatorSymbol.randomElement())
    
//    let operand1 = Double(userEntryArray[0]) ?? 0.0
//    let operand2 = Double(userEntryArray[2]) ?? 0.0
//    let operatorSymbol = userEntryArray[1] //+, -, *, /
//    operatorString = operatorSymbol
//    let operationClosure = mathStuffFactory(opString: operatorSymbol)
//    let result = operationClosure(operand1, operand2)
    
    
