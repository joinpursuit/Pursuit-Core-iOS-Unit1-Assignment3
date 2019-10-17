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
        // REGULAR ARITHMETIC
        // MUST PUT IT INTO FUNCTION
        let userInput = readLine() ?? ""
        let userInputArr = userInput.components(separatedBy: " ")

        
//        let closureOperation = mathStuffFactory(opString: userInputArr[1])
//        let result = closureOperation(Double(userInputArr[0]) ?? 0.0,(Double(userInputArr[2]) ?? 0.0))
//
//        print("result of your operation is \(userInput) = \(result)")

        let operatorSymbol = userInputArr[1]
        
        if questionMark.contains(Character(operatorSymbol)) {
        let randomOperation = randomOperator.randomElement() ?? "+"
        let convertRandom = mathStuffFactory(opString: randomOperation)
        let randomCalculation = convertRandom((Double(userInputArr[0]) ?? 0.0),(Double(userInputArr[2]) ?? 0.0))
        print("result of your operation is \(userInput) = \(randomCalculation)")
        } else {
            let closureOperation = mathStuffFactory(opString: userInputArr[1])
            let result = closureOperation(Double(userInputArr[0]) ?? 0.0,(Double(userInputArr[2]) ?? 0.0))
            
            print("result of your operation is \(userInput) = \(result)")
        }
        
        //CASE TWO
        case "2":
               sleep(1)
               print()
               print("Enter your operation. (Ex: filter 1,2,3,6,4,3,6,8,9,4 by < 5)")
        
        
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
