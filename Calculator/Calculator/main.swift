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
        opString = ["+", "-", "*", "/"].randomElement() ?? "*"
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

func arithemticCalcution(in input: String) -> Double {
    let seperator = input.components(separatedBy: " ")
    var result = 0.0
    if seperator.count != 3 {
        print("Please enter an equation. Example: 7 + 2")
    } else {
        let opString = seperator[1]
        let closureOperation = mathStuffFactory(opString: opString)
        result = closureOperation(Double(seperator[0]) ?? 0.0 , Double(seperator[2]) ?? 0.0)
    }
    
    return result
}

func mapFunction(in inputArray: [Double], closure: (Double) -> Double) -> [Double] {
    var userInputArr = [Double]()
    for num in inputArray{
        userInputArr.append(num)
    }
    return inputArray
}

func filterFunction(arr: [Double], closure: (Double) -> Bool) -> [Double] {
    var result = [Double]()
    for num in arr{
        if closure(num){
            result.append(num)
        }
    }
    return result
}

//var userChoice = readLine()
//func myFilter(inputArray: [Int], filter: Int -> String) -> [Int] {
//    let filteredResults = inputArray.filter {
//
//    }
//}

repeat{
    print("""
    Welcome to the calculator.
    Please enter "1" for normal operations.
    Enter "2" for higher order operations.
    """)
    let userChoice = readLine()
    var decision = Int(userChoice!) ?? 1
    decision = Int(userChoice!) ?? 2
if decision == 1{
    print("Please enter an equation. Example: 5 + 2 ")
    let userInput = readLine() ?? "0"
    let result = arithemticCalcution(in: userInput)
    print(result)
    }
//    var highOrderInput = readLine()
     if decision == 2{
        print("""
Please enter a "High Order" operation. e.g map 1,5,2,7,3,4 by * 3
""")
        let highOrderInput = readLine() ?? "0"
        let userInputArr = highOrderInput.components(separatedBy: " ")
        let numAsStringArr = userInputArr[1].components(separatedBy: ",")
        let numAsDouble = numAsStringArr.map{ Double($0) ?? 0.0 }
        let byNumber = Double(userInputArr[4]) ?? 0.0
        if userInputArr[0] == "map"{
            switch userInputArr[3] {
            case "+":
                let highResult = mapFunction(in: numAsDouble, closure: { $0 + byNumber })
                print(highResult)
            default:
                print("jhvdf")
            }
//            let highResult = mapFunction(in: numAsDouble, closure: )
        }
    }

} while true




