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
var mathmeticalSymbolArray = ["+", "-", "*", "/", "?"]
var highOrderFunctions = ["map", "filter", "reduce"]
var higerOrderOperators = [">", "<", "*", "/", "+"]

func myFilter(array: [Int], myClosure: (Int) -> Bool) -> [Int] {
    var emptyArray = [Int]()
    for number in array {
        if myClosure(number) {
            emptyArray.append(number)
        }
    }
    return emptyArray
}


func myMap(array: [Int], myClosure: (Int) -> Int) -> [Int] {
    var emptyArray = [Int]()
    for number in array {
        let newNumber = myClosure(number)
        emptyArray.append(newNumber)
    }
    return emptyArray
}

func myReduce(array: [Int], myClosure:(Int, Int) -> Int, myGivenValue: Int) -> Int {
var currentTotal = myGivenValue
for number in array {
    currentTotal = myClosure(currentTotal, number)
    }
    return currentTotal
}

var calculatorOn = true
while calculatorOn {
    print("Do you want to do hardMath or softMath?")
let userInput = readLine()
    guard let userInputUnwrapped = userInput else { continue }

switch userInputUnwrapped {
    
case "softMath":
    print("Give me something to calculate")
    let userInput = readLine()
    guard let userInputUnwrapped = userInput else { continue }
    var inputArray = userInputUnwrapped.components(separatedBy: " ")
    guard inputArray.count == 3 else {
        print("You can't enter more then three things")
        continue
}
    guard let input1 = Double(inputArray[0]) else {
        print("Please be smart and enter a number")
        continue
}
    guard let input3 = Double(inputArray[2]) else {
        print("Again don't be dumb enter a number")
        continue
}
    guard mathmeticalSymbolArray.contains(inputArray[1]) else {
        print("Bro enter the right mathametical operation")
        continue
    }
switch inputArray[1] {
    
    case "+":
    let result = mathStuffFactory(opString: "+")(input1, input3)
    print(result)
    case "-":
    let result = mathStuffFactory(opString: "-")(input1, input3)
    print(result)
    case "*":
    let result = mathStuffFactory(opString: "*")(input1, input3)
    print(result)
    case "/":
    let result = mathStuffFactory(opString: "/")(input1, input3)
    print(result)
    case "?":
    let randomNum = Int.random(in:0...3)
    var randomOperator = ""
    
switch randomNum {
    
 case 0:
    randomOperator = "+"
 case 1:
    randomOperator = "-"
 case 2:
    randomOperator = "*"
 case 3:
    randomOperator = "/"
 default:
    print("Try again.")
}
let result = mathStuffFactory(opString: randomOperator)(input1, input3)
    print(result)
    print("Guess what mathematical symbol was used")
let userInput = readLine()
    guard let userInputUnwrapped = userInput else { continue }
    if userInputUnwrapped == randomOperator {
        print("Good Job")
    } else {
        print("Bad Job")
    }
default:
    print("Try again, Please.")
}

case "hardMath":
    print("Choose a higher order function of map, filter, reduce")
    let userInput = readLine()
    guard let userInputUnwrapped = userInput else { continue }
    let userArray = userInputUnwrapped.components(separatedBy: " ")
    guard userArray.count == 5 else {
        print("Try Again")
        continue
    }
    guard highOrderFunctions.contains(userArray[0]) else {
        print("Enter the correct operation")
        continue
    }
    let stringNumberArray = userArray[1].components(separatedBy: ",")
    var arrayOfNumbers = [Int]()
    for stringOfNumbers in stringNumberArray {
        if let num = Int(stringOfNumbers) {
            arrayOfNumbers.append(num)
        }
    }
    guard userArray[2] == "by" else
    { print("Please enter by")
        continue }
    guard higerOrderOperators.contains(userArray[3]) else {
        print("Enter a in a valid operation")
        continue }
    
    guard let userInputNumber = Int(userArray[4]) else {
        print("Enter a number")
        continue }
        var userOperator = userArray[3]
        var userHighOrderFunctionWord = userArray[0]
    
switch userHighOrderFunctionWord {
    case "filter":
        if userOperator == "<" {
            print(myFilter(array: arrayOfNumbers, myClosure: { (number) -> Bool in
                return number < userInputNumber
            }))
        } else if userOperator == ">" {
            print(myFilter(array: arrayOfNumbers, myClosure: { (number) -> Bool in
                return number > userInputNumber
            }))
        } else {
            print("It is not vaild, please enter either > or <")
    }
    case "map":
        if userOperator == "*" {
            print(myMap(array: arrayOfNumbers, myClosure: { (number) -> Int in
                return number * userInputNumber
            }))
        } else if userOperator == "/" {
            print(myMap(array: arrayOfNumbers, myClosure: { (number) -> Int in
                return number / userInputNumber
            }))
        } else {
            print("It is not vaild, please enter either * or /")
    }
    case "reduce":
        if userOperator == "+" {
            print(myReduce(array: arrayOfNumbers, myClosure: { (number1, number2) -> Int in
                return number1 + number2
            }, myGivenValue: userInputNumber))
        } else if userOperator == "*" {
            print(myReduce(array: arrayOfNumbers, myClosure: { (number1, number2) -> Int in
                return number1 * number2
            }, myGivenValue: userInputNumber))
        } else {
            print("It is not vaild, please enter either * or +")
    }
    default:
        print("Enter the a higer order function of filter, map, or reduce")
}
    default:
        print("Keep trying")
    }

}


























//var mathOperation = mathStuffFactory(opString: "/")
//
//
////calculate result using closure returned from mathStuffFactory
//var firstNum = Double()
//var secondNum = Double()
//if let firstNumber = Double(components[0]) {
//    firstNum = firstNumber
//}
//if let secondNumber = Double(components[2]) {
//    secondNum = secondNumber
//}
//let result = mathOperation(firstNum,secondNum)
//print("a\(userInput) = \(result)")
