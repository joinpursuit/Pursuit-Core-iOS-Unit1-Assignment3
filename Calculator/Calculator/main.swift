//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

var playAgain = ""

repeat  {
    playAgain = ""
// dictionary of shorhand closures to do operations
    var operations: ([String: (Double, Double) -> Double]) = ["+": { $0 + $1 },
    "-": { $0 - $1 },
    "*": { $0 * $1 },
    "/": { $0 / $1 },
    "?": {
        
            let randomOperand = Int.random(in: 0...3)
            if randomOperand == 0   {
                return $0 + $1
            }
            else if randomOperand == 1  {
                return $0 - $1
            }
            else if randomOperand == 2  {
                return $0 * $1
            }
            else    {
                return $0 / $1
            }
        }
    ]

    print("Enter type of calculation, 1 (regular) or 2 (high order)?")

    let operationChoice = readLine()

    switch operationChoice  {
        
    case "1":

        // prompt user for entry
        print("Enter your operation, e.g 5 + 3")

        // store entered string
        let userEntry : String = readLine() ?? ""


        // split user entry into array
        var entryParts = userEntry.components(separatedBy: " ")

        //print(entryParts)

        // variable for each element
        let firstTermArray = Double(entryParts[0])
        let secondTermArray = Double(entryParts[2])
        let operandArray = entryParts[1]

        //  store array variables in tupple to access separate parts
        let operationString : (termOne : Double?, termTwo : Double?, operand : String)
        operationString = (firstTermArray, secondTermArray, operandArray)
        let firstTermTuple = operationString.0
        let secondTermTuple = operationString.1
        let operandTuple = operationString.2


        // function, takes  paramaters of sparsed string to determine key for dictionary of closures
        // and perform according operation closure

        func basicCalculation(operandEntry : String?, termOne : Double?, termTwo : Double?, operationsClosure: ([String: (Double, Double) -> Double])) -> Double {
            
            var result = 0.0
            var rightOperand = ""
            var operandGuess = ""
            if let operate = operations[operandEntry ?? ""]    {
                result = operate(termOne ?? 0, termTwo ?? 0)
            }
            
            print("Result: \(result)")
            
            if operandEntry == "?"  {
                print("Guess the operator used for your result, keep trying if wrong.")
                repeat  {
                    operandGuess = readLine() ?? ""
                if result == (termOne ?? 0) + (termTwo ?? 0)    {
                    rightOperand = "+"
                    }
                else if result == (termOne ?? 0) - (termTwo ?? 0)    {
                    rightOperand = "-"
                }
                else if result == (termOne ?? 0) * (termTwo ?? 0)    {
                    rightOperand = "*"
                }
                else if result == (termOne ?? 0) / (termTwo ?? 0)    {
                    rightOperand = "/"
                }
                if operandGuess == rightOperand {
                    print("Correctomundo!")
                }
                else    {
                    print("Try again.")
                }
                } while operandGuess != rightOperand
            //add random game in here or outside as closure function and use  in here
            }
            return result
        }

        // call function use tuple parts for necessary arguments for function into dictionary closure
        let calculation = basicCalculation(operandEntry: operandTuple, termOne : firstTermTuple, termTwo: secondTermTuple, operationsClosure: operations)
    //------------------------------------HighOrder--------------------------------------
    case "2":
        var numArray : [Int] = []

        //  Take High order string and cut out and convert the int array called numArray
        //  ***Collect all the parts to do High order Functions***
        print("Enter High order calculation(e.g. filter 1,2,3,4,5,6 by < 6): ")
        let highOrderEntry = readLine() ?? " "
        let orderEntryParts = highOrderEntry.components(separatedBy: " ")

        let numString = orderEntryParts[1]
        let numStringArray = numString.components(separatedBy: ",")

        // grab in filter number at end, and > or <
        let filterNum = Int(orderEntryParts[4])
        let pacMan = orderEntryParts[3]

        for strNum in numStringArray {
            let strToInt = Int(strNum)
            numArray.append(strToInt ?? 0)
        }

        let greaterThan = pacMan == ">"
        let lessThan = pacMan == "<"

    switch orderEntryParts[0]   {
        
    case "filter":
        //  Use all the parts necessary for High Order in the different Calculations

        //===================================================================================
        //                                      Filter
        //===================================================================================
        func filterizeClosureMethod(inputArray: [Int], filter: (Int) -> Bool) -> [Int] {
            var intArr = [Int]()
            for input in inputArray {
                if filter(input)    {
                    intArr.append(input)
                }
            }
            return intArr
        }

        func myFilter(filterNumber: Int) -> Bool    {
            var operation : Bool = Bool()
            if greaterThan  {
                operation = filterNumber > filterNum ?? 0
            }
            else if lessThan    {
                operation = filterNumber < filterNum ?? 0
            }
            return operation
        }

         let filteredList = filterizeClosureMethod(inputArray: numArray, filter: myFilter)

         print(filteredList)

    case "map":
        //===================================================================================
        //                                      Map
        //===================================================================================

        func mapClosureMethod(inputArray: [Int], map: (Int) -> Int) -> [Int]    {
            var intArr = [Int]()
            for input in inputArray {
                let numToAdd = map(input)
                intArr.append(numToAdd)
            }
            return intArr
        }

        func myMap(mapNumber : Int) -> Int   {
            var math = 0
            if pacMan == "*"    {
                math = mapNumber * (filterNum ?? 0)
            }
            else if pacMan == "/"   {
                math = mapNumber / (filterNum ?? 0)
            }
            return math
        }

        let mapList = mapClosureMethod(inputArray: numArray, map: myMap)
        print(mapList)

    case "reduce":
        //===================================================================================
        //                                      Reduce
        //===================================================================================

        func reduceClosureMethod(inputArray: [Int], reduce: (Int) -> (Int)) -> Int  {
            //add or multiply array by value
            var reduced = 0
            var result = 0
            for input in inputArray {
                reduced += reduce(input)
            }
            if pacMan == "+"    {
                result = reduced + (filterNum ?? 0)
            }
            else    {
                result = reduced * (filterNum ?? 0)
            }
            return result
        }

        func myReduce(reduceNumber : Int) -> Int {
            var math = 0
            math = reduceNumber
            
            return math
        }

        let reduceResult = reduceClosureMethod(inputArray: numArray, reduce: myReduce)
        print(reduceResult)
            
        default:
            print("Wait what?")
            }
    default:
        print("How'd you get here?")
    }

    print("Nother One? (y for yes, n for no)")
    playAgain = readLine() ?? ""
} while playAgain == "y"
