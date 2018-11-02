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


var userInputTurnedIntoArray = [String]()
var userInputLoopCondition = true
var userInputPlaceHolderVariable1 = Double()
var userInputPlaceHolderVariable2 = Double()
let opArray = ["+","-","*","/"]
let validOpArray = ["+","-","*","/","?"]
var currentlyActiveOperator = ""
var randomOperatorSaver = ""
var userGuessedOperation = ""
var guessState = true
var highOrderArray = [Double]()
var switching = "low"
var highOrderOperations = ["filter","reduce","map"]
var highOrderOperationsSymbols = ["+","/","*",">","<"]
var userInputPlaceHolderArray = [Int]()

print("type low or high to do low or high to do the respective math")
if let userInput = readLine(){
    if userInput == "low"{
        switching = "low"
    }else if userInput == "high"{
        switching = "high"
    }else {
        print("type low or high")
    }
    
}
switch switching {
    
case "low" :
    
    print("Input the math")
    if let userInput = readLine(){
        userInputTurnedIntoArray = userInput.components(separatedBy: " ")
    }
    
    
    //This block of code will make sure that user input is valid for further operations make this a function
    
    
    func validUserInput(vUI: [String]) { //[String] is userInputTurnedIntoArray
        if vUI.count == 3 && validOpArray.contains(vUI[1]){
            if let intx = Double(vUI[0]), let inty = Double(vUI[2]) {
                userInputPlaceHolderVariable1 = intx
                userInputPlaceHolderVariable2 = inty
                currentlyActiveOperator = vUI[1]
            }
        }else{
            print("Please enter in the form of X ◦ Y ")
        }
    }
    if let randomOp = opArray.randomElement(){
        randomOperatorSaver = randomOp
    }
    
    
    
    
    
    validUserInput(vUI:userInputTurnedIntoArray)
    
    
    // Calculator block
    if opArray.contains(userInputTurnedIntoArray[1]){
        if userInputTurnedIntoArray[1] == "/" && userInputPlaceHolderVariable2 == 0 {
            print("Will result in an undefined number")
        }else{
            let mathOperation = mathStuffFactory(opString: currentlyActiveOperator)
            let result = mathOperation (userInputPlaceHolderVariable1, userInputPlaceHolderVariable2)
            print("\(userInputPlaceHolderVariable1) \(currentlyActiveOperator) \(userInputPlaceHolderVariable2) = \(result)")
        }
    }
    
    // Guess Game Block
    if userInputTurnedIntoArray[1] == "?" {
        let mathOperationRandom = mathStuffFactory(opString: randomOperatorSaver)
        let result = mathOperationRandom(userInputPlaceHolderVariable1,userInputPlaceHolderVariable2)
        print("What math operation results in \(result)?")
        while guessState {
            if let userGuess = readLine(){
                userGuessedOperation = userGuess
                if userGuessedOperation == randomOperatorSaver {
                    print("Correct")
                    guessState = false
                }else {
                    print("Guess again")
                }
            }
        }
        guessState = true
    }
    
    
    
    
case "high" :
    
    print("Input the math")
    if let userInput = readLine(){
        userInputTurnedIntoArray = userInput.components(separatedBy: " ")
    }
    
    
    func validUserInputHigh(vUI: [String]) {
        var this = vUI[1].components(separatedBy: " ")
        for num in 0..<this.count{
            if let intz = Double(this[num]){
                highOrderArray.append(intz)
            }
        }
        if vUI.count == 5 && highOrderOperations.contains(vUI[0]) && "by" == vUI[2] && highOrderOperationsSymbols.contains(vUI[3]){
            if let intx = Double(vUI[4]){
                userInputPlaceHolderVariable1 = intx
            }
            else{
                print("Please enter in the form of filter 1,5,2,7,3,4 by < 4 ")
            }
        }
    }
    validUserInputHigh(vUI: userInputTurnedIntoArray)
    
    ////filter number greater or less than given number from array
    func myFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] {
        var filteredArray = [Int]()
        
        for num in inputArray{
            if filter(num){
                filteredArray.append(num)
            }
        }
        return filteredArray
    }
    
    func myMap(inputArray: [Int], map: (Int) -> Int) -> [Int] {
        var newArr = [Int]()
        for num in inputArray {
            newArr.append(map(num))
        }
        return newArr
    }
    
    
    
    func myReduceSum(inputArray : [Int], baseAdd: Int, reduce:(Int) -> Int) -> (Int){
        var reducedInt = 0
        for num in inputArray {
            reducedInt += reduce(num)
        }
        
        return reducedInt + baseAdd
        
    }
    func myReduceProduct(inputArray : [Int],baseMult: Int, reduce:(Int) -> Int) -> (Int){
        var reducedInt = 1
        for num in inputArray {
            reducedInt *= reduce(num)
        }
        
        return reducedInt * baseMult
        
    }
    
    
default:
    print("type again")
    
}





