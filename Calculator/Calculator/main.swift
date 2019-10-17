//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation
//basic arithmatic
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
//calculator loop
var condition = true
var correctMath: Set<Character> = ["+", "-", "/", "*"]
var randomSymbol = "?"
let mathSymbolsArray = ["+", "-", "/", "*"]
pickCalculatorLoop: repeat {
    print("Your options are 1 regular🤓calculator or 2 ultra🧐calculator")
    var pickCalculator = readLine()
    switch pickCalculator {
    case "1" :
        print(" +  -  *  /  ? ")
        print("Enter your math problem.")
        let calculator1response = readLine() ?? "1 + 1"
        let calculator1Array = calculator1response.components(separatedBy: " ") // ["1", "+", "1"]
        if calculator1Array.count != 3 { continue pickCalculatorLoop }
        let operatorSymbol = calculator1Array[1]
        if correctMath.contains(Character(operatorSymbol)) {
            let operation = mathStuffFactory(opString: operatorSymbol)
            let result = operation(Double(calculator1Array[0]) ?? 0.0, Double(calculator1Array[2]) ?? 0.0)
            print(result)
            print("Would you like to calculate again?")
            // after creating the if else statement, none of these statements print...
        } else if calculator1Array.contains(randomSymbol) {
            let randomOperation = mathSymbolsArray.randomElement() ?? "+"
            var convertRandom = mathStuffFactory(opString: randomOperation)
            let randomCalc = convertRandom((Double(calculator1Array[0]) ?? 0.0), (Double(calculator1Array[2]) ?? 0.0))
            print(randomCalc)
        }else{
            print("Try a math problem")
        }
            case "2" :
            print("Choose an operation")
            print("a. Filter : < , >")
            print("b. Map: numbers * number , numbers / number")
            print("c. Reduce: creating a sum of numbers, multiplying an array")
        var pickCalc2options = readLine()
//            switch pickCalc2options {
//            case "a" :
//                filterResponse = readLine() ?? "1,2,3 < 4"
//            case "b" :
//
//            case "c" :
//
//            default :
//
//        }
            default :
            print("Sorry, can't do that. I'm just a calculator.")
            print("Try a math problem.")
            pickCalculator = readLine()
        }
    } while condition == true

//===============================================================================
// Ultra Calculator functions
// filter : numbers less than given number
// filter : numbers greater than given number

// user input would look like "1,6,5,4 < 3"
// convert group of numbers to an array
// convert the < or > symbol to an operation
// convert 3 to a double
var filterResponse = readLine() ?? "1,2,3 < 4"
func filterOperation(inputArray: [Double], filter: Double) {
    var filtResArr = [""]
    switch filtResArr[1] {
    case ">" :
        filtResArr = filterResponse.components(separatedBy: ">")
        for numbers in filtResArr {
            if filtResArr[0] > filtResArr[2] {
                let result = [numbers]
                print("\(result) greater than \(filtResArr[2])")
            }
    }
    case "<" :
        filtResArr = filterResponse.components(separatedBy: "<")
        for numbers in filtResArr {
            if filtResArr[0] > filtResArr[2] {
                let result = [numbers]
                print("\(result) less than \(filtResArr[2])")
        }
        }
    default:
        print("Filter only allows you to compare a group of numbers to another number")
    }
}

//===============================================================================

// Sad attempts...
//        } else {
//            print("This isn't a math problem")
//
//        }

//        regularCalc(input: regularCalculatorResponse)
//        let result = regularCalc(input: regularCalculatorResponse)
//        print(result)
//        if regularCalculatorResponse.contains(correctMathSymbols) {
//        regularCalc(input: regularCalculatorResponse)
//        let result = regularCalc(input: regularCalculatorResponse)
//        print(result)
//        } else if regularCalculatorResponse.contains("?") {
//        random(userInput: regularCalculatorResponse)
//        } else {
//            print("Sorry, can't do that. I'm just a calculator.")
//            print("Try a math problem.")
//          regularCalculatorResponse = readLine() ?? "1 + 1"
//===============================================================================
//function to turn readLine response into a math problem for regular calculator



//var regularCalculatorResponse = readLine() ?? "1 + 1"
//func regularCalc(input: String) -> (Double) {
//    let correctMathSymbols = "- + / *"
//    let regularResArr = regularCalculatorResponse.components(separatedBy: " ")
//    let number1 = Double(regularResArr[0])
//    let number2 = Double(regularResArr[2])
//    let mathSymbol = regularResArr[1]
//
//    let operation = mathStuffFactory(opString: mathSymbol)
//
//    let result = operation(number1 ?? 0.0 , number2 ?? 0.0)
//    for _ in mathSymbol {
//        if mathSymbol.contains(correctMathSymbols) {
//            print(result)
//            } else {
//            print("Use a correct math symbol: - + / *")
//            print("Try typing without spaces")
//            regularCalculatorResponse = readLine() ?? "1 + 1"
//    }
//    }
//    print(result)
//    return result
//}
//===============================================================================
//===============================================================================
//random math operation "?"



//func random(userInput: [String]) -> (Double) {
//    var calculator1response = readLine() ?? "1 + 1"
//    var calculator1Array = calculator1response.components(separatedBy: " ")
//    var randomOperation = mathSymbolSet.randomElement() ?? "+"
//    let convertRandom = mathStuffFactory(opString: randomOperation)
//    let randomCalc = convertRandom((Double(calculator1Array[0]) ?? 0.0), (Double(calculator1Array[2]) ?? 0.0))
//    return randomCalc
//}
