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

// let closureOperation = mathStuffFactory(opString: "+") // closureOperation is a closure that takes in 2 doubles and returns a double.
// let result = closureOperation(45, 5) // this is the closure that the function returns.

// print("result of operation is \(result)")



print("Enter type of calculation?")
let calcType = readLine() ?? "no entry"

switch calcType.lowercased() {
    
    //====================================
    // IF THE USER ENTERS REGULAR:
    //====================================
    
case "regular":
    print("Regular is it")
    print("Enter your operation")
    let operation = readLine() ?? "no entry"
    let operationComponents = operation.components(separatedBy: " ")
    // print(operationComponents)
    
    // cast and then unwrap using optional binding
    
    let operandOne = Double(operationComponents[0])
    let opt = operationComponents[1]
    let operandTwo = Double(operationComponents[2])
    
    
    // checks if the operation is valid otherwise reject unknown operators.
    
    let allowedOpt = ["+", "-", "?", "/", "*"]
    
    if allowedOpt.contains(opt) {
        
        if let operand1 = operandOne, let operand2 = operandTwo { // if operand are valid values
            
            // check if the opt is ? if it is play the random game else do the following... using the function:
            
            if opt == "?" {
                print("Play Random guessing game")
                
                let optArray = ["+", "-", "/", "*"]
                
                let randomOpt = optArray.randomElement() ?? "+"
                print(randomOpt) // just to check w
                let closureOperation = mathStuffFactory(opString: randomOpt)
                let result = closureOperation(Double(operand1), Double(operand2))
                print("\(operation) = \(result)")
                var guess = ""
                
                repeat {
                    print("Guess the operation")
                    guess = readLine() ?? "+"
                    
                    if guess == randomOpt {
                        print("correct")
                    } else {
                        print("wrong")
                    }
                    
                } while guess != randomOpt
                
                // random selction of an operation ✅
                // call mathstuff function with that operation ✅
                // call the closure with the 2 operands ✅
                // print result
                // prompt a guess ✅
                // check if guess is == to randomly selected opt - print correct ✅
                // else print wrong and repeat guess (should there be a limit amount of guesses? - probably) ✅
                
                
            } else {
                
                let closureOperation = mathStuffFactory(opString: opt)
                let result = closureOperation(Double(operand1), Double(operand2))
                print("\(operation) = \(result)")
            }
            
        } else {
            print("Please enter your calculation in the correct format e.g. 5 + 3")
        }
        
    } else {
        print("Unknown operator: \(opt)") // here is where it will reject unknown operators.
    }
    //====================================
    // IF THE USER ENTERS HIGHER ORDER
    //====================================
    
case "high order":
    print("High order it is ")
    print("Enter your operation e.g filter 1,5,2,7,3,4 by < 4")
    let operation = readLine() ?? "no entry"
       let operationComponents = operation.components(separatedBy: " ")
       // print(operationComponents)
       
       // cast and then unwrap using optional binding
       
       let operandOne = Double(operationComponents[0])
       let opt = operationComponents[1]
       let operandTwo = Double(operationComponents[2])
    
default:
    print("You have to choose a type. ")

}




//====================================================================================
// NEW STUFF: 


// part 2:
// func myFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] {
// filter is a closure that rerturns a bool
// myFitler returns an array of Int.

// use .hasprefix to check if user enter "map"
// keep the user entry to this format: map 1,5,2,7,3,4 by * 3

// note: operands are the numbers snd the operator is the (+, - ,/, *)

// creating filter function:

func myFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] { // filter is a closure that takes an Int and returns a bool
    var filteredArray: [Int] = []

    for num in inputArray{
        if filter(num) {
            filteredArray.append(num)
        }
    }

return filteredArray
}

// testing filter function:
var numbers = [1,5,2,7,3,4]

print(myFilter(inputArray: numbers, filter: { $0 < 4 }))

// creating map function:

// re-creating the built in map function
// map function will take in 2 parameters,
// first parameter is an array of ints
// second parameter is a closure

func customMap(arr: [Int], closure: (Int) -> (Int)) -> [Int]  { // the closure takes an Int and returns an Int after its completed the "transformation"
var transformedArray = [Int]()
    for num in arr {
        // perform transformation based on closure and append result in transformedArr
        
        transformedArray.append(closure(num)) // closure expacts an argument of type Int
    }
    
  return transformedArray
}


// using customMap function above take in an array of numbers and return the squared values of each of those elements

// input: [1, 2, 3, 4, 5, 6, 7]
// output: [1, 4, 9, 16, 25, 36, 49]

numbers = [1, 2, 3, 4, 5, 6, 7]

print(customMap(arr: numbers , closure: {$0 * $0})) // $0 is shorthand syntax

// longer form { number in number * number}

