//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation
var testArray = [1,2,3,4,5]


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
    return {x, y in x + y}
    }
  }


func randomGuess(x:Double, y:Double) {
    let operatorArray = ["+","-","*","/"]
    print("Guess the Operator")
    if let randomPick = operatorArray.randomElement() {
        let randomOpertation = mathStuffFactory(opString: randomPick)
        let result = randomOpertation(x, y)
        print ("\(x) ? \(y) = \(result)")
        let userInput = readLine()
        if userInput == randomPick {
            print("you got it!")
            menu()
        } else {
            print("you got it wrong!")
            menu()
        }
        
        
        
    }
    
}


func basicCalc() {
    print("Enter a calculation e.g. 5 + 5")
    var x = Double()
    var y = Double()
let userInput = readLine()
let userinputUnWrapped = userInput ?? ""
var components = userinputUnWrapped.components(separatedBy: " ")
//print(components)
let mathOperation = mathStuffFactory(opString: components[1])
    if components[1] != "*" && components[1] != "+" && components[1] != "/" && components[1] != "-" && components[1] != "?" {
        print("invalid operator")
        if components[1] == "?" {
            randomGuess(x: x, y: y)
        }
        } else {
//calculate result using closure returned from mathStuffFactory()

if let firstNumber = Double(components[0]) {
    x = Double(firstNumber)
} else {
    x = 0.0
    print("Incorrect Input")
    basicCalc()
    }
if let secondNumber = Double(components[2]) {
    y = Double(secondNumber)
} else {
    y = 0.0
    print("Incorrect Input")
    basicCalc()
    }
let result = mathOperation(x,y)

print("\(userinputUnWrapped) = \(result)")
    
    let operand = components[1]
        if operand == "?" {
            randomGuess(x: x, y: y)
    }
}
    print("Would you like to calculate again? y/n")
        let answer = readLine() ?? ""
    switch answer {
    case "y":
        basicCalc()
    default:
        print("Good Bye")
    }
    }


func menu() {
    print("Enter type of calculation, 1 (regular) or 2 (high order)")
 let userInput = readLine() ?? ""
    switch userInput {
    case "1" :
            basicCalc()
    case "2":
           print("whatever")
        menu()
    default:
        menu()
    }
}
menu()











//
////FILTER
//func myFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] {
//    var filteredArray = [Int]()
//    for num in inputArray {
//        if filter(num){
//                filteredArray.append(num)
//            }
//        }
//    return filteredArray
//    }
//print(myFilter(inputArray: testArray) { $0 % 2 == 0})
//
////REDUCE
//func myReduce(inputArray: [Int], reduce: (Int) -> Int) -> Int{
//    var reducedArray = 0
//    for num in inputArray {
//        reducedArray += num
//
//
//    }
//    return reducedArray
//
//    }
////MAP
//func myMap(numArr: [Int], closure:((Int) -> Int)) -> [Int]  {
//    var newArr = [Int]()
//for number in numArr {
//    let result = closure(number)
//     newArr.append(result)
//
//
//}
//    return newArr
//
//}
//print(myMap(numArr: testArray, closure: {$0 * $0}))
//
//print(myReduce(inputArray: testArray, reduce: {$0}))

