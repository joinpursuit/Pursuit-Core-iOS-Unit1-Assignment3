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

//function to turn readLine response into a math problem for regular calculator

//var regularResponse = readLine() ?? "1 + 1"
//var regularResArr = regularResponse.components(separatedBy: " ")
//var mathSymbol = regularResArr[1]
//var number1 = Double(regularResArr[0])
//var number2 = Double(regularResArr[2])
//var operation = mathStuffFactory(opString: mathSymbol)
//var result = operation(number1 ?? 0 , number2 ?? 0)
var regularResponse = readLine() ?? "1 + 1"
var correctMathSymbols = "+-/*"
func regularCalc(input: String) -> (Double) {
    regularResponse = readLine() ?? "1 + 1"
    var regularResArr = regularResponse.components(separatedBy: " ")
    var mathSymbol = regularResArr[1]
    var number1 = Double(regularResArr[0])
    var number2 = Double(regularResArr[2])
    var operation = mathStuffFactory(opString: mathSymbol)
    var result = operation(number1 ?? 0 , number2 ?? 0)
    for _ in mathSymbol {
        if mathSymbol.contains(correctMathSymbols) {
            print(result)
        } else {
            print("Use a correct math symbol: - + / *")
            regularResponse = readLine() ?? "1 + 1"
        }
    }
    return result
}

//random element
var randomOperation = ""
let mathSymbolSet: Set<String> = ["+", "-", "/", "*"]
func random(userInput: String) -> (Int) {
    for _ in mathSymbolSet {
        randomOperation = mathSymbolSet.randomElement() ?? "+"
    }
    return
}


//calculator loop

var condition = false
pickCalculatorLoop: repeat{
    var pickCalculator = readLine()
    print("What do you need right now buddy? 1 (regular🤓calculator) or 2 (ultra🧐calculator)")
    switch pickCalculator{
    case "1" :
        print(" +  -  *  /  ? ")
        print("Enter your math problem.")
        regularResponse = readLine() ?? "1 + 1"
        regularCalc(input: regularResponse)
        
    case "2" :
        print("Choose an operation")
        print("a. Filter")
        print("b. Map")
        print("c. Reduce")
        // new readline for ultra
        // new function
        
    default :
        print("Sorry can't do that. I'm just a simple calculator.")
        pickCalculator = readLine()
        
    }
} while condition == true



