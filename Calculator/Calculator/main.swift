//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

private let operations: ([String: (Double, Double) -> Double]) = ["+": { $0 + $1 },
                                                                  "-": { $0 - $1 },
                                                                  "*": { $0 * $1 },
                                                                  "/": { $0 / $1 }]

private func myFilter (arr: [Double], closure: (Double) -> Bool) -> [Double] {
    var resultArr = [Double]()
    for number in arr {
        if closure(number) {
            resultArr.append(number)
        }
    }
    return resultArr
}

private func myReduce(arr: [Double], number: Double, closure: (Double, Double) -> Double) -> Double{
    var result = number
    for num in arr{
        result = closure(result, num)
    }
    return result
}

private func myMap(arr: [Double], closure: (Double) -> Double) -> [Double]{
    var resultArray = [Double]()
    for num in arr{
        resultArray.append(closure(num))
    }
    return resultArray
}

extension String {
    var isDouble: Bool {return Double(self.trimmingCharacters(in: .whitespaces)) != nil}
}

private let operationArray = ["+","-","/","*"]

func mainMenu() {
    print("Welcome, Enter 1 for basic math or 2 for higher order functions")
    let mathOption = readLine()!
    switch mathOption {
    case "1" :
        doBasicMath()
    case "2":
        higherOrder()
    default:
        print("Invalid, try again")
        mainMenu()
    }
}

func doBasicMath() {
    print("Enter a basic math operation ex. 5 + 7")
    let basicMath = readLine()!
    var basicMathArray = basicMath.components(separatedBy: " ")
    print(basicMathArray)
    guard basicMathArray.count == 3 && basicMathArray[0].isDouble && basicMathArray[2].isDouble && (operationArray.contains(basicMathArray[1]) || basicMathArray[1] == "?") else {
        print("Invalid, Try Again")
        return doBasicMath()
    }
    
    if basicMathArray[1] == "?" {
        basicMathArray[1] = operationArray.randomElement()!
        let symbol = operations[basicMathArray[1]]!
        print("\(basicMath) = \(symbol(Double(basicMathArray[0])!, Double(basicMathArray[2])!))")
        print("Guess the missing operator!")
        let guess = readLine()
        if guess == basicMathArray[1] {
            print("\nCorrect!\n")
            
        } else {
            print("\nWrong! The correct answer is \(basicMathArray[1])\n")
        }
    } else {
        if let symbol = operations[basicMathArray[1]] {
            print("\(basicMath) = \(symbol(Double(basicMathArray[0])!, Double(basicMathArray[2])!))")
            
        }
    }
}

func higherOrder() {
    print("Options are map, filter or reduce. Example entry: map 1,2,3,4 * 4")
    print("""
map can only perform * or /
filter can only perform < or >
reduce can only perform + or *
""")
    let usersInput = readLine()!
    let usersInputArray = usersInput.components(separatedBy: " ")
    
    guard usersInputArray.count == 4 && (usersInputArray[0] == "map" || usersInputArray[0] == "filter" || usersInputArray[0] == "reduce") && usersInputArray[3].isDouble else {
        print("Invalid, Try Again")
        return higherOrder()
    }
    
    let higherOrderFunctions = usersInputArray[0]
    let numberArray = usersInputArray[1].components(separatedBy: ",").compactMap{Double($0)}
    let functionOperator = usersInputArray[2]
    let operationNumber = Double(usersInputArray[3])!
    
    switch higherOrderFunctions {
    case "filter":
        if functionOperator ==  "<" {
            print(myFilter(arr: numberArray, closure: { $0 < operationNumber }))
        } else if functionOperator == ">" {
            print(myFilter(arr: numberArray, closure: { $0 > operationNumber }))
        }
        
    case "reduce":
        if functionOperator == "+"{
            print(myReduce(arr: numberArray, number: operationNumber){$0 + $1})
        } else if functionOperator == "*" {
            print(myReduce(arr: numberArray, number: operationNumber){$0 * $1})
        }
        
    case "map":
        if functionOperator == "*" {
            print(myMap(arr: numberArray){operationNumber * $0})
        } else if functionOperator == "/" {
            print(myMap(arr: numberArray){operationNumber / $0})
        }
    default :
        print("invalid input")
    }
    
}

func calculateAgain() {
    print("Do you want to compute more? Enter yes if so")
    let gameContinue = readLine()?.lowercased()
    if gameContinue == "yes" {
        calculator()
    } else {
        print("GoodBye")
    }
}

func calculator() {
    mainMenu()
    calculateAgain()
}

calculator()
