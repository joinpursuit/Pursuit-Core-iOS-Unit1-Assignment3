//
//  main.swift
//  calculatorProjectOldVersion
//
//  Created by Jane Zhu on 10/31/18.
//  Copyright © 2018 Jane Zhu. All rights reserved.
//

import Foundation

var appLoop: Bool = true
var mainMenuLoop: Bool = true

var basicCalculatorLoop: Bool = false
var randomCalculatorLoop: Bool = false
var operationGuessGameLoop: Bool = false
var filterNumbersLoop: Bool = false
var mapNumbersLoop: Bool = false
var reduceNumbersLoop: Bool = false

var keepAskingLoop: Bool = false
var getCondition: Bool = false

print("Welcome to SmartCalc 2.0 ")
sleep(1)

while appLoop {
    
    while  mainMenuLoop{
        print("\nEnter Command:\n(1) Basic Calculator \n(2) Random Calculator \n(3) Operation Guess Game \n(4) Filter Numbers \n(5) Transform/Map Numbers \n(6) Reduce Numbers")
        
        let whichCalculator = readLine()
        if let choice = whichCalculator {
            switch choice {
            case "1", "(1)":
                basicCalculatorLoop = true
                mainMenuLoop = false
            case "2", "(2)":
                randomCalculatorLoop = true
                mainMenuLoop = false
            case "3", "(3)":
                operationGuessGameLoop = true
                mainMenuLoop = false
            case "4", "(4)":
                filterNumbersLoop = true
                mainMenuLoop = false
            case "5", "(5)":
                mapNumbersLoop = true
                mainMenuLoop = false
            case "6", "(6)":
                reduceNumbersLoop = true
                mainMenuLoop = false
            default:
                print("Invalid input. Try again.")
                sleep(1)
                continue
            }
        }
    }
    
    
    
    while basicCalculatorLoop {
        
        print("The Basic Calculator can perform the operations: +, -, *, /")
        
        keepAskingLoop = true
        
        while keepAskingLoop {
            sleep(1)
            print("Please enter your operation in this format: 5.6 + 3.7")
            let userInput = readLine()
            if let safeUserInput = userInput {
                var userInputArray: [String] = safeUserInput.components(separatedBy: " ")
                if userInputArray.count != 3 {
                    print("Invalid Input. Please check your format. Try Again.")
                    continue
                } else {
                    keepAskingLoop = false
                    var num1: Double = Double(userInputArray[0]) ?? 0.0
                    var num2: Double = Double(userInputArray[2]) ?? 0.0
                    
                    func arithmetic(operation: String) -> (Double, Double) -> Double {
                        switch operation {
                        case "+":
                            return {num1, num2 in num1 + num2 }
                        case "-":
                            return {num1, num2 in num1 - num2 }
                        case "*":
                            return {num1, num2 in num1 * num2 }
                        case "/":
                            return {num1, num2 in num1 / num2 }
                        default:
                            return {num1, num2 in num1 + num2 }
                        }
                    }
                    
                    let operation = arithmetic(operation: userInputArray[1])
                    
                    print("\(safeUserInput) = \(operation(num1,num2))")
                    sleep(2)
                    basicCalculatorLoop = false
                    
                }
            }
        }
        mainMenuLoop = true
    }
    
    
    
    while randomCalculatorLoop {
        print("The Random Calculator will take two numbers and perform a random operation on them.")
        sleep(1)
        keepAskingLoop = true
        while keepAskingLoop {
            print("Please enter your input in this format: 4.9 ? 2.45")
            let userInput = readLine()
            if let safeUserInput = userInput {
                var userInputArray: [String] = safeUserInput.components(separatedBy: " ")
                if userInputArray.count != 3 || userInputArray[1] != "?" {
                    print("Invalid Input. Please check your format. Try Again.")
                    continue
                } else {
                    keepAskingLoop = false
                    var num1: Double = Double(userInputArray[0]) ?? 0.0
                    var num2: Double = Double(userInputArray[2]) ?? 0.0
                    let randomIntOperationGenerator: Int = Int.random(in: 0...3)
                    
                    func arithmetic(operationRandom: Int) -> (Double, Double) -> Double {
                        switch randomIntOperationGenerator {
                        case 0:
                            return {num1, num2 in num1 + num2 }
                        case 1:
                            return {num1, num2 in num1 - num2 }
                        case 2:
                            return {num1, num2 in num1 * num2 }
                        default: //aka division
                            return {num1, num2 in num1 / num2 }
                        }
                    }
                    
                    let answer = arithmetic(operationRandom: randomIntOperationGenerator)
                    
                    print("\(safeUserInput) = \(answer(num1,num2))")
                    sleep(2)
                    randomCalculatorLoop = false
                }
            }
        }
        mainMenuLoop = true
    }
    
    
    
    while operationGuessGameLoop {
        print("The Operation Guessing Game is where you can test your math skills by guessing the operation perfomed on two numbers.")
        sleep(1)
        print("You will receive a mathematic operation like this: 15.0 ? 3.0 = 5.0 \nYou will guess which operation (+, -, *, /) was done on the two numbers.")
        var num1: Int = Int.random(in: 0...100)
        var num2: Int = Int.random(in: 0...100)
        let randomIntOperationGenerator: Int = Int.random(in: 0...3)
        var answerOperation: String = ""
        
        func arithmetic(operationRandom: Int) -> (Int, Int) -> Int {
            switch randomIntOperationGenerator {
            case 0:
                answerOperation = "+"
                return {num1, num2 in num1 + num2 }
            case 1:
                answerOperation = "-"
                return {num1, num2 in num1 - num2 }
            case 2:
                answerOperation = "*"
                return {num1, num2 in num1 * num2 }
            default: //aka division
                answerOperation = "/"
                return {num1, num2 in num1 / num2 }
            }
        }
        
        let answer = arithmetic(operationRandom: randomIntOperationGenerator)
        sleep(2)
        keepAskingLoop = true
        
        while keepAskingLoop {
            print("\(num1) ? \(num2) = \(answer(num1,num2))")
            print("Can you guess the operation? Enter: +, -, *, /")
            let userInput = readLine()
            if var safeUserInput = userInput {
                safeUserInput = safeUserInput.replacingOccurrences(of: " ", with: "")
                if safeUserInput == answerOperation {
                    print("Correct Answer!")
                    sleep(2)
                    keepAskingLoop = false
                    operationGuessGameLoop = false
                } else {
                    print("Incorrect or Invalid Input. Guess Again.")
                    continue
                }
            }
        }
        mainMenuLoop = true
    }
    
    
    
    while filterNumbersLoop {
        
        var safeInputArrayAsInts: [Int] = []
        
        func myFilter(_ arr: [Int], _ closure: (Int) -> Bool) -> [Int] {
            var returnArr: [Int] = []
            for num in arr {
                if closure(num) {
                    returnArr.append(num)
                }
            }
            return returnArr
        }
        
        print("The Filter Numbers Function will take a bunch of numbers and filter out the ones that fit a given condition.")
        sleep(1)
        keepAskingLoop = true
        
        
        
        func getCondition () {
            sleep(1)
            print("Now set the condition you would like to filter these numbers with. \nYou can enter (> 3) for greater than a number, (< 5) for less than a number")
            
            var filteredArr: [Int] = []
            var userInputArray: [String] = []
            
            let userInput = readLine()
            
            
            if let safeInput = userInput {
                userInputArray = safeInput.components(separatedBy: " ")
                if userInputArray.count < 2 {
                    print("Invalid Input. Please try again.")
                    sleep(1)
                    getCondition()
                } else {
                    let userFirstWord = userInputArray[0]
                    let userSecondWord = userInputArray[1]
                    let userSecondWordArr: [String] = [userSecondWord]
                    let userSecondWordAsInt = userSecondWordArr.map{Int($0)}
                    if userSecondWordAsInt.contains(nil) {
                        print("Invalid Input. Please try again.")
                        sleep(1)
                        getCondition()
                    }
                    let userOperand = Int(userInputArray[1]) ?? 0
                    
                    switch userFirstWord {
                    case ">":
                        let greaterThanClosure = {(num: Int) -> Bool in
                            if num > userOperand {
                                return true
                            } else {
                                return false
                            }
                        }
                        filteredArr = myFilter(safeInputArrayAsInts, greaterThanClosure)
                    case "<":
                        let lessThanClosure = {(num: Int) -> Bool in
                            if num < userOperand {
                                return true
                            } else {
                                return false
                            }
                        }
                        filteredArr = myFilter(safeInputArrayAsInts, lessThanClosure)
                    default:
                        print("Invalid input. Try again")
                        sleep(1)
                        getCondition()
                    }
                    print("Your resulting filtered numbers: \(filteredArr)")
                    sleep(2)
                    filterNumbersLoop = false
                    mainMenuLoop = true
                }
            }
        }
        
        
        while keepAskingLoop {
            print("Please input a set of numbers separated by commas like this: 2,4,6,7,10")
            let userInput = readLine()
            
            if let safeUserInput = userInput {
                let safeInputArray = safeUserInput.components(separatedBy: ",")
                let checkingForNil = safeInputArray.map{Int($0)}
                if checkingForNil.contains(nil) {
                    print("Invalid input. No letters allowed. Check format.")
                    sleep(1)
                    continue
                } else {
                    for num in safeInputArray {
                        let safeNum = Int(num) ?? 0
                        safeInputArrayAsInts.append(safeNum)
                    }
                    keepAskingLoop = false
                    getCondition()
                }
            }
        }
        
    } // end of filterNumbersLoop
    
    
    
    
    while mapNumbersLoop {
        
        func myMap(_ arr: [Int],_ closure: (Int) -> Int) -> [Int] {
            var resultArray: [Int] = []
            for num in arr {
                resultArray.append(closure(num))
            }
            return resultArray
        }
        
        print("The Map Numbers Function will take a bunch of numbers and transform them according to a given condition.")
        
        sleep(1)
        
        keepAskingLoop = true
        
        var safeInputArrayAsInts: [Int] = []
        
        func getCondition() {
            
            print("Now set the condition you would like to transform these numbers with. \nYou can enter (+ 10) to increment by a number, (- 2) to decrement by a number, (* 3) to multiply by a number, (/ 4) to divide by a number")
            var userInputOperationArray: [String] = []
            var userOperation: String = ""
            
            
            var mappedArr: [Int] = []
            
            let userInput = readLine()
            if let safeInput = userInput {
                userInputOperationArray = safeInput.components(separatedBy: " ")
                if userInputOperationArray.count < 2 {
                    print("Invalid Input. Please try again.")
                    sleep(1)
                    getCondition()
                } else {
                    
                    userOperation = userInputOperationArray[0]
                    
                    let userNumConditionArr = [userInputOperationArray[1]]
                    let userNumConditionArr2 = userNumConditionArr.map({Int($0)})
                    if userNumConditionArr2.contains(nil) {
                        print("Invalid Input. Please try again.")
                        sleep(1)
                        getCondition()
                    }
                    
                    let userInputNum: Int = Int(userInputOperationArray[1]) ?? 0
                    
                    switch userOperation {
                    case "+":
                        mappedArr = myMap(safeInputArrayAsInts, {(num: Int) -> Int in
                            return num + userInputNum
                        })
                    case "-":
                        mappedArr = myMap(safeInputArrayAsInts, {(num: Int) -> Int in
                            return num - userInputNum
                        })
                    case "*":
                        mappedArr = myMap(safeInputArrayAsInts, {(num: Int) -> Int in
                            return num * userInputNum
                        })
                    case "/":
                        mappedArr = myMap(safeInputArrayAsInts, {(num: Int) -> Int in
                            return num / userInputNum
                        })
                    default:
                        print("Invalid input. Try again")
                        sleep(1)
                        getCondition()
                    }
                    
                    print("Your resulting mapped numbers: \(mappedArr)")
                    sleep(2)
                    mapNumbersLoop = false
                    mainMenuLoop = true
                }
            }
        }
        
        while keepAskingLoop {
            print("Please input a set of numbers separated by commas like this: 2,4,6,7,10")
            let userInput = readLine()
            if let safeInput = userInput {
                let safeInputArray = safeInput.components(separatedBy: ",")
                let checkingForNil = safeInputArray.map{Int($0)}
                if checkingForNil.contains(nil) {
                    print("Invalid input. No letters allowed. Check format.")
                    sleep(1)
                    continue
                } else {
                    for num in safeInputArray {
                        let safeNum = Int(num) ?? 0
                        safeInputArrayAsInts.append(safeNum)
                    }
                    keepAskingLoop = false
                    getCondition()
                }
            }
        }
    } // end of mapNumbersLoop
    
    
    
    while reduceNumbersLoop {
        print("The Reduce Numbers Function will take a bunch of numbers and reduce them to a single number using a given condition.")
        sleep(1)
        keepAskingLoop = true
        var safeInputArrayAsInts: [Int] = []
        while keepAskingLoop {
            print("Please input a set of numbers separated by commas like this: 2,4,6,7,10")
            let userInput = readLine()
            if let safeInput = userInput {
                let safeInputArray = safeInput.components(separatedBy: ",")
                let checkingForNil = safeInputArray.map{Int($0)}
                if checkingForNil.contains(nil) {
                    print("Invalid input. No letters allowed. Check format.")
                    sleep(1)
                    continue
                } else {
                    for num in safeInputArray {
                        let safeNum = Int(num) ?? 0
                        safeInputArrayAsInts.append(safeNum)
                    }
                    keepAskingLoop = false
                    getCondition = true
                }
            }
        }
        
        while getCondition {
            print("Now set the condition you would like to reduce these numbers with. \nYou can enter (+) for adding, (*) for multiplying")
            var userInputOperationArray: [String] = []
            var userOperation: String = ""
            
            var reducedNum: Int = 0
            
            let userInput = readLine()
            if let safeInput = userInput {
                userInputOperationArray = safeInput.components(separatedBy: " ")
                userOperation = userInputOperationArray[0]
                
                switch userOperation {
                case "+":
                    let addingAll = {(arr: [Int]) -> Int in
                        var returnNum = 0
                        for num in arr {
                            returnNum += num
                        }
                        return returnNum
                    }
                    reducedNum = addingAll(safeInputArrayAsInts)
                case "*":
                    let multiplyingAll = {(arr: [Int]) -> Int in
                        var returnNum = 1
                        for num in arr {
                            returnNum *= num
                        }
                        return returnNum
                    }
                    reducedNum = multiplyingAll(safeInputArrayAsInts)
                default:
                    print("Invalid input. Try again")
                    sleep(1)
                    continue
                }
                print("Your resulting reduced number: \(reducedNum)")
                sleep(2)
                getCondition = false
                reduceNumbersLoop = false
            }
        }
        mainMenuLoop = true
    }
    
}// end of reduceNumbersLoop
