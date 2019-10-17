//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (Double, Double) -> Double {      // closure
    var opString = opString
    if opString == "?" {
        opString = ["+", "-", "", "/"].randomElement() ?? ""
    }
    switch opString {
    case "+":
        return {x, y in x + y }     // shorthand syntax
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



func builtInMap (arr: [Int], closure: (Int) -> (Int)) -> [Int] {
    var transformedArr = [Int]()
    for num in arr {
        transformedArr.append(closure(num))
    }
    return transformedArr
}

func builtInFilter (arr: [Int], filterby: Int, sign: String) -> [Int] {
    var arrFilter = [0]
    for num in arr {
        if num < filterby {
            arrFilter.append(num)
        } else if num > filterby {
            arrFilter.append(num)
        }
    }
    return arrFilter
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
        print("higher order")
        
        correctUserChoice = true
    case "?":
        print("1")
    default:
        print()
        print("Please pick a or b.")
        userChoice = readLine() ?? "a"
        correctUserChoice = false
    }
} while correctUserChoice == false
} while continueAgain == true















//repeat {
//    print("Enter you calculation")
//    let userInput = readLine() ?? "a"
//    let result = calculateOperation(str: userInput)
//    print(result)


// TODO: write code to ask the user if they want to calculate again

//} while willContinue == "yes"

