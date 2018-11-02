//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation



func myFilter(inputArray: [Double], filter: (Double) -> Bool) -> [Double] {
    var resultArray = [Double]()
    
    for num in inputArray{
        if filter(num){
            resultArray.append(num)
        }
    }
    return resultArray
}

func myMap(arrayOfNums: [Double], mapClosure: (Double) -> Double) -> [Double]{
    var emptyBox = [Double]()
    for num in arrayOfNums{
        emptyBox.append(mapClosure(num))
    }
    return emptyBox
}

func myReduce(arrOfNum: [Double], user: Double, reduceClosure: (Double, Double) -> Double) -> Double{
    var tempResult = user
    for num in arrOfNum{
        tempResult = reduceClosure(tempResult, num)
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

Press 1 for regular operation - [e.g. 2 + 2] or to put your skills to the test in a guessing game enter - [e.g. 2 ? 2]

Press 2 for high order - [e.g. filter 1,2,1,3,6,2,3,8 by < 4]
"""

let regularOperationMessage = "Enter your regular operation: [e.g. 5 + 5] or [e.g. 5 ? 5]"

let higherOperationMessage = """
Enter your high order operation like this:
 filter 1,2,1,3,6,2,3,8 by < 4
    (You can filter by < or >)

 map 1,5,2,7,3,4 by * 3
    (You can map by * or /)

 reduce 1,5,2,7,3,4 by + 4
    (You can map by * or +)
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
var whatTypeOfOperationInt = 0.0

let arrayOfOperatorForRandom = ["+","-","/","*"]
var randomOperator = " "
var userHigherOperation = " "



while letUsCalculate {
    
    while control{
        
        print(mainPromptMessage)
        let whatTypeOfOperation = readLine()?.lowercased() ?? "Invalid"
        whatTypeOfOperationInt = Double(whatTypeOfOperation) ?? 0.0
    
        if whatTypeOfOperationInt == 1.0 {
            print(regularOperationMessage)
            let userRegOperation = readLine() ?? "Not a value"
            componentOfOperation = userRegOperation.components(separatedBy: " ")
            if Double(componentOfOperation.count) == 3.0 {
                print("Calculating...")
                
                sleep(1)
                
                enterRegularOperation = true
                enterHigherOrderOperation = false
                control = false
            } else {
                print("Invalid entry.")
                continue
            }
        }else if whatTypeOfOperationInt == 2{
            print(higherOperationMessage)
            userHigherOperation = readLine()?.lowercased() ?? "Not a value"
            componentOfOperation = userHigherOperation.components(separatedBy: " ")
            if componentOfOperation.count == 5{
                print("Calculating...")
                
                sleep(1)
                
                enterHigherOrderOperation = true
                enterRegularOperation = false
                control = false
            } else {
                print("Invalid entry.")
            }
        } else {
            print ("Invalid entry.")
        }
    }
    
    while enterRegularOperation{
        if componentOfOperation[1] == "?"{
            randomOperator = arrayOfOperatorForRandom.randomElement()?.lowercased() ?? "Not valid"
            
            if let firstNum = Double(componentOfOperation[componentOfOperation.startIndex]){
                num1 = firstNum
            } else {
                print("This is not a valid entry")
                continue
            }
            
            if let secondNum = Double(componentOfOperation[componentOfOperation.endIndex-1]){
                num2 = secondNum
            } else {
                print("This is not a valid entry")
                continue
            }
            
            guard componentOfOperation[1] != "/" || num2 != 0 else {
                print("Invalid operation")
                break}
            
//            print(userHigherOperation)
            let x = (mathStuffFactory(opString: randomOperator)(num1, num2))
            print(x)
            print("Guess the operator used in the operation: [+, - , / , *]")
            
            let guessingOperator = readLine()?.lowercased() ?? "Invalid entry."
            
            if guessingOperator == randomOperator {
                print("Correct!")
                
            } else {
                print("Better luck next time...")
            }
            newValidOperation = true
            enterRegularOperation = false
            
        } else {
            
            if let firstNum = Double(componentOfOperation[componentOfOperation.startIndex]){
                num1 = firstNum
            } else {
                print("This is not a valid entry.")
                continue
            }
            
            if let secondNum = Double(componentOfOperation[componentOfOperation.endIndex-1]){
                num2 = secondNum
            } else {
                print("This is not a valid entry.")
                continue
            }
            
            guard componentOfOperation[1] != "/" || num2 != 0 else {
                print("Invalid operation. Can't divide by zero. Please try again.")
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
        let arrayOfNums = componentOfOperation[1].components(separatedBy: ",").compactMap{Double($0)}
        let operatorForHigherOrder = componentOfOperation[3]
        let numOperatorBy = Double(componentOfOperation[componentOfOperation.endIndex-1]) ?? 0
        
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
                print("You can only multiply and divide while using this opesration. Please try again")
            }
            newValidOperation =  true
            enterHigherOrderOperation =  false
        case "reduce":
            if operatorForHigherOrder == "+" {
                print(myReduce(arrOfNum: arrayOfNums, user: numOperatorBy){$0 + $1})
            }else if operatorForHigherOrder == "*" {
                print(myReduce(arrOfNum: arrayOfNums, user: numOperatorBy){$0 * $1})
            } else{
                print("You can only multiply and add while using this operation. Please try again")
            }
            newValidOperation = true
            enterHigherOrderOperation = false
        default:
            print("This is not a valid entry. Please try again.")
            newValidOperation = true
            enterHigherOrderOperation = false
        }
    }
    
    
    while newValidOperation{
        
        sleep(1)
        
        print("If you need to calculate another thing, type: \"yes\" or \"no\"")
        let nextOperation = readLine()?.lowercased() ?? "not a value"
        switch nextOperation{
        case "yes":
            control = true
            newValidOperation = false
        case "no":
            print("Good bye.")
            newValidOperation = false
            letUsCalculate = false
        default:
            print("Please type \"yes\" or \"no\"")
            continue
        }
        
        
    }
}
