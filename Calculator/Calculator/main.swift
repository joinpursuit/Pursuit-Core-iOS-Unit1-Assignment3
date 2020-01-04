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

    
func simpleCalculator() {
    print("Enter your calculation e.g 10 + 2")
    var double1: Double
    var double2: Double
    if let userInput = readLine()?.components(separatedBy: " ") {
        if userInput.count != 3 {
            print("Invalid Input")
            simpleCalculator()
        }
        if let checkdouble1 = Double(userInput[0]) {
            double1 = checkdouble1
        } else {
            double1 = 0.0
            print("Invalid Input")
            simpleCalculator()
        }
        
        if let checkdouble2 = Double(userInput[2]) {
                double2 = checkdouble2
        } else {
            double2 = 0.0
            print("Invalid Input")
            simpleCalculator()
        }
        
        let operand = (userInput[1])
        if operand != "+" && operand != "-" && operand != "*" && operand != "/" && operand != "?" {
            print("Invalid Operand")
            simpleCalculator()
        }
        
        if operand == "?" {
            randomOperand(a:double1, b:double2)
        } else {
            let mathOperation = mathStuffFactory(opString: operand)
            let result = mathOperation(double1, double2)
            print("\(double1) \(operand) \(double2) = \(result)")
        }
    
    }
    calcEndMenu()
}

func randomOperand(a:Double, b:Double) {
    let operandList = ["+", "-", "*", "/"]
    if let generatedOp = operandList.randomElement() {
        let mathOperation = mathStuffFactory(opString: generatedOp)
        let result = mathOperation(a, b)
        print("\(a) ? \(b) = \(result)")
        print("Which operand did the calculator use?")
        let userInput = readLine()
        if userInput == generatedOp {
            print("You got it correct")
            calcEndMenu()
        } else {
            print("You got it wrong, the operand is \(generatedOp)")
            calcEndMenu()
        }
    }
}

func filterFunc(op: String , filterArray: [Int], lastNum: (Int)) -> [Int] {
    var newArray = [Int]()
    switch op {
    case "<":
        for numbers in filterArray {
            if numbers < lastNum {
                newArray.append(numbers)
            }
        }
    case ">":
        for numbers in filterArray {
            if numbers > lastNum {
                newArray.append(numbers)
            }
        }
    default:
        print("Invalid Input")
        print("Enter your high order calculation again.")
        highOrderCalc()
    }
    return newArray
}

func mapFunc(op: String , filterArray: [Double], lastNum: (Double)) -> [Double] {
    var newArray = [Double]()
    switch op {
    case "*":
        for numbers in filterArray {
            newArray.append(numbers * lastNum)
        }
    case "/":
        for numbers in filterArray {
            newArray.append(numbers / lastNum)
        }
    default:
        print("Invalid Input")
        print("Enter your high order calculation again.")
        highOrderCalc()
    }
    return newArray
}

func reduceFunc(op: String , filterArray: [Int], lastNum: (Int)) -> (Int) {
    var newNum = lastNum
    switch op {
    case "*":
        for numbers in filterArray {
            newNum *= numbers
        }
    case "+":
        for numbers in filterArray {
            newNum += numbers
        }
    default:
        print("Invalid Input")
        print("Enter your high order calculation again")
    }
    return newNum
}


func highOrderCalc() {
    print("Enter your calculation e.g filter 1,2,3,4,5 by < 3 OR map 1,2,3,4,5 by * 3 OR reduce 1,2,3,4,5 by + 4")
    
    if let userInput = readLine()?.lowercased().components(separatedBy: " ") {
        if userInput.count != 5 {
            print("Invalid Input")
            highOrderCalc()
        }
        let inputAsComponents = userInput
        let inputArray = inputAsComponents[1].components(separatedBy: ",").compactMap(){Int($0)}
        let inputArrayAsDouble = inputAsComponents[1].components(separatedBy: ",").compactMap(){Double($0)}
        let operand = inputAsComponents[3]
        let givenNum = inputAsComponents.compactMap(){Int($0)}
        if givenNum.isEmpty {
            print("Invalid Input")
            highOrderCalc()
        }
        let givenNumAsDouble = inputAsComponents.compactMap(){Double($0)}
        
        switch userInput[0] {
        case "filter":
            let toFilter = filterFunc(op: operand, filterArray: inputArray, lastNum: givenNum[0])
            print(toFilter)
            calcEndMenu()
        case "map":
            let toMap = mapFunc(op: operand, filterArray: inputArrayAsDouble, lastNum: givenNumAsDouble[0])
            print(toMap)
            calcEndMenu()
        case "reduce":
            let toReduce = reduceFunc(op: operand, filterArray: inputArray, lastNum: givenNum[0])
            print(toReduce)
            calcEndMenu()
        default:
            print("Invalid Input")
            print("Enter your high order calculation again.")
            highOrderCalc()
        }
    }
}

func calcStartMenu() {
    print("Enter your type of calculation: Regular [1] , High Order [2]")
    if let userInput = readLine()?.lowercased() {
        switch userInput {
        case "1", "regular":
            simpleCalculator()
        case "2", "high order":
            highOrderCalc()
        default:
            print("Invalid Input")
            calcStartMenu()
        }
    }
}

func calcEndMenu() {
    print("Do you want to continue using the calculator?: Yes [1], No [2]")
    if let userInput = readLine()?.lowercased() {
        switch userInput {
        case "yes", "1":
            calcStartMenu()
        case "no", "2":
            exit(0)
        default:
            print("Invalid Input")
            calcEndMenu()
        }
    }
}

calcStartMenu()


