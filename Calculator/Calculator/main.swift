//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

//
//func mathStuffFactory(opString: String) -> (_ x:Double, _ y:Double) -> Double {
//    switch opString {
//    case "+":
//        return {x, y in x + y }
//    case "-":
//        return {x, y in x - y }
//    case "*":
//        return {x, y in x * y }
//    case "/":
//        return {x, y in x / y }
//    default:
//        return {x, y in x + y }
//    }
//}
//
////print(mathStuffFactory(opString: "" )(1,1))
//
//var num1: Double = 0.0
//var num2: Double = 0.0
//var stringOperator = " "
//var isThisADouble = false
//var isThisAnotherDouble = false
//var isThisAnOperator = false
//var calculateOperation = true
//var letUsCalculate = true
//var newValidOperation = true
//var componentOfOperation = [String]()
//
////var arrayOfOperatorForRandom = ["+","-","/","*", "?"]
//
//
//var validOperation = true
//
//while letUsCalculate {
//    while validOperation{
//        print("Enter a two digit operation: 5 + 5")
//        let userOperation = readLine() ?? "not a value"
//        componentOfOperation = userOperation.components(separatedBy: " ")
//        if componentOfOperation.count == 3{
//            print("calculating...")
//            validOperation = false
//            calculateOperation = true
//        } else {
//            print("invalid entry")
//            continue
//        }
//
//    }
//
//    while calculateOperation{
//
//        if let firstNum = Double(componentOfOperation[componentOfOperation.startIndex]){
//            num1 = firstNum
//        } else {
//            print("this is not a valid entry")
//            continue
//        }
//        if let secondNum = Double(componentOfOperation[componentOfOperation.endIndex-1]){
//            num2 = secondNum
//        } else {
//            print("this is not a valid entry")
//            continue
//        }
//
//        guard componentOfOperation[1] != "/" || num2 != 0 else {
//            print("Invalid operation")
//
//            break}
//
//        print(mathStuffFactory(opString: componentOfOperation[1])(num1, num2)) // proof for fatal error
//        calculateOperation = false
//        newValidOperation = true
//
//    }
//    while newValidOperation{
//        print("If you need to calculate another thing, type: yes")
//        let nextOperation = readLine()?.lowercased() ?? "not a value"
//        switch nextOperation{
//        case "yes":
//            validOperation = true
//            newValidOperation = false
//        default:
//            print("thanks for calculating with us!")
//            newValidOperation = false
//        }
//    }
//}
//
//
//
////filter function
//func myFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] {
//    var resultArray = [Int]()
//
//    for num in inputArray{
//        if filter(num){
//            resultArray.append(num)
//        }
//    }
//    return resultArray
//}

//
//let x = [1,2,1,3,4,1,2]
//let y = 3
//print(myFilter(inputArray: x){ y > $0 ? true : false})
//
////map function
//func myMap(arrayOfNums: [Int], mapClosure: (Int) -> Int) -> [Int]{
//    var emptyBox = [Int]()
//    for num in arrayOfNums{
//        emptyBox.append(mapClosure(num))
//    }
//    return emptyBox
//}
//let inputUser = 2
//let r = [2,3,4,-5]
//print(myMap(arrayOfNums: r){inputUser * $0})
//
//
////reduce function
//func myReduce(arrOfNum: [Int], user: Int, reduceClosure: (Int) -> Int) -> Int{
//    var tempResult = user
//    for num in arrOfNum{
//        tempResult += reduceClosure(num)
//    }
//
//    return tempResult
//}

//let f = [2,1,3,3,1,2]//12 + 3 = 15
//let userInput = -3
//
//print(myReduce(arrOfNum: f, user: userInput){$0})
//
//

// 11/1 12:15 a.m. most updated version:

//func mathStuffFactory(opString: String) -> (_ x:Double, _ y:Double) -> Double {
//    switch opString {
//    case "+":
//        return {x, y in x + y }
//    case "-":
//        return {x, y in x - y }
//    case "*":
//        return {x, y in x * y }
//    case "/":
//        return {x, y in x / y }
//    default:
//        return {x, y in x + y }
//    }
//}
//
////print(mathStuffFactory(opString: "" )(1,1))
//
//let mainPromptMessage = """
//What type of calculation do you need?
//Press 1 for regular - [e.g. 2 + 2]
//Press 2 for high order - [e.g. filter 1,2,1,3,6,2,3,8 by < 4]
//"""
//
//let regularOperationMessage = "Enter your regular operation like this: 5 + 5"
//
//let higherOperationMessage = """
//Enter your high order operation like this:
//- filter 1,2,1,3,6,2,3,8 by < 4
//
//- map 1,5,2,7,3,4 by * 3
//
//- reduce 1,5,2,7,3,4 by + 4
//"""
//
//var num1: Double = 0.0
//var num2: Double = 0.0
//var stringOperator = " "
//var isThisADouble = false
//var isThisAnotherDouble = false
//var isThisAnOperator = false
//var enterRegularOperation = true
//var enterHigherOrderOperation = true
//var control = true
//var letUsCalculate = true
//var newValidOperation = true
//var componentOfOperation = [String]()
//var whatTypeOfOperationInt = 0
//
//let arrayOfOperatorForRandom = ["+","-","/","*"]
//var randomOperator = " "
//var userHigherOperation = " "
//
//
//var validOperation = true
//
//while letUsCalculate {
//
//    while control{
//        print(mainPromptMessage)
//        let whatTypeOfOperation = readLine()?.lowercased() ?? "invalid"
//        whatTypeOfOperationInt = Int(whatTypeOfOperation) ?? 0
//
//        if whatTypeOfOperationInt == 1{
//            print(regularOperationMessage)
//            let userRegOperation = readLine() ?? "not a value"
//            componentOfOperation = userRegOperation.components(separatedBy: " ")
//            if componentOfOperation.count == 3{
//                enterRegularOperation = true
//                enterHigherOrderOperation = false
//                control = false
//            } else {
//                print("invalid entry")
//                continue
//            }
//        }else if whatTypeOfOperationInt == 2{
//            print(higherOperationMessage)
//            userHigherOperation = readLine()?.lowercased() ?? "not a value"
//            componentOfOperation = userHigherOperation.components(separatedBy: " ")
//            if componentOfOperation.count == 5{
//                print("calculating...")
//                enterHigherOrderOperation = true
//                control = false
//            } else {
//                print("invalid entry")
//            }
//        } else {
//            print ("Invalid entry.")
//        }
//    }
//
//    while enterRegularOperation{
//        if componentOfOperation[1] == "?"{
//            randomOperator = arrayOfOperatorForRandom.randomElement()?.lowercased() ?? "not valid"
//
//            if let firstNum = Double(componentOfOperation[componentOfOperation.startIndex]){
//                num1 = firstNum
//            } else {
//                print("this is not a valid entry")
//                continue
//            }
//
//            if let secondNum = Double(componentOfOperation[componentOfOperation.endIndex-1]){
//                num2 = secondNum
//            } else {
//                print("this is not a valid entry")
//                continue
//            }
//
//            guard componentOfOperation[1] != "/" || num2 != 0 else {
//                print("Invalid operation")
//                break}
//
//            print(userHigherOperation)
//            let x = (mathStuffFactory(opString: randomOperator)(num1, num2))
//            print(x)
//            print("Guess the operator used in the operation: [+, - , / , *]")
//
//            let guessingOperator = readLine()?.lowercased() ?? "invalid entry."
//
//            if guessingOperator == randomOperator {
//                print("correct")
//
//            } else {
//                print("better luck next time?")
//            }
//
//            enterRegularOperation = false
//
//        } else {
//
//            if let firstNum = Double(componentOfOperation[componentOfOperation.startIndex]){
//                num1 = firstNum
//            } else {
//                print("this is not a valid entry")
//                continue
//            }
//
//            if let secondNum = Double(componentOfOperation[componentOfOperation.endIndex-1]){
//                num2 = secondNum
//            } else {
//                print("this is not a valid entry")
//                continue
//            }
//
//            guard componentOfOperation[1] != "/" || num2 != 0 else {
//                print("Invalid operation")
//                control = true
//                enterRegularOperation =  false
//                break
//            }
//
//            print(mathStuffFactory(opString: componentOfOperation[1])(num1, num2))
//
//            newValidOperation = true
//            enterRegularOperation = false
//
//        }
//
//        while enterHigherOrderOperation{
//            switch componentOfOperation[0]{
//            case "filter":
//                print("filter")
//                enterHigherOrderOperation = false
//            case "map":
//                print("map")
//                enterHigherOrderOperation =  false
//            case "reduce":
//                print("reduce")
//                enterHigherOrderOperation = false
//            default:
//                print("don't know what is going on...")
//                enterHigherOrderOperation = false
//            }
//        }
//    }
//
//    while newValidOperation{
//        print("If you need to calculate another thing, type: yes")
//        let nextOperation = readLine()?.lowercased() ?? "not a value"
//        switch nextOperation{
//        case "yes":
//            control = true
//            newValidOperation = false
//        default:
//            print("thanks for calculating with us!")
//            letUsCalculate = false
//        }
//
//
//    }
//}


//version 11/2, morning:


func myFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] {
    var resultArray = [Int]()
    
    for num in inputArray{
        if filter(num){
            resultArray.append(num)
        }
    }
    return resultArray
}

func myMap(arrayOfNums: [Int], mapClosure: (Int) -> Int) -> [Int]{
    var emptyBox = [Int]()
    for num in arrayOfNums{
        emptyBox.append(mapClosure(num))
    }
    return emptyBox
}

func myReduce(arrOfNum: [Int], user: Int, reduceClosure: (Int) -> Int) -> Int{
    var tempResult = user
    for num in arrOfNum{
        tempResult += reduceClosure(num)
    }
    
    return tempResult
}

func mathStuffFactory(opString: String) -> (_ x:Double, _ y:Double) -> Double {
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

//print(mathStuffFactory(opString: "" )(1,1))


let mainPromptMessage = """
What type of calculation do you need?
Press 1 for regular - [e.g. 2 + 2]
Press 2 for high order - [e.g. filter 1,2,1,3,6,2,3,8 by < 4]
"""

let regularOperationMessage = "Enter your regular operation like this: 5 + 5"

let higherOperationMessage = """
Enter your high order operation like this:
- filter 1,2,1,3,6,2,3,8 by < 4

- map 1,5,2,7,3,4 by * 3

- reduce 1,5,2,7,3,4 by + 4
"""

//    var validOperation = true

//    var stringOperator = " "
//    var isThisADouble = false
//    var isThisAnotherDouble = false
//    var isThisAnOperator = false


var num1: Double = 0.0
var num2: Double = 0.0
var enterRegularOperation = true
var enterHigherOrderOperation = true
var control = true
var letUsCalculate = true
var newValidOperation = true
var componentOfOperation = [String]()
var whatTypeOfOperationInt = 0

let arrayOfOperatorForRandom = ["+","-","/","*"]
var randomOperator = " "
var userHigherOperation = " "



while letUsCalculate {
    
    while control{
        print(mainPromptMessage)
        let whatTypeOfOperation = readLine()?.lowercased() ?? "invalid"
        whatTypeOfOperationInt = Int(whatTypeOfOperation) ?? 0
        
        if whatTypeOfOperationInt == 1{
            print(regularOperationMessage)
            let userRegOperation = readLine() ?? "not a value"
            componentOfOperation = userRegOperation.components(separatedBy: " ")
            if componentOfOperation.count == 3{
                enterRegularOperation = true
                enterHigherOrderOperation = false
                control = false
            } else {
                print("invalid entry")
                continue
            }
        }else if whatTypeOfOperationInt == 2{
            print(higherOperationMessage)
            userHigherOperation = readLine()?.lowercased() ?? "not a value"
            componentOfOperation = userHigherOperation.components(separatedBy: " ")
            if componentOfOperation.count == 5{
                print("calculating...")
                enterHigherOrderOperation = true
                enterRegularOperation = false
                control = false
            } else {
                print("invalid entry")
            }
        } else {
            print ("Invalid entry.")
        }
    }
    
    while enterRegularOperation{
        if componentOfOperation[1] == "?"{
            randomOperator = arrayOfOperatorForRandom.randomElement()?.lowercased() ?? "not valid"
            
            if let firstNum = Double(componentOfOperation[componentOfOperation.startIndex]){
                num1 = firstNum
            } else {
                print("this is not a valid entry")
                continue
            }
            
            if let secondNum = Double(componentOfOperation[componentOfOperation.endIndex-1]){
                num2 = secondNum
            } else {
                print("this is not a valid entry")
                continue
            }
            
            guard componentOfOperation[1] != "/" || num2 != 0 else {
                print("Invalid operation")
                break}
            
            print(userHigherOperation)
            let x = (mathStuffFactory(opString: randomOperator)(num1, num2))
            print(x)
            print("Guess the operator used in the operation: [+, - , / , *]")
            
            let guessingOperator = readLine()?.lowercased() ?? "invalid entry."
            
            if guessingOperator == randomOperator {
                print("correct")
                
            } else {
                print("better luck next time?")
            }
            newValidOperation = true
            enterRegularOperation = false
            
        } else {
            
            if let firstNum = Double(componentOfOperation[componentOfOperation.startIndex]){
                num1 = firstNum
            } else {
                print("this is not a valid entry")
                continue
            }
            
            if let secondNum = Double(componentOfOperation[componentOfOperation.endIndex-1]){
                num2 = secondNum
            } else {
                print("this is not a valid entry")
                continue
            }
            
            guard componentOfOperation[1] != "/" || num2 != 0 else {
                print("Invalid operation")
                control = true
                enterRegularOperation =  false
                break
            }
            
            print(mathStuffFactory(opString: componentOfOperation[1])(num1, num2))
            
            newValidOperation = true
            enterRegularOperation = false
            
        }
    }
    
    while enterHigherOrderOperation{
        let arrayOfNums = componentOfOperation[1].components(separatedBy: ",").compactMap{Int($0)}
        let operatorForHigherOrder = componentOfOperation[3]
        let numOperatorBy = Int(componentOfOperation[componentOfOperation.endIndex-1]) ?? 0
        
        switch componentOfOperation[0]{
        case "filter":
            if operatorForHigherOrder == "<" {
                print(myFilter(inputArray: arrayOfNums){ numOperatorBy > $0 ? true : false})
            }else if operatorForHigherOrder == ">" {
                print(myFilter(inputArray: arrayOfNums){ numOperatorBy < $0 ? true : false})
            } else {
             print("You can only filter by < or > while using this operation. Please try again")
            }
            newValidOperation =  true
            enterHigherOrderOperation = false
        case "map":
            if operatorForHigherOrder == "*" {
                print(myMap(arrayOfNums: arrayOfNums){numOperatorBy * $0})
            } else if operatorForHigherOrder == "/"{
                print(myMap(arrayOfNums: arrayOfNums){numOperatorBy / $0})
            } else {
                print("You can only multiply and divide while using this operation. Please try again")
            }
            newValidOperation =  true
            enterHigherOrderOperation =  false
        case "reduce":
            if operatorForHigherOrder == "+" {
                print(myReduce(arrOfNum: arrayOfNums, user: numOperatorBy){$0})
            }else if operatorForHigherOrder == "*" {
                print(myReduce(arrOfNum: arrayOfNums, user: numOperatorBy){$0})
            } else{
                print("You can only multiply and add while using this operation. Please try again")
            }
            newValidOperation = true
            enterHigherOrderOperation = false
        default:
            print("don't know what is going on...")
            newValidOperation = true
            enterHigherOrderOperation = false
        }
    }
    
    
    while newValidOperation{
        print("If you need to calculate another thing, type: yes")
        let nextOperation = readLine()?.lowercased() ?? "not a value"
        switch nextOperation{
        case "yes":
            control = true
            newValidOperation = false
        default:
            print("thanks for calculating with us!")
            letUsCalculate = false
        }
        
        
    }
}














