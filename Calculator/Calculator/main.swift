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

// MAP FUNCTION
      
    func userMap (arr: [Double], closure: (Double) -> (Double)) -> [Double] {
        var transformedArr = [Double]()
        for num in arr {
        transformedArr.append(closure(num))
    }
        return transformedArr
}

// FILTER FUNCTION
    func filterFunc(arr:[Double], closure:(Double) -> Bool) -> [Double] {
        var filterResult = [Double]()
        for num in arr {
            if closure(num) {
                filterResult.append(num)
            }
        }
        return filterResult
       }

// REDUCE FUNCTION
func reduceFunc(arr:[Double], closure:(Double) -> Double) -> Double {
    var reduceResult = Double()
    for num in arr {
        reduceResult += num
    }
    return reduceResult
}

let userTurns = 1

repeat {
    
    print()
    print("Enter a type of calculation, 1 (regular) or 2 (higher order)")
    let userResponse = readLine()?.lowercased() ?? ""
    switch userResponse {
        
        
    case "1":
        
        sleep(1)
        print()
        print("Enter your operation. (Ex: 5 * 2)")
        
        
        // VARIABLES FOR QUESTION MARK OPERATION
        let randomOperator = ["+", "-", "*", "/", "%"]
        let questionMark: Set<Character> = ["?"]
        // REGULAR ARITHMETIC VARIABLES
        let userInput = readLine() ?? ""
        let userInputArr = userInput.components(separatedBy: " ")
        let operatorSymbol = userInputArr[1]
        
        // IF STATEMENT FOR REGULAR MATH OPERTATIONS / RANDOM ? OPERATION
        if questionMark.contains(Character(operatorSymbol)) {
        let randomOperation = randomOperator.randomElement() ?? "+"
        let convertRandom = mathStuffFactory(opString: randomOperation)
        let randomCalculation = convertRandom((Double(userInputArr[0]) ?? 0.0),(Double(userInputArr[2]) ?? 0.0))
        print("result of your operation is \(userInput) = \(randomCalculation)")
        } else {
            let closureOperation = mathStuffFactory(opString: userInputArr[1])
            let result = closureOperation(Double(userInputArr[0]) ?? 0.0,(Double(userInputArr[2]) ?? 0.0))
            
            print("result of your operation is \(userInput) = \(result)")
            print()
        }
        
        //CASE TWO (HIGHER FUNCTION
        case "2":
               sleep(1)
               print()
               print("Enter your operation. (Ex: filter 1,2,3,6,4,3,6,8,9,4 by < 5)")
        
        // MAP
        let userHighOrder = readLine() ?? "a"
        let userHighArr = userHighOrder.components(separatedBy: " ")
        let numAsArr = userHighArr[1].components(separatedBy: ",")
        let numAsDouble = numAsArr.map{Double($0) ?? 0}
        let num = Double(userHighArr[4]) ?? 0.0
        if userHighArr[0] == "map" {
            switch userHighArr[3] {
            case "*":
                let mapResult = userMap(arr: numAsDouble, closure: {$0 * num})
                print(mapResult)
            case "+":
                let mapResult = userMap(arr: numAsDouble, closure: {$0 + num})
                print(mapResult)
            case "-":
                let mapResult = userMap(arr: numAsDouble, closure: {$0 - num})
                print(mapResult)
            case "/":
                let mapResult = userMap(arr: numAsDouble, closure: {$0 / num})
                print(mapResult)
            default:
                print("yup")
            }
        } else if userHighArr[0] == "filter" {
                switch userHighArr[3] {
                case ">":
                    let filteredResult = filterFunc(arr: numAsDouble, closure: {$0 > num})
                    print(filteredResult)
                case "<":
                    let filteredResult = filterFunc(arr: numAsDouble, closure: {$0 < num})
                    print(filteredResult)
                default:
                    print("yuh")
                }
        } else if userHighArr[0] == "reduce" {
            switch userHighArr[3] {
            case "+":
                let reducedResult = reduceFunc(arr: numAsDouble, closure: {$0 + num})
                print(reducedResult + Double(userHighArr[4])!)
            case "*":
                let reducedResult = reduceFunc(arr: numAsDouble, closure: {$0 * num})
                print(reducedResult * Double(userHighArr[4])!)
            default:
                print("yuhhhhh")
            }
        }
        
               
        
        default:
        print("Please enter a valid response! 🤬")
    }
    
    print()
    print("Would you like to calculate again?")
    let userDecision = readLine() ?? "".lowercased()
    if userDecision == "yes" {
        continue
    } else if userDecision == "no"{
        break
    }
}   while (userTurns > 0)
