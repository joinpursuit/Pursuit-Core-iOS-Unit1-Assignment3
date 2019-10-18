//
//  main.swift
//  Calculator
//
//  Created by Bienbenido Angeles on 10/11/19.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: Character) -> (Double, Double) -> Double {
  switch opString {
  case "+":
    return {x, y in x + y } // short hand closure sequence
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

/*
let closureOperation = mathStuffFactory(opString: "+")
let result = closureOperation(45, 5)
print("result of operation is:", result)
*/


//game restart function
func gameRestart() {
    print("Calculate again, yes or no?")
    let userResponse = getUserInput()
    switch userResponse {
    case "yes":
        calculator()
    case "no":
        break
    default:
        print("User did not enter a valid \"yes\" or \"no\" response")
        gameRestart()
    }
}

//Part 2 custom functions of filter, map, and reduce:

//filter function
func customFilter(arr: [Double], closure:(Double) -> Bool) -> [Double] {
    var result = [Double]()
    for num in arr {
        if closure(num) {
            result.append(num)
        }
    }
    return result
}

//print(filterFunc(arr: [3,4,5,6], closure: {$0 < 3}))

/* if array[2] == "<" {
    print(filterFunc(arr: [3,4,5,6], closure: {$0 < 3}))
 } else {
    print(filterFunc(arr: [3,4,5,6], closure: {$0 > 3}))
 }
*/

//CustomMap function
func customMap(arr:[Double], closure: (Double) -> (Double)) -> [Double] {
    var transformedArr = [Double]()
    for num in arr {
        // perform transformation based on closure and append result in transformedArr
        transformedArr.append(closure(num))
    }
    return transformedArr
}

//Reduce function reduce 1,2,3 by + 30
func customReduce(arr: [Double], operand:(Double), reducePair: (Double,Double) -> Double) -> Double {
    var resultOfWholeFunc = operand
    
    guard let firstElement = arr.first else {
        print("There are no elements within the array")
        return 0.0
    }
    
    //if the array has a count that is by a single element, return that element
    guard arr.count >= 1 else {
        return firstElement
    }
    
    for currenValue in arr {
       resultOfWholeFunc = reducePair(currenValue,resultOfWholeFunc)
    }
    
    return resultOfWholeFunc
}



//function to get a valid userInput
func getUserInput () -> String {
    guard let userInput = readLine() else {
        return "You did not enter a valid response"
    }
    return userInput
}

//regularCalc used to create regular calculations
func regularCalc() {
    print("Enter your operation. e.g 5 + 3")
    let userReadline = getUserInput()
    
    let operatorsArr:[Character] = ["+", "-", "*", "/", "?"]
    let operatorsArrRandom:[Character] = ["+", "-", "*", "/"]
    
    //value used to set a default operand if no operand exists
    var operatorChar:Character = "X"
    var operandsStringArr = [String]()
    
    //trims the string for consistancy of at least 3 characters
    let trimmedUserReadLine = userReadline.replacingOccurrences(of: " ", with: "")
    
    //Print statement to check code
//    print(trimmedUserReadLine)
    
    //checks to see if a operator is existant
    var operatorCheck = false
    for operators in operatorsArr {
        if trimmedUserReadLine.contains(operators){
            operatorCheck = true
            break
        } else {
            operatorCheck = false
        }
    }
    
    // if operator exists the rest of the code is run
    guard operatorCheck
    else {
        return print("Operator not found to evaluate the given input: \(userReadline). Consider using the operators: +, -, *, /, or ?")
    }
        
    //gets operator
    for char in trimmedUserReadLine {
        if operatorsArr.contains(char){
            operatorChar = char
        }
    }
    
    //gets the operands of a expression as data type string and store them into an array
    operandsStringArr = trimmedUserReadLine.components(separatedBy: String(operatorChar))
    
    var operandsDoubleArr = [Double]()
    //var operandsDouble = Double()
    
    //gets operands as an String and store them to an array of Int
    for operandString in operandsStringArr {
        guard let operandsDouble = Double(operandString) else {
            return print("User input: \(userReadline) did not enter valid data type of double or integer to be evaluated")
        }
        operandsDoubleArr.append(operandsDouble)
        //operandsDoubleArr.append(Double(operandString) ?? 0)
    }
    
    //Print statement to check code
//    print(operandsDoubleArr)
    
    //Once user enters the correct input go into here:
    if (operatorChar == "?") {
        guard let operatorRandomChar = operatorsArrRandom.randomElement() else {
            return print("Operator could not be found to choose randomly from an array")
        }
        
        let operatorSelectMath = mathStuffFactory(opString: operatorRandomChar)
        let resultant = operatorSelectMath(operandsDoubleArr[0], operandsDoubleArr[1])
       
        print(resultant)
        print("Guess the operator used: +, -, *, or /")
        let userOperatorGuess = getUserInput()
        
        if Character(userOperatorGuess) == operatorRandomChar {
            print("Correct!")
        } else {
            print("Incorrect!")
        }
        
    } else {
        let calcMath = mathStuffFactory(opString: operatorChar)
        let result = calcMath(operandsDoubleArr[0], operandsDoubleArr[1])
        print("\(userReadline) = \(result)")
    }
    //Print statements to check if code is correct
//    print("The operator char is:", operatorChar)
//    print("The operands are:", operandsDoubleArr)

}

//highOrderCalc used to create high order calculations
func highOrderCalc() {
    print("Enter your operation. e.g filter 1,2,3,4,5,6 by < 4")
    let userReadline = getUserInput()
    let trimmedUserReadline = userReadline.trimmingCharacters(in: .whitespaces)

    let operations = ["filter", "map", "reduce"]
    let operandsArr:[Character] = [">", "<", "*", "/", "+"]
    var operationChar:Character = "X"
    
    
    //to check if user entered a correct highOrder function to be evaluated
    var operationCheck = false
    for hiOrderFunc in operations{
        if trimmedUserReadline.lowercased().hasPrefix(hiOrderFunc) {
            operationCheck = true
            break
        } else {
            operationCheck = false
        }
    }
    
    //guard to check if user entered a correct operation
    guard operationCheck else {
        return print("User input: \(userReadline) did not include a high order function such as (filter, map, or reduce) to evaluate on a given array of integers")
    }
    
    //trimmed user string to get the components of operation, array, operator, and the operand that'll be applied to the array
    let trimmedUserReadlineArrComponents = trimmedUserReadline.components(separatedBy: " ")
    //print(trimmedUserReadlineArrComponents)
    
    

    //get the operator
    for char in trimmedUserReadline{
        if operandsArr.contains(char) {
            operationChar = char
        }
    }
    
    //checks to see if there are at least 5 components,
    guard trimmedUserReadlineArrComponents.count == 5 && trimmedUserReadlineArrComponents[2] == "by" && trimmedUserReadlineArrComponents[3] ==  String(operationChar) else {
        return print("User input: \(userReadline), did not correspond to the appropriate syntax of \"operation\" \"array\" \"by\" \"operator\" \"number\"")
    }
    
    //convert string of index 1 to an array while seperating each character by ","
    let subElementsOfArrayFromUserReadlineAsString = trimmedUserReadlineArrComponents[1].components(separatedBy: ",")
    var subElementsOfArrayFromUserReadLineAsDouble = [Double]()
    
    for elementString in subElementsOfArrayFromUserReadlineAsString {
        guard let elementDouble = Double(elementString) else {
            return print("User input: \(subElementsOfArrayFromUserReadlineAsString), does not contain a set of values of datatype double. If it does, use \",\" to seperate between each element")
        }
        subElementsOfArrayFromUserReadLineAsDouble.append(elementDouble)
    }
    
    //print(subElementsOfArrayFromUserReadLineAsDouble)
    
    //switch statment based on userInput to do filter, map, or reduce
    
    switch trimmedUserReadlineArrComponents[0].lowercased(){
    case "filter":
        if operationChar == "<" {
            print(customFilter(arr: subElementsOfArrayFromUserReadLineAsDouble, closure: {$0 < Double(trimmedUserReadlineArrComponents[4])!}))
        } else if operationChar == ">" {
            print(customFilter(arr: subElementsOfArrayFromUserReadLineAsDouble, closure: {$0 > Double(trimmedUserReadlineArrComponents[4])!}))
        }
    case "map":
        if operationChar == "*" {
            print(customMap(arr: subElementsOfArrayFromUserReadLineAsDouble, closure: {$0 * Double(trimmedUserReadlineArrComponents[4])!}))
        } else if operationChar == "/" {
            print(customMap(arr: subElementsOfArrayFromUserReadLineAsDouble, closure: {$0 / Double(trimmedUserReadlineArrComponents[4])!}))
        }
    case "reduce":
        if operationChar == "+"{
            print(customReduce(arr: subElementsOfArrayFromUserReadLineAsDouble, operand: Double(trimmedUserReadlineArrComponents[4])!, reducePair: {$0 + $1}))
        } else if operationChar == "*" {
            print(customReduce(arr: subElementsOfArrayFromUserReadLineAsDouble, operand: Double(trimmedUserReadlineArrComponents[4])!, reducePair: {$0 * $1}))
        }
    default:
        print("User did not enter a valid high order operation. If this code block is executed. You somehow broke my code. Congrats")
    }
    
    //
//    operationChar = Character(trimmedUserReadlineArrComponents[0])
    
}

//Start of calculator to prompt user response

func calculator() {
    print("Enter type of calculation, 1 (regular) or 2 (high order)")
    var validCalcChoice = Int()
    if let calcChoice = Int(getUserInput()) {
        validCalcChoice = calcChoice
    } else {
        print("User did not enter a valid integer response")
    }

    //begining of branch between regular and high order function
    switch validCalcChoice{
    case 1:
        regularCalc()
        gameRestart()
    case 2:
        highOrderCalc()
        gameRestart()
    default:
        print("User did not enter a valid integer response to choose between type of calculation, 1 (regular) or 2 (high order)")
    }
}
calculator()
