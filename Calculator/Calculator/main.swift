//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation


var theOperator = String()
var magicOperator = Bool()
var randomOperatorArray = ["+","-","/","*"]
var calculatorOn =  true
var keyword = String()
var pathArray = ["simple" , "higher order"]
var keywordArray = ["filter" , "map", "reduce"]
var double1 = Double()
var double2 = Double()
var computationOperators = [">","<","*","/","+"]
var userInputNumbersArray = [Int]()
var userinputString = String()
var userInputNumberString = String()
var userChosenNumber = String()
var computationalOperator  = String()
var userChosenNumber1 = Int()
var start = Int()



func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    switch opString {
    case "+":
        return {x,y in x + y }
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

// my filter
func filterFunction(inputArray:[Int] , closure: (Int) -> Bool) -> [Int] {
    var returnedArray = [Int]()
    for element in inputArray {
        if closure(element){
            returnedArray.append(element)
        }
    }
    return returnedArray
}
// myFilterClosure
var myClosure = { (closure: Int) -> Bool in
    if closure > userChosenNumber1 {
        return true
    }else{
        return false
    }
}
// my map func
func myMapFunction(inputArray: [Int] , myClosure: (Int) -> Int) -> [Int] {
    var returnedArray = [Int]()
    for element in inputArray {
        let newElement = myClosure(element)
        returnedArray.append(newElement)
    }
    return returnedArray
}
// MY mapclosure
var myMapClosure = {(closure:Int)-> Int in
    let result = closure * userChosenNumber1
    
    return result
}
// reduceFunction
func myReduceFunction(inputArray:[Int] , myClosure: (Int,Int) -> Int , start: Int ) -> Int {
    var currentTotal = start
    for element in inputArray{
        currentTotal = myClosure(currentTotal,element)
    }
    return currentTotal
}
// myReducedClosure
var myClosureReduced = { (currentTotal:Int,element:Int) -> Int in
    let sum = currentTotal + element
    return sum
}
func operatorCheck() -> Bool {
    if theOperator == "?" {
        theOperator = randomOperatorArray.randomElement() ?? "You tried it!!"
        magicOperator = true
        
    }
    return magicOperator
}

func question(theOperator: String) {
    if theOperator == "?" {
    print("What operator was used?")
    if let response = readLine(){
        if response == theOperator{
            print("That is correct.. WooHoo!!")
        }
        else{
            print("Incorrect. TryAgain")
        }
    }
}
}
func playAgain() {
print("would you like you calculate again?")
    let userResponse = readLine() ?? "Invalid"
    if userResponse.lowercased() == "yes"{
        calculatorOn = true
    }else if userResponse.lowercased() == "no"{
        calculatorOn = false
    }
}

calculatorOnLoop: while calculatorOn {
    print("Welcome to a magic calculator, the ability of this calculator depends on your imagination what wouldn you like to try first?, simple or higher order ?")
    guard let userPath = readLine() else {continue calculatorOnLoop}
    guard pathArray.contains(userPath) else {continue calculatorOnLoop}
    switch userPath {
    case "simple":
        print("please enter your operation..")
        guard let userInput = readLine() else{continue calculatorOnLoop}
        let userInputArray = userInput.components(separatedBy: " ")
        guard userInputArray.count == 3 else {print("use the right input"); continue calculatorOnLoop}
        guard let double1unwrapped = Double(userInputArray[0]) else {print("make sure you enter a number"); continue calculatorOnLoop}
        guard let double2unwrapped = Double(userInputArray[2]) else {print("make sure you enter a number"); continue calculatorOnLoop}
        double1 = double1unwrapped
        double2 = double2unwrapped
        
        theOperator.append(userInputArray[1])
       
        if theOperator == "?"{
            theOperator = randomOperatorArray.randomElement() ?? "You tried it"
            let mathFunction = mathStuffFactory(opString: theOperator)
            let answer1 = mathFunction(double1,double2)
            print(answer1)
            print("what operator was used?")
            if let userResponse = readLine(){
                if userResponse == theOperator {
                    print("Congrats you got it right")
                }else{
                    print("Incorrect")
                }
            }
        }
        if theOperator != "?"{
        let mathFunction = mathStuffFactory(opString: theOperator)
        let answer = mathFunction(double1,double2)
        print("\(double1) \(theOperator) \(double2) = \(answer)")
        theOperator.removeAll()
        }
        playAgain()
    case "higher order":
        
        print("Please enter your operation")
        guard let userInput = readLine() else {continue calculatorOnLoop}
        var userInputArray = userInput.components(separatedBy: " ")
        guard userInputArray.count > 3  else {continue calculatorOnLoop}
        userinputString.append(userInputArray[0])
        userInputNumberString.append(userInputArray[1])
        computationalOperator.append(userInputArray[3])
        userChosenNumber.append(userInputArray[4])
        guard let userChosenNumber1 = Int(userChosenNumber) else {print("stop"); continue calculatorOnLoop}
        
        for element in userInputNumberString.components(separatedBy: ",") {
            if let cast = Int(element){
                userInputNumbersArray.append(cast)
            }else{
                print("Please enter valid numbers")
                continue calculatorOnLoop
            }
        }
        switch userinputString {
        case "filter":
            switch computationalOperator{
            case ">":
                myClosure = { (closure: Int) -> Bool in
                    if closure > userChosenNumber1 {
                        return true
                    }else{
                        return false
                    }
                }
                let call = filterFunction(inputArray: userInputNumbersArray, closure: myClosure)
                print("the result is \(call)")
                playAgain()
            case "<":
                myClosure = { (closure: Int) -> Bool in
                    if closure < userChosenNumber1 {
                        return true
                    }else{
                        return false
                    }
                }
                let call = filterFunction(inputArray: userInputNumbersArray, closure: myClosure)
               print("the result is \(call)")
              playAgain()
            default:
                print("INVALID")
                continue calculatorOnLoop
            }
            
        case "reduce":
            switch computationalOperator{
            case "*":
                start = 1
                myClosureReduced = { (currentTotal:Int,element:Int) -> Int in
                    let sum = currentTotal * element
                    return sum
                }
                let call = myReduceFunction(inputArray: userInputNumbersArray, myClosure: myClosureReduced, start: start)
                print("the result is \(call)")
                playAgain()
            case "+":
                start = 0
                myClosureReduced = { (currentTotal:Int,element:Int) -> Int in
                    let sum = currentTotal + element
                    return sum
                }
                let call = myReduceFunction(inputArray: userInputNumbersArray, myClosure: myClosureReduced, start: start)
                print("the result is \(call)")
                playAgain()
            default:
                print("INVALID")
                continue calculatorOnLoop
            }
        case "map":
            switch computationalOperator{
            case "*":
                myMapClosure = {(closure:Int)-> Int in
                    let result = closure * userChosenNumber1
                    
                    return result
                }
                let call = myMapFunction(inputArray: userInputNumbersArray, myClosure: myMapClosure)
               print("the result is \(call)")
               playAgain()
            case "/":
                myMapClosure = {(closure:Int)-> Int in
                    let result = closure / userChosenNumber1
                    return result
                }
                let call = myMapFunction(inputArray: userInputNumbersArray, myClosure: myMapClosure)
                print("the result is \(call)")
                playAgain()
            default:
                print("INVALID")
                 continue calculatorOnLoop
            }
        default:
            print("INVALID")
             continue calculatorOnLoop
        }
        
    default:
        print("INVALID")
        continue calculatorOnLoop
    }
}

