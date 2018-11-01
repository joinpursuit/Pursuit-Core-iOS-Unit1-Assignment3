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

var basicCalc: Bool = false
var highOrderCalcLoop: Bool = false
var keepAskingLoop: Bool = false

print("Thanks for using SmartCalc 2.0.\n")

while appLoop {
    
    func mainMenu() {
        print("Enter type of calculation: \n(1) basic \n(2) high order\n")
        
        let whichCalculator = readLine()
        if let choice = whichCalculator {
            switch choice {
            case "1", "(1)", "basic":
                regularCalc()
            case "2", "(2)", "high order":
                highOrderCalc()
            default:
                print("Invalid input. Try again.\n")
                sleep(1)
                mainMenu()
            }
        }
    }
    mainMenu()
    
    func calcAgain() {
        print("Would you like to calculate again? (yes) (no)\n")
        let whichCalculator = readLine()
        if let choice = whichCalculator {
            switch choice.lowercased() {
            case "yes", "1":
                mainMenu()
            case "no", "2":
                print("Thanks for using SmartCalc 2.0. Please give us a 5-Star ⭐️⭐️⭐️⭐️⭐️ rating at the App Store.\n")
                appLoop = false
            default:
                print("Invalid input. Try again.\n")
                sleep(1)
                calcAgain()
            }
        }
    }
    
    func regularCalc() {
        print("Enter your operation in this format: 5 + 3 \nYou can choose +,-,*,/, or ? for the operation.\n")
        let userInput = readLine()
        if let safeUserInput = userInput {
            var userInputArray: [String] = safeUserInput.components(separatedBy: " ")
            let convertToDouble = userInputArray.map({Double($0)})
            
            if userInputArray.count != 3 {
            print("Invalid Input. Please check your format. Try Again.\n")
                sleep(1)
                regularCalc()
            }
            
            let arrToTestForNil = [userInputArray[0], userInputArray[2]]
            let safeDoubleArr = arrToTestForNil.map({Double($0)})

            if safeDoubleArr.contains(nil) {
                print("Invalid Input. Please make sure you have two operand numbers. Try Again.\n")
                sleep(1)
                regularCalc()
            }
            
            let randomIntOperationGenerator: Int = Int.random(in: 0...3)
            
            let num1 = convertToDouble[0] ?? 0.0
            let num2 = convertToDouble[2] ?? 0.0
                
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
                    case "?":
                        if randomIntOperationGenerator == 0 {
                                return {num1, num2 in num1 + num2 }
                            } else if randomIntOperationGenerator == 1 {
                                return {num1, num2 in num1 - num2 }
                            } else if randomIntOperationGenerator == 2 {
                                return {num1, num2 in num1 * num2 }
                            } else {
                                return {num1, num2 in num1 / num2 }
                            }
                    default:
                        print("Invalid Input. Please check your format. Try Again.\n")
                        regularCalc ()
                        return {num1, num2 in num1 + num2 }
                    }
                }
                
            
                

                func guessTheOperation () {
                    let operation = arithmetic(operation: userInputArray[1])
                    print("\(safeUserInput) = \(operation(num1,num2))")
                if userInputArray[1] == "?" {
                    print("Guess the operator used? +, -, *, or /\n")
                    let userGuessOperator = readLine()
                    
                    if randomIntOperationGenerator == 0 && userGuessOperator == "+" {
                        print("Correct!")
                    } else if randomIntOperationGenerator == 1 && userGuessOperator == "-" {
                        print("Correct!")
                    } else if randomIntOperationGenerator == 2 && userGuessOperator == "*" {
                        print("Correct!")
                    } else if randomIntOperationGenerator == 1 && userGuessOperator == "1" {
                        print("Correct!")
                    } else {
                        print("Incorrect Answer. Try Again.\n")
                        sleep(1)
                        guessTheOperation()
                    }
                    } }
                
                guessTheOperation()
                
                sleep(1)
                print("")
                calcAgain()
        }
    }
    
    
    
    
    
    
    
    
    func highOrderCalc() {
        var userInputArr: [String] = []
        var userInputIntArray: [Int] = []
        var userNumCondition: Int = 0
        var userCondition: String = ""
        var filteredArr: [Int] = []
        var mappedArr: [Int] = []
        var reducedNum: Int = 0
        
        
        print("Enter your operation, array of numbers, and condition. Example: \nfilter 1,2,3,4,5 by < 3\nmap 2,4,6,8,10 by * 2 (choose operation: +, -, *, /)\nreduce 3,6,9,12 by + 3 (choose +, * a starting number)\n")
        
    
        
        func filter() {
            
            func myFilter(_ arr: [Int], _ closure: (Int) -> Bool) -> [Int] {
                var returnArr: [Int] = []
                for num in arr {
                    if closure(num) {
                        returnArr.append(num)
                    }
                }
                return returnArr
            }
            
            
            switch userCondition {
            case ">":
                let greaterThanClosure = {(num: Int) -> Bool in
                    if num > userNumCondition {
                        return true
                    } else {
                        return false
                    }
                }
                filteredArr = myFilter(userInputIntArray, greaterThanClosure)
            case "<":
                let lessThanClosure = {(num: Int) -> Bool in
                    if num < userNumCondition {
                        return true
                    } else {
                        return false
                    }
                }
                filteredArr = myFilter(userInputIntArray, lessThanClosure)
            default:
                print("Invalid input. Try again.\n")
                sleep(1)
                highOrderCalc()
            }
            print("Your resulting filtered numbers: \(filteredArr)\n")
        } // this part is done
        
        
        
        
        
        func map() {
            func myMap(_ arr: [Int],_ closure: (Int) -> Int) -> [Int] {
                var resultArray: [Int] = []
                for num in arr {
                    resultArray.append(closure(num))
                }
                return resultArray
            }
            
            switch userCondition {
            case "+":
                mappedArr = myMap(userInputIntArray, {(num: Int) -> Int in
                    return num + userNumCondition
                })
            case "-":
                mappedArr = myMap(userInputIntArray, {(num: Int) -> Int in
                    return num - userNumCondition
                })
            case "*":
                mappedArr = myMap(userInputIntArray, {(num: Int) -> Int in
                    return num * userNumCondition
                })
            case "/":
                mappedArr = myMap(userInputIntArray, {(num: Int) -> Int in
                    return num / userNumCondition
                })
            default:
                print("Invalid input. Try again.\n")
                sleep(1)
                highOrderCalc()
            }
            print("Your resulting mapped numbers: \(mappedArr)\n")
        }
        
        
        
        
        
        
        
        func reduce() {
            
            switch userCondition {
            case "+":
                let addingAll = {(arr: [Int]) -> Int in
                    var returnNum = userNumCondition
                    for num in arr {
                        returnNum += num
                    }
                    return returnNum
                }
                reducedNum = addingAll(userInputIntArray)
            case "*":
                let multiplyingAll = {(arr: [Int]) -> Int in
                    var returnNum = userNumCondition
                    for num in arr {
                        returnNum *= num
                    }
                    return returnNum
                }
                reducedNum = multiplyingAll(userInputIntArray)
            default:
                print("Invalid input. Try again\n")
                sleep(1)
                highOrderCalc()
            }
            print("Your resulting reduced number: \(reducedNum)\n")
        }
        
        
        
        
        
        
        if let userInput = readLine() {
            userInputArr = userInput.components(separatedBy: " ")
            
            // checking for poor format and not enough parts
            if userInputArr.count != 5 {
                print("Invalid Input. Try Again. Please make sure you have the correct format: \n(filter/map/reduce) (an array of numbers) \"by\" (>,<,*,+,-,/) (a number for your condition)\n")
                print("")
                sleep(1)
                highOrderCalc()
            }
            
            if userInputArr[2] != "by" {
                print("Invalid Input. Please check your spelling. Try Again.\n")
                print("")
                sleep(1)
                highOrderCalc()
            }
            
            // checking for nils in num array and the last number condition
            let unwrappingIntArr = userInputArr[1].components(separatedBy: ",").map({Int($0)})
            let userConditionNumArr = [userInputArr[4]].map({Int($0)})
            
            if unwrappingIntArr.contains(nil) {
                print("Invalid Input. Please check your format for the array of numbers. Try Again.\n")
                sleep(1)
                highOrderCalc()
            }
            
            if userConditionNumArr.contains(nil) {
                print("3-Invalid Input. Please check your format for the last number for your condition. Try Again.\n")
                sleep(1)
                highOrderCalc()
            }
            
            for num in unwrappingIntArr {
                if let safeNum = num {
                userInputIntArray.append(safeNum)
            }
            }
            
            userNumCondition = Int(userInputArr[4]) ?? 0
            userCondition = userInputArr[3]
            
            if userInputArr[0] == "filter" && (userInputArr[3] == ">" || userInputArr[3] == "<") {
                filter()
            } else if userInputArr[0] == "map" && (userInputArr[3] == "+" || userInputArr[3] == "-" || userInputArr[3] == "*" || userInputArr[3] == "/") {
                map()
            } else if userInputArr[0] == "reduce" && (userInputArr[3] == "*" || userInputArr[3] == "+") {
                reduce()
            } else {
                print("Invalid Input. Please check your spelling. Try Again.\n")
                sleep(1)
                highOrderCalc()
            }
        }
        
        calcAgain()
        
    }
    
}

    



