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
    case "+": //A
        return {x, y in x + y } //B
    case "-":
        return {x, y in x - y }
    case "*":
        return {x, y in x * y }
    case "/":
        return {x, y in x / y }
    default:
        return {x, y in x + y } // if we use $ it will use +
    }
}

var count = 0

print("Welcome to calculator!")
print("Pick a) for calculator or pick b) for functions:")

var userAnswer = readLine() ?? "a"

if userAnswer == "a" {
    print("""
        You can do a simple math by entering two numbers and perform simple math operations with them, e.g. 2 + 2 or 3 * 5 to see the result.
        OR
        You can enter numbers with \"?\" between two numbers and you will have to guess what symbol was used in the calculation.
        """)
    
    var validSymbol = ["+", "-", "*", "/"]
    var repeatCalculation = true
    
    mathLoop: repeat {
        func calculateOperation(str: String) -> Double { //why taking string but not int?
            let userEntryArray = str.components(separatedBy: " ")
            
            let operand1 = Double(userEntryArray[0]) ?? 0.0
            let operand2 = Double(userEntryArray[2]) ?? 0.0
            var operatorSymbol = userEntryArray[1]
            if userEntryArray.count != 3 {
                print("Please type in your equation as in example: 2 + 2 or something similar.")
                return 0.0
            } else if operatorSymbol == "?" {
                print("Guess what operation was perforn on entered numbers.")
                operatorSymbol = validSymbol.randomElement() ?? "+"
                let operationClosure = mathStuffFactory(opString: operatorSymbol)
                let result = operationClosure(operand1, operand2)
                //            print(result)
                print("\(operand1) ? \(operand2) = \(result)")
                
                let enteredSymbol = readLine()
                
                //If they are equal
                if enteredSymbol == operatorSymbol {
                    print("You are right!")
                    print("\(operand1) \(operatorSymbol) \(operand2) = \(result) is equal to:")
                    
                } else {
                    print("Bad guess! It was \(operatorSymbol).")
                    print("\(operand1) \(operatorSymbol) \(operand2) = \(result) that equals to:")
                }
            }
            let operationClosure = mathStuffFactory(opString: operatorSymbol)
            let result = operationClosure(operand1, operand2)
            return result
        }
        let userEntry = readLine() ?? " "
        let resultCalculation = calculateOperation(str: userEntry)
        print("\(userEntry) = \(resultCalculation)")
    } while repeatCalculation
} else if userAnswer == "b" {
    print("""
    Please enter numbers in the following format:
    for FILTER function use format: \"filter 3,5,7,8 by < 7\".
    for MAP function (multiply or devide by number) use format: \"map 1,3,5,7,12 by * 3\".
    for REDUCE function (summing or multiplying numbers starting at a given value) use format: \"reduce 2,54,6,32,115 by + 4\".
    Remember to write word \"filter\", \"map\" or \"reduce\" before your input and no spaces between numbers!
    """)
    
    var repeatFunction = true
    
    functionLoop: repeat {
        let userInput = readLine() ?? "filter 3,4,5,6,90,1 by < 5"
        
        func converStrigNumbersToDouble(str:String) -> [Double] {
            var doublesFromString = [Double]()
            let someNewArray = str.components(separatedBy: ",") // ["3","4","5","6","90","1"]
            for num in someNewArray {
                
                doublesFromString.append(Double(num) ?? 0.0)
            }
            
            return doublesFromString
        }
        
        
        let userEntryArray = userInput.components(separatedBy: " ")
        
        if userEntryArray.count != 5 {
            print("""
            Please enter numbers in the following format:
            for FILTER function use format: \"filter 3,5,7,8 by < 7\".
            for MAP function (multiply or devide each number) by another number use format: \"map 1,3,5,7,12 by * 3\".
            for REDUCE function (summing or multiplying numbers starting at a given value) use format: \"reduce 2,54,6,32,115 by + 10\".
            """)
        }
        
        let funcOperand2 = Double(userEntryArray[4]) ?? 0.0
        var funcOperatorSymbol = userEntryArray[3]
        
        let onlyDoubleArray = converStrigNumbersToDouble(str: userEntryArray[1])//[3.0,4.0,5.0,6.0,90.0,1.0]
        
        if userEntryArray[0] == "filter" {
            func filterFunction(arr: [Double], closure: (Double) -> Bool) -> [Double] {
                var result = [Double]()
                for num in arr {
                    if closure(num) {
                        result.append(num)
                    }
                }
                return result
            }
            if userEntryArray[3] == "<" {
                let lastStringNumber = Double(userEntryArray[4]) ?? 0.0
                print(filterFunction(arr: onlyDoubleArray, closure: {$0 < lastStringNumber}))
            } else if userEntryArray[3] == ">" {
                let lastStringNumber = Double(userEntryArray[4]) ?? 0.0
                print(filterFunction(arr: onlyDoubleArray, closure: {$0 > lastStringNumber}))
            } else {
                print("Write your equation in similar format to \"filter 3,5,7,8 by < 7\".")
            }
        } else if userEntryArray[0] == "map" {
            if userEntryArray[3] == "*" {
                func mapMultFunction(arr: [Double], closure: (Double)) -> [Double] {
                    var multResult = [Double]()
                    for num in arr {
                        multResult.append(num * closure)
                    }
                    return multResult
                }
                print(mapMultFunction(arr: onlyDoubleArray, closure: funcOperand2))
            } else if userEntryArray[3] == "/" {
                func mapDivFunction(arr: [Double], closure: (Double)) -> [Double] {
                    var divResult = [Double]()
                    for num in arr {
                        divResult.append(num / closure)
                    }
                    return divResult
                }
                print(mapDivFunction(arr: onlyDoubleArray, closure: funcOperand2))
            } else {
                print("Write your equation in similar format to \"map 3,5,7,8 by * 3\".")
            }
        } else if userEntryArray[0] == "reduce" {
            if userEntryArray[3] == "*" {
                func reduceMultFunction(arr: [Double], closure: Double) -> Double {
                    var reduceMultResult = Double()
                    reduceMultResult = arr.reduce(1, *) * closure
                    return reduceMultResult
                }
                print(reduceMultFunction(arr: onlyDoubleArray, closure: funcOperand2))
            } else if userEntryArray[3] == "+" {
                func reduceAddFunction(arr: [Double], closure: (Double)) -> Double {
                    
                    var reduceAddResult = Double()
                    reduceAddResult = arr.reduce(0, +) + closure
                    return reduceAddResult
                }
                print(reduceAddFunction(arr: onlyDoubleArray, closure: funcOperand2))
            } else {
                print("Write your equation in similar format to \"reduce 2,54,6,32,115 by + 10\".")
            }
        }
    } while repeatFunction
}

















