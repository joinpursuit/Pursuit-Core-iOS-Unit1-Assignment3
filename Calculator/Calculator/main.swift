//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    var opString = opString
    if opString == "?" {
        opString = ["+", "-", "", "/"].randomElement() ?? ""
    }
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

func userCalc (arr: [String]) -> Double {
    let operationClosure = mathStuffFactory(opString: arr[1])
    let result = operationClosure( Double(arr[0]) ?? 0.0 , Double(arr[2]) ?? 0.0)
    return result
}

func builtInMap (arr: [Double], closure: (Double) -> (Double)) -> [Double] {
    var transformedArr = [Double]()
    for num in arr {
        transformedArr.append(closure(num))
    }
    return transformedArr
}

func builtInFilter (arr:[Double], closure:(Double) -> Bool) -> [Double] {
    var filterResult = [Double]()
    for num in arr {
        if closure(num) {
            filterResult.append(num)
        }
    }
    return filterResult
}

func builtInReduce (arr: [Double], closure: (Double) -> (Double)) -> Double {
    var reduceResult = 0.0
    for num in arr {
        reduceResult += num
    }
    return reduceResult
}

var randomMath: Set<Character> = ["?"]
var randomOperation: Set<Character> = ["+","-","*","/"]
var continueAgain = true

continueloop: repeat {
    
    print("Hello welcome to my calculator. Type \"a\" regular function and type \"b\" for higher order?")
    
    var userChoice = readLine() ?? "a"
    
    var correctUserChoice = true
    
    var againLoop = true
    
    calculatoroperation: repeat {
        switch userChoice {
        case "a":
            print()
            print("Regular function includes (+,-,*, /) operations. Write your operation below.")
            print()
            againloop: repeat {
                
                let userInput = readLine() ?? "a"
                var userInputArr = userInput.components(separatedBy: " ")
                
                if userInputArr.count != 3 {
                    
                    print("Please enter a valid operation. Eg 5 - 1 😬")
                    print()
                    
                } else {
                    print()
                    let result = userCalc(arr: userInputArr)
                    print(result)
                    print()
                    print("calculate again? Yes or no")
                    
                    let userContinue = readLine()?.lowercased() ?? "a"
                    
                    if userContinue == "yes" {
                        print()
                        continue continueloop
                    } else {
                        print()
                        print("Thanks for trying out my calculator.")
                        againLoop = false
                        continueAgain = false
                    }
                }
            } while againLoop
            correctUserChoice = true
            
        case "b":
            
            print()
            print("Welcome to the higher order function section eg: \"filter 1,2,3,4,5 by < 7\"")
            print()
            let userHighOrder = readLine() ?? "a"
            let userHighArr = userHighOrder.components(separatedBy: " ")
            let numAsArr = userHighArr[1].components(separatedBy: ",")
            let numAsDouble = numAsArr.map{ Double($0) ?? 0.0 }
            let num = Double(userHighArr[4]) ?? 0.0
            
            if userHighArr[0] == "map" {
                switch userHighArr[3] {
                case "*":
                    let mapResult = builtInMap(arr: numAsDouble, closure: {$0 * num})
                    print()
                    print(mapResult)
                case "-":
                    let mapResult = builtInMap(arr: numAsDouble, closure: {$0 - num})
                    print()
                    print(mapResult)
                case "+":
                    let mapResult = builtInMap(arr: numAsDouble, closure: {$0 + num})
                    print()
                    print(mapResult)
                case "/":
                    let mapResult = builtInMap(arr: numAsDouble, closure: {$0 / num})
                    print()
                    print(mapResult)
                default:
                    print("yup")
                }
            }
            else if userHighArr[0] == "filter" {
                switch userHighArr[3] {
                case "<":
                    let filterAns = builtInFilter(arr: numAsDouble, closure: {$0 < num})
                    print()
                    print(filterAns)
                case ">":
                    let filterAns = builtInFilter(arr: numAsDouble, closure: {$0 > num})
                    print()
                    print(filterAns)
                default:
                    print("yup")
                }
            }
            else if userHighArr[0] == "reduce" {
                switch userHighArr[3] {
                case "+":
                    let reduceAns = builtInReduce(arr: numAsDouble, closure: {$0 + num})
                    print()
                    print(reduceAns + num)
                case "*":
                    let reduceAns = builtInReduce(arr: numAsDouble, closure: {$0 * num})
                    print()
                    print(reduceAns * num)
                default:
                    print("yup")
                }
            }
            correctUserChoice = true
        default:
            print()
            print("Please pick a or b.")
            userChoice = readLine() ?? "a"
            correctUserChoice = false
        }
    }
        while correctUserChoice == false
}
    while continueAgain == true

