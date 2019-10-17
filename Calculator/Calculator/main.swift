//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
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

//CustomMap function
func customMap(arr:[Int], closure: (Int) -> (Int)) -> [Int] {
    var transformedArr = [Int]()
    for num in arr {
        // perform transformation based on closure and append result in transformedArr
        transformedArr.append(closure(num))
    }
    
    
    return transformedArr
}

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
        //guard attempt of checking if userEntered an operator
//        guard trimmedUserReadLine.contains(operators) else {
//            //regularCalc()
//            return print("Operator not found to evaluate the given input: \(userReadline). Consider using the operators: +, -, *, /, or ?")
//        }
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
    //operandsDoubleArr = Double(operandsStringArr)//operandsString.compactMap{Double($0)}
    
    //this code never gets run
//    guard operandsDoubleArr.count >= 2 else {
//        return print("User did not enter at least 2 valid data types to evaluate the given expression")
//    }
    
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

    //return userReadline
}

//highOrderCalc used to create high order calculations
func highOrderCalc() {
    
}

// loop should start here
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
