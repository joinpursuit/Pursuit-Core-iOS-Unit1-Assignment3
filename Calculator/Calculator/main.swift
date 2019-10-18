//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

////var operations: ([String: (Double, Double) -> Double]) = ["+": { $0 + $1 },
////                                                          "-": { $0 - $1 },
////                                                          "*": { $0 * $1 },
////                                                          "/": { $0 / $1 }]
////
////var userAnswer = readLine()
//
func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
  switch opString {
  case "+": //A
    return {x, y in x + y } //B
  case "-":
    return {x, y in x - y }
  case "*":
    return {x, y in x * y }
  case "/":
    return {x, y in x / y }
  default:
    return {x, y in x + y } // if we use $ it will use +
  }
}


//
//
////let mathFunction = mathStuffFactory(opString: array[1])
//
//let userInput = readLine() ?? "5 + 5"
////print(UserInput.components(separatedBy: " "))
////
////print(Array(UserInput))
//
////let calcu = mathFunction(10,5)
////
//func takeInInput(input:String) -> Double {
//
//let userInputAsArray = input.components(separatedBy: " ")
//    let mathFunction = mathStuffFactory(opString: userInputAsArray[1]) //A
//    let num1 = Double(userInputAsArray[0]) ?? 0.0
//    let num2 = Double(userInputAsArray[2]) ?? 0.0
//    let calcu = mathFunction(num1, num2) //B
//
//    return calcu
//}
//
//print(takeInInput(input: userInput))
//
//// print("your calculation is \(calcu)")



//let closureOperation = mathStuffFactory(opString: "-")
//
//let result = closureOperation(20, 5)
// print("result of operation is \(result)")
print("""
Welcome to calculator!
You can do a simple math by entering two numbers and perform simple math operations with them, e.g. 2 + 2 or 3 * 5 to see the result.
OR
You can enter numbers with \"?\" between two numbers and you will have to guess what symbol was used in the calculation.
For example: 2 ? 3 gives the result 5. What symbol hides behind \"?\". Correct answer is \"+\".
""")

print("Pick a) for calculator or pick b) for functions:")

var userAnswer = readLine() ?? "a"

if userAnswer == "a" {


var validSymbol = ["+", "-", "*", "/"]
var repeatCalculation = true
let repeatFunction = true

mathLoop: repeat {
    func calculateOperation(str: String) -> Double { //why taking string but not int?
        let userEntryArray = str.components(separatedBy: " ")

        let operand1 = Double(userEntryArray[0]) ?? 0.0
        let operand2 = Double(userEntryArray[2]) ?? 0.0
        var operatorSymbol = userEntryArray[1]
        if userEntryArray.count != 3 {
            print("Please type in your equation as in example: 2 + 2 or something similar.")
            return 0.0
        } else if operatorSymbol == "?" {
            print("Guess what operation was perforn on entered numbers.")
            operatorSymbol = validSymbol.randomElement() ?? "+"  // doesn't work
            let operationClosure = mathStuffFactory(opString: operatorSymbol)
            let result = operationClosure(operand1, operand2)
//            print(result)
            print("\(operand1) ? \(operand2) = \(result)")

            let enteredSymbol = readLine()
            
            //If they are equal
            if enteredSymbol == operatorSymbol {
                print("You are right!")
                print("\(operand1) \(operatorSymbol) \(operand2) = \(result) is equal to:")
               
            } else {
                print("Bad guess! It was \(operatorSymbol).")
                print("\(operand1) \(operatorSymbol) \(operand2) = \(result) that equals to:")
            }
        }
        let operationClosure = mathStuffFactory(opString: operatorSymbol)
        let result = operationClosure(operand1, operand2)
        return result
    }
    let userEntry = readLine() ?? " "
    let resultCalculation = calculateOperation(str: userEntry)
    print("\(userEntry) = \(resultCalculation)")
} while repeatCalculation
} else if userAnswer == "b" {
//functionLoop: repeat {
//### Part 2a: Implement your own filter function
//
//Your filter will need to support:
//- Numbers less than a given number
//- Numbers greater than a given number
//You only need to filter Ints  You will write your **own** filter method (not using the built in one).  Use this as a starting point.
//```swift
//func myFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] {
//
//}
//Example:
//>filter 1,5,2,7,3,4 by < 4
//>
//>1,2,3

//   func calculateOperation(str: String) -> Double { //why taking string but not int?

print("""
Use functions! If you want:
FILTER numbers that smaller or bigger that another number use format: \"filter 3,5,7,8 by < 7\".
MAP is you want find the squares of your numbers in format: \"map 1,3,5,7,12\".
REDUCE if you want to fund a sum for your numbers in format: \"reduce 2,54,6,32,115\".
Remember to write word \"filter\", \"map\" or \"reduce\" before your input and no spaces between numbers!!
""")
    // I think I need to add condition that is userEntryArray has more than some indeces! separate for filter/map/reduce

//let userInput = readLine() ?? "filter 5, 4, 3, 1 by < 4"
//let userNumberEntryArray = userInput.components(separatedBy: CharacterSet.decimalDigits.inverted)

//let useNumbers = userNumberEntryArray.compactMap {
//    return [Int($0)]
//}


//let str = "I have to buy 3 apples, 7 bananas, 10eggs"
//let strArr = str.split(separator: " ")
//let string = "I have to buy 3 apples, 7 bananas, 10eggs"
//let stringArray = string.components(separatedBy: CharacterSet.decimalDigits.inverted)
//for item in stringArray {
//    if let number = Int(item) {
//        print("number: \(number)")
//    }
//}


//func filterFunc(arr: [Double], closure: (Double) -> Bool) -> [Double] {
//    var newArray = [Double]()
//
//    for num in arr {
//        if closure(num) {
//            newArray.append(num)
//        }
//
//    }
//    return newArray
//}

func filterFunction(arr: [Double], closure: (Double) -> Bool) -> [Double] {

var result = [Double]()
    for num in arr {
        if closure(num) {
            result.append(num)
    }
    }

    return result
}
    
    func mapFunction(arr: [Double]) -> [Double] {
        var squares = [Double]()
        for num in arr {
            squares.append(num * num)
        }
        return squares
    }
//    print(mapFunction(arr: Array[1]))
//    let usingMapResults = Array[1].map { $0 * $0 }
//    print(usingMapResults)
    
    
    
    //        // given an array of integers return an array where each value is squared
    //        // input: [1, 2, 3, 4, 5, 6]
    //        // output: [1, 4, 9, 16, 25, 36]
    //        let list1 = [1, 2, 3, 4, 5, 6]
    //        func returnSquares(arr: [Int]) -> [Int] {
    //            var squares = [Int]()
    //            for num in arr {
    //                squares.append(num * num)
    //            }
    //            return squares
    //        }
    //        print(returnSquares(arr: list1))
    //
    //        // using map
    //        let usingMapResults = list1.map { $0 * $0 }
    //        print(usingMapResults)

//filterFunc(arr: [1,2,3,4,54], closure: )
    
    let userInput = readLine() ?? "filter 3,4,5,6,90,1 by < 5"
    ////print(UserInput.components(separatedBy: " "))
    
    var array = [1,2,3,4,54]
    
    func converStrigNumbersToDouble(str:String) -> [Double] {
        var doublesFromString = [Double]()
        let someNewArray = str.components(separatedBy: ",") // ["3","4","5","6","90","1"]
        for num in someNewArray {
            
            doublesFromString.append(Double(num) ?? 0.0)
        }
        
        return doublesFromString
    }
    
    
    //userInput = the readline "filter 3,4,5,6,90,1 by < 5"
    
    
    let userEntryArray = userInput.components(separatedBy: " ") // "filter 3,4,5,6,90,1 by < 5" -> ["filter","3,4,5,6,90,1","by","<" ,"5"]
    
    let onlyDoubleArray = converStrigNumbersToDouble(str: userEntryArray[1])//[3.0,4.0,5.0,6.0,90.0,1.0]
    
if userEntryArray[0] == "filter" {
if userEntryArray[3] == "<" {
let lastStringNumber = Double(userEntryArray[4]) ?? 0.0
            print(filterFunction(arr: onlyDoubleArray, closure: {$0 < lastStringNumber}))
        } else if userEntryArray[3] == ">" {
            let lastStringNumber = Double(userEntryArray[4]) ?? 0.0
            print(filterFunction(arr: onlyDoubleArray, closure: {$0 > lastStringNumber}))
        } else {
            print("Write your equation in similar format to \"filter 3,5,7,8 by < 7\".")
    }
    } else if userEntryArray[0] == "map" {
        print(mapFunction(arr: onlyDoubleArray))
    } else if userEntryArray[0] == "reduce" {
        print(onlyDoubleArray.reduce(0, +))
        // given an array of integers return the sum
        // input: [10, -10, 50, 20]
        //output: 70
        //        let list3 = [10, -10, 50, 20]
        //        let reducesResult = list3.reduce(0, +)
        //        print(reducesResult)
    } else {
        print("""
Please enter numbers in the following format:
for FILTER function use format: \"filter 3,5,7,8 by < 7\".
for MAP function use format: \"map 1,3,5,7,12\".
for REDUCE function use format: \"reduce 2,54,6,32,115\".
Remember to write word \"filter\", \"map\" or \"reduce\" before your input and no spaces between numbers!
""")
    }
    //} while repeatFunction
    


//print("pick one ")
//let option = readLine()
//
//if option == "a"
//
//
//} else if option == "b" {
//
//
//
//    FunctionArrowPrecedencelet userInputForFunc = readLine() ?? " "
//Filter
//
//Map
//
//Reduce

//var condition = true
//LoopRepeat: repeat {
//
//} while conditionControlsLoopRepeat

//if userInputAsArray[0] == "filter" {
//    print("in filter")
//
//} else if userInputArray[0] == "map"
//print("in map")
//} else if userInpetArray[0] == "reduce" {
//print("in reduce")
//
//} while repeatFunction
}


