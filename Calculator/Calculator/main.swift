//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (Double, Double) -> Double { // take in a string and returns closure
    switch opString {
    case "+":
        return {x, y in x + y } //shorthand closure syntax
    case "-":
        return {x, y in x - y }
    case "*":
        return {x, y in x * y }
    case "/":
        return {x, y in x / y }
    default:
        return {x, y in x + y } // here is where it will reject unknown operators. this doesnt work: {print("Unknown operator: \(opString)")
    }
}

// Filter function:

func myFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] { // filter is a closure that takes an Int and returns a bool
    var filteredArray: [Int] = []
    
    for num in inputArray{
        if filter(num) {
            filteredArray.append(num)
        }
    }
    
    return filteredArray
}

// Map function:

func customMap(arr: [Int], closure: (Int) -> (Int)) -> [Int]  { // the closure takes an Int and returns an Int after its completed the "transformation"
    var transformedArray = [Int]()
    for num in arr {
        // perform transformation based on closure and append result in transformedArr
        
        transformedArray.append(closure(num)) // closure expacts an argument of type Int
    }
    
    return transformedArray
}

// Reduce function:

func myReduce(arr: [Int], startNum: Int, reduceClosure: (Int, Int) -> (Int)) -> Int {
    var reducedNum = startNum
    
    for num in arr {
        reducedNum = reduceClosure(reducedNum, num)
    }
    return reducedNum
}

//=====================================================================================================
//                                   START OF CALCULATOR:
//=====================================================================================================


print("Hello my name is Ms.Calculator 🧕🏽")
print("Whats your name 😊 ?")
var name = readLine() ?? "No name"
print("Hello \(name.capitalized), do you need some help with math (1) or just someone to talk to(2)?")
var need = Int(readLine() ?? "0") ?? 0

switch need{
case 1:
    print("Well you've come to the right spot \(name.capitalized), cuz Im not a great listener. 😬")
    print("Ok cool. Lets Begin")
    sleep(2)

    var calcAgain = "no"

    repeat {
        print("Enter type of calculation: regular or high order?")
        let calcType = readLine() ?? "no entry"
        print()
        
        switch calcType.lowercased() {
            
            //====================================
            // IF THE USER ENTERS REGULAR:
            //====================================
            
        case "regular":
            
            var inputCount = 3
            var operation = ""
            var operationComponents = [""]
            
            repeat {
                if inputCount != 3 {
                    print("Please enter value in correct format:")
                }
                print("Great, now enter your operation: e.g. 5 + 3")
                operation = readLine() ?? "no entry"
                print()
                operationComponents = operation.components(separatedBy: " ")
                inputCount = operationComponents.count
            } while inputCount != 3
            
            let operandOne = Double(operationComponents[0])
            let opt = operationComponents[1]
            let operandTwo = Double(operationComponents[2])
            
            let allowedOpt = ["+", "-", "?", "/", "*"]
            
            if allowedOpt.contains(opt) {
                
                if let operand1 = operandOne, let operand2 = operandTwo {
                    
                    if opt == "?" {
                        print("Play Random guessing game")
                        
                        let optArray = ["+", "-", "/", "*"]
                        
                        let randomOpt = optArray.randomElement() ?? "+"
                        let closureOperation = mathStuffFactory(opString: randomOpt)
                        let result = closureOperation(Double(operand1), Double(operand2))
                        print("\(operation) = \(result)")
                        var guess = ""
                        
                        repeat {
                            print()
                            print("Guess the operation")
                            guess = readLine() ?? "+"
                            
                            if guess == randomOpt {
                                print("Correct!!!!!! 👍🏼")
                            } else {
                                print("Wrong... 👎🏼 Try again")
                            }
                            
                        } while guess != randomOpt
                        
                    } else {
                        
                        let closureOperation = mathStuffFactory(opString: opt)
                        let result = closureOperation(Double(operand1), Double(operand2))
                        print("\(operation) = \(result)")
                        print()
                    }
                    
                } else {
                    print("Please enter your calculation in the correct format e.g. 5 + 3")
                }
                
            } else {
                print("Unknown operator: \(opt)")
            }
            //====================================
            // IF THE USER ENTERS HIGHER ORDER
            //====================================
            
        case "high order":
            
            var inputCount = 5
            var operation = ""
            var operationComponents = [""]
            
            repeat {
                if inputCount != 5 {
                    print("Please enter value in correct format:")
                }
                
                print("Enter your operation e.g filter 1,5,2,7,3,4 by < 4")
                operation = readLine() ?? "no entry"
                operationComponents = operation.components(separatedBy: " ")
                inputCount = operationComponents.count
            } while inputCount != 5
            
            
            let numArrayAsStr = operationComponents[1].components(separatedBy: ",")
            let numArrayAsInt =  numArrayAsStr.map{Int($0) ?? 0} // the numbers as an array of Int
            print()

            if operation.hasPrefix("filter") {
                
                let comparingType = operationComponents[3]
                let comparingNum = Int(operationComponents[operationComponents.count - 1]) ?? 0
                
                switch comparingType {
                case ">":
                    print("Result = \(myFilter(inputArray: numArrayAsInt, filter: {$0 > comparingNum}))")
                    
                case "<":
                    print("Result = \(myFilter(inputArray: numArrayAsInt, filter: {$0 < comparingNum}))")
                    
                case "%":
                    print("Result = \(myFilter(inputArray: numArrayAsInt, filter: {$0 % comparingNum == 0}))") // what ever is in the filter has to return a Bool!!!!
                default:
                    print("I do not recognize your operator: \(comparingType). Please check your format.")
                    
                }
                
            } else if operation.hasPrefix("map") {
                
                let mappingType = operationComponents[3]
                let mappingNum = Int(operationComponents[operationComponents.count - 1]) ?? 0
                
                switch mappingType {
                case "*":
                    print("Result = \(customMap(arr: numArrayAsInt , closure: {$0 * mappingNum}))")
                case "+":
                    print("Result = \(customMap(arr: numArrayAsInt , closure: {$0 + mappingNum}))")
                case "-":
                    print("Result = \(customMap(arr: numArrayAsInt , closure: {$0 - mappingNum}))")
                case "/":
                    print("Result = \(customMap(arr: numArrayAsInt , closure: {$0 / mappingNum}))")
                default:
                    print("I do not recognize your operator: \(mappingType). Please check your format.")
                }
                
            } else if operation.hasPrefix("reduce") {
                let reducingType = operationComponents[3]
                let reducingNum = Int(operationComponents[operationComponents.count - 1]) ?? 0
                
                if reducingType == "+" {
                    
                    print("Result = \(myReduce(arr: numArrayAsInt, startNum: reducingNum, reduceClosure: {$0 + $1}))")
                } else if reducingType == "*" {
                    
                    print("Result = \(myReduce(arr: numArrayAsInt, startNum: reducingNum, reduceClosure: {$0 * $1}))")
                } else {
                    print("I do not recognize your operator: \(reducingType). Please check your format.")
                }
                
            } else {
                print("Could not recognize your high order function.")
            }
            // }
            
        default:
            print("Type not recognized")
            print("Possible errors: Spelling or Spacing.")
            
        }
        print()
        print("Calculate again? yes or no?")
        calcAgain = readLine() ?? "no"
        print()
        
    } while calcAgain.lowercased() == "yes"

    print("Happy calculating! 🥳 See you next time!")
    
    
case 2:
    print("Um, listen \(name.capitalized), I cant really help you with that... Im just a calculator.....")
    sleep(3)
    print("Yea this is awkward... I'll just leave now.")
    sleep(3)
    print("Good bye \(name.capitalized)")
default:
    print("Choose 1 or 2")
    break
}




