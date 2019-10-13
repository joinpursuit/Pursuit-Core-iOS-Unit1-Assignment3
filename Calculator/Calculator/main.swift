//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation


func myFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] {
    guard inputArray.count > 0 else {
        let emptyArray: [Int] = []
        return emptyArray
    }
    var returnArray: [Int] = []
    
    for input in inputArray{
        if(filter(input)){
            returnArray.append(input)
        }
    }
    
   return returnArray
}

func myMap(inputArray: [Int], mapClosure: (Int) -> Int) -> [Int]{
    guard inputArray.count > 0 else {
        let emptyArray: [Int] = []
        return emptyArray
    }
    var returnArray: [Int] = []

    for input in inputArray{
        returnArray.append(mapClosure(input))
    }

    return returnArray
}

func myReduce(inputArray: [Int], initialValue: Int, reduceClosure: (Int,Int) -> Int) -> Int {
    guard inputArray.count > 0 else {
        return initialValue
    }
    var returnInt: Int = initialValue
    
    for input in inputArray{
        returnInt = reduceClosure(input,returnInt)
    }

    return returnInt
}

func isOperator(_ operation: String) -> Bool {
    if(operation == "+" || operation == "-" || operation == "*" || operation == "/" || operation == "?"){
        return true
    }else {
        return false
    }
}

func isHighOrderOperator(_ operation: String) -> Bool {
    if(operation == "+" || operation == "*" || operation == "/" || operation == "<" || operation == ">"){
        return true
    }else{
        return false
    }
}

func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
  switch opString {
  case "+":
    return {x, y in x + y }
  case "-":
    return {x, y in x - y }
  case "*":
    return {x, y in x * y }
  case "/":
    return {x, y in guard y != 0 else { return 0 }; return x / y }
  default:
    return {x, y in x + y }
  }
}

var performingCalculations = true
var oneOrTwo:String = ""
var performAnotherCalculation: String = ""

while performingCalculations {
    
    print("Perform a calculation. Select \"1\" for a regular operation and \"2\" for a higher order operation: ", terminator:"")
    oneOrTwo = readLine() ?? ""
    
    while(oneOrTwo != "1" && oneOrTwo != "2"){
        print("Perform a calculation. Select \"1\" for a regular operation and \"2\" for a higher order operation: ", terminator:"")
        oneOrTwo = readLine() ?? ""
    }
    
    optionOne: if oneOrTwo == "1"{
        
        let operationsMessage = """
Write an expression. Expressions should be of the following format number operator number. For example 2 + 5 is a valid input. Below is a list of valid operations:
    Type \"+\" to perform addition.
    Type \"-\" to perform subtraction.
    Type \"*\" to perform multiplication.
    Type \"/\" to perform division.
    Type \"?\" to perform one of the above operations chosen at random.
"""
        
        var operationChoice: String = ""
        var operationClosure: (Double,Double) -> (Double)
        
        print(operationsMessage)
        operationChoice = readLine() ?? ""
        let parseArray = Array(operationChoice)
        let inputArray = parseArray.filter{ $0 != " "}
        var firstArgument: Double = 0.0
        var secondArgument: Double = 0.0
        var tempString: String = ""
        var operationString = ""
        let operationSet: Set<String> = ["+", "-", "*", "/"]
        var mysteryGuess = ""
        var pickedRandom = false
        
        for i in inputArray{
            if i.isNumber{
                tempString += String(i)
            } else if i.isLetter{
                print("Invalid input")
                break optionOne
            } else if !i.isNumber{
                firstArgument = Double(tempString) ?? 0.0
                tempString = ""
                operationString = String(i)
            }
        }
        
        secondArgument = Double(tempString) ?? 0.0
        
        if operationString == "?"{
            operationString = operationSet.randomElement() ?? "*"
            pickedRandom = true
        }
        if isOperator(operationString){
            
            operationClosure = mathStuffFactory(opString: operationString)
            print("\(String(parseArray)) = \(operationClosure(firstArgument,secondArgument))")
            
            if pickedRandom {
                
                print("Can you guess which operation was performed?",terminator: " ")
                mysteryGuess = readLine() ?? ""
                while mysteryGuess != operationString {
                    print("Not quite. Guess again: ",terminator: "")
                    mysteryGuess = readLine() ?? ""
                }
                
                print("You got it!")
            }
        } else {
            print("Unknown operator: \(operationString)")
        }
    } else if oneOrTwo == "2" {
        var doWeFilter = false
        var doWeMap = false
        var doWeReduce = false
        var highOrderOperations: [Int] = []
        var outputArray: [Int] = []
        var highOrderOperator: String = ""
        var numberString = ""
        var rule: Int = 0
        var userExpression: String = ""
        var reduceResult = 0
        var thereWasABy = false
        let operationMessage = """
Enter a higher order operation to perform. Your operation should be of the following format: \"higher order operation\" \"series of numbers\" \"by\" \"supported operation\" \"Extra number\". For example, \"filter 1,5,2,7,3,4 by < 4\" is a valid input. Below is a list of higher order operation that are supported:
    - filter: filters out the numbers in an int array based on some rule.
        Filter supports the following operations: > , <
    - map: transforms the numbers in an int array based on some rule.
        Map supports the following operations: *, /
    - reduce: combines all elements in an int array.
        Reduce supports the following operations: +, *
"""
        
        print(operationMessage)
        userExpression = readLine() ?? ""
        userExpression = userExpression.lowercased()
        
        if userExpression.hasPrefix("filter") {
            doWeFilter = true
        }else if userExpression.hasPrefix("map"){
            doWeMap = true
        }else if userExpression.hasPrefix("reduce"){
            doWeReduce = true
        }
        
        while (!doWeFilter && !doWeMap && !doWeReduce) {
            print("Please input a valid higher order operation.")
            userExpression = readLine() ?? ""
            userExpression = userExpression.lowercased()
            
            if userExpression.hasPrefix("filter") {
                doWeFilter = true
            }else if userExpression.hasPrefix("map"){
                doWeMap = true
            }else if userExpression.hasPrefix("reduce"){
                doWeReduce = true
            }
        }
        
        var userInputArray = Array(userExpression)
        userInputArray = userInputArray.filter { $0 != " " }
        
        for user in userInputArray {
            if user.isNumber{
                numberString += String(user)
            } else if user == "," {
                highOrderOperations.append(Int(numberString) ?? 0 )
                numberString = ""
            } else if user == "b"{
                highOrderOperations.append(Int(numberString) ?? 0)
                numberString = ""
                thereWasABy = true
            } else if isHighOrderOperator(String(user)){
                highOrderOperator = String(user)
            }
        }
        
        rule = Int(numberString) ?? 0
        
        if doWeFilter && (highOrderOperator == ">" || highOrderOperator == "<") && thereWasABy {
            //Peform filter operations.
            let lessThanFilterClosure: (Int) -> Bool = {(x: Int) in
                return x < rule
            }
            let greaterThanFilterClosure: (Int) -> Bool = {(x: Int) in
                return x > rule
            }
            
            if highOrderOperator == ">"{
                 outputArray = myFilter(inputArray: highOrderOperations, filter: greaterThanFilterClosure)
            } else if highOrderOperator == "<" {
                outputArray = myFilter(inputArray: highOrderOperations, filter: lessThanFilterClosure)
            }
            print("Filtered result is: \(outputArray)")
            
        }else if doWeMap && (highOrderOperator == "*" || highOrderOperator == "/") && thereWasABy {
            //Perform Map operations.
            
            let multiplyMapClosure: (Int) -> Int = { (x: Int) in
                return x * rule
            }
            
            let divideMapClosure: (Int) -> Int = { (x: Int) in
                return x / rule
            }
            
            if highOrderOperator == "*"{
                outputArray = myMap(inputArray: highOrderOperations, mapClosure: multiplyMapClosure)
            } else if highOrderOperator == "/" {
                outputArray = myMap(inputArray: highOrderOperations, mapClosure: divideMapClosure)
            }
            print("Mapped result is: \(outputArray)")
            
        }else if doWeReduce && (highOrderOperator == "+" || highOrderOperator == "*") && thereWasABy{
            //Perform Reduce operations.
            
            let sumReduceClosure: (Int,Int) -> Int = { (x:Int, y: Int) in
                return x + y
            }
            
            let productReduceClosure: (Int,Int) -> Int = { (x:Int, y: Int) in
                return x * y
            }
            
            if highOrderOperator == "+" {
               reduceResult = myReduce(inputArray: highOrderOperations, initialValue: rule, reduceClosure: sumReduceClosure)
            }else if highOrderOperator == "*"{
               reduceResult = myReduce(inputArray: highOrderOperations, initialValue: rule, reduceClosure: productReduceClosure)
            }
            print("Reduced result is: \(reduceResult)")
        } else {
            print("Incorrect input format. Could not perform operation.")
        }
        
        
    }
    
    print("Perform another calculation? Enter \"y\" for yes, and \"n\" for no: ", terminator:"" )
    performAnotherCalculation = readLine() ?? ""
    while( performAnotherCalculation != "y" && performAnotherCalculation != "n"){
        print("Perform another calculation? Enter \"y\" for yes, and \"n\" for no: ", terminator:"" )
        performAnotherCalculation = readLine() ?? ""
    }
    if(performAnotherCalculation == "y"){
        performingCalculations = true
    }else {
        performingCalculations = false
    }
    
}
