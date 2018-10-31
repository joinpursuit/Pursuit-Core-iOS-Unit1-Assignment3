//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

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

var num1: Double = 0.0
var num2: Double = 0.0
var stringOperator = " "
var isThisADouble = false
var isThisAnotherDouble = false
var isThisAnOperator = false
//var arrayOfOperatorForRandom = ["+","-","/","*", "?"]


let validOperation = true

while validOperation {
    print("Enter a two digit operation: 5 + 5")
    let userOperation = readLine() ?? "not a value"
    
    let componentOfOperation = userOperation.components(separatedBy: " ")
    print(componentOfOperation)
    
    //if you are not giving me digit, operator, digit - three elements not getting in
    
    if let firstNum = Double(componentOfOperation[componentOfOperation.startIndex]){
        num1 = firstNum
    } else {
        print("this is not a valid entry")
        continue
    }
    if let secondNum = Double(componentOfOperation[componentOfOperation.endIndex-1]){
        num2 = secondNum
    } else {
        print("this is not a valid entry")
        continue
    }
    
    guard componentOfOperation[1] != "/" || num2 != 0 else { //still get a fatal error if I do not enter a second character - for later
        print("Invalid operation")
        continue}
    
    print(mathStuffFactory(opString: componentOfOperation[1])(num1, num2)) // proof for fatal error
    
}

//filter function
func myFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] {
    var resultArray = [Int]()
    
    for num in inputArray{
        if filter(num){
            resultArray.append(num)
        }
    }
    return resultArray
}


let x = [1,2,1,3,4,1,2]
let y = 3
print(myFilter(inputArray: x){ y > $0 ? true : false})

//map function
func myMap(arrayOfNums: [Int], mapClosure: (Int) -> Int) -> [Int]{
    var emptyBox = [Int]()
    for num in arrayOfNums{
        emptyBox.append(mapClosure(num))
    }
    return emptyBox
}
let inputUser = 2
let r = [2,3,4,-5]
print(myMap(arrayOfNums: r){inputUser * $0})


//reduce function
func myReduce(arrOfNum: [Int], user: Int, reduceClosure: (Int) -> Int) -> Int{
    var tempResult = user
    for num in arrOfNum{
        tempResult += reduceClosure(num)
    }
    
    return tempResult
}

let f = [2,1,3,3,1,2]//12 + 3 = 15
let userInput = -3

print(myReduce(arrOfNum: f, user: userInput){$0})
