//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation


print("This is “JT Calculator”, the most Advanced and Fun Calculator in the World.\n")

var power = "on"
let invalidInput = true
let operators = ["+", "-", "*", "/"]

while power == "on" {
    sleep(1)
  
    print("What do you want to do?")
    print("(1) Basic Calculaor    (2) Higher-Order Calculator   (3) Turn off Calculator\n")
    
    let userChoiceOptional = readLine()
    guard let userChoice = userChoiceOptional else {
        print("Invalid Input. Please try again.")
        continue
    }
    guard userChoice == "1" || userChoice == "2" || userChoice == "3" else {
        print("You must enter \"1,\" \"2,\" or \"3\" for the input. Please try again.\n")
        continue
    }
  
    inCalculation: while invalidInput {
        switch userChoice {
        
        case "1":   /*****Basic Calculator*****/
            print("\nPlease enter your operation, e.g., 3 + 2\n")
        
            let userInput = readLine() ?? "invalid"
            guard userInput != "invalid" else {
                print("Did you enter anything? Please try again.")
                continue
            }
         
            let userInputBreakdown = userInput.components(separatedBy: " ")
      
            guard userInputBreakdown.count == 3 else {
                if userInputBreakdown.count < 3 {
                    print("Please make sure that you have a space between the numbers and the operator.")
                    print("Correct Input:   \"3 * 5\" \nIncorrect Input:   \"3*5\"")
                } else {
                    print("Please make sure that you have 2 numbers and 1 operator")
                    print("Correct Input:   \"3 * 5\" \nIncorrect Input:   \"3 * 5 + 2\"")
                }
                continue
            }
      
            let userOperator = userInputBreakdown[1]
            let userOperants = (num1: userInputBreakdown[0], num2: userInputBreakdown[2])
      
            //check if operants are numbers
            guard numsCheckFromString(num1: userOperants.num1, num2: userOperants.num2) else {
                print("Invalid Input...😕 Please make sure that your operants are numbers.")
                continue
            }
            
            //check if the operator is valid
            guard (operators + ["?"]).contains(userOperator) else {
                print("Invalid Operator 😕, please enter only one of these operators: \"+\", \"-\", \"*\", \"/\", & \"?\".")
                continue
            }
            
            //if operator is "?", MATH GAME!!. and break the loop
            if userOperator == "?" {
                print("It's...........")
                sleep(1)
                print("MATH GAME TIME!!!!!🕺🏻")
                sleep(1)
                
                let randomOperatorOptional = operators.randomElement()
                guard let randomOperator = randomOperatorOptional  else {continue}
                
                let gameCalculationFunc = mathStuffFactory(opString: randomOperator)
                let result = calculationFromString(strNum1: userOperants.num1, strNum2: userOperants.num2, instruction: gameCalculationFunc)
                
                print("\(userOperants.num1) ? \(userOperants.num2) = \(result)")
                
                while invalidInput {
                    sleep(1)
                    print("Guess the operator used 🧐?  (+)  (-)  (*)  (/)" )
                    let optionalGuess = readLine()
                    guard let guess = optionalGuess, operators.contains(guess) else {
                        print("Invalid Operator 😒")
                        continue
                    }
                    if guess == randomOperator {
                        print("CoorreECCTTT 🥂!")
                        print("\(userOperants.num1) \(randomOperator) \(userOperants.num2) = \(result)")
                    } else {
                        print("Sorry, it's Incorrect 😢.")
                        print("The answer is:  \(userOperants.num1) \(randomOperator) \(userOperants.num2) = \(result)")
                    }
                    sleep(1)
                    break
                }
                break inCalculation
            }
            
            let calculationFunc = mathStuffFactory(opString: userOperator)
            let result = calculationFromString(strNum1: userOperants.num1, strNum2: userOperants.num2, instruction: calculationFunc)
            print("\(userOperants.num1) \(userOperator) \(userOperants.num2) = \(result)")
            break inCalculation
            
            
        case "2":   /*****Higher-Order Calculator*****/
            sleep(1)
            print("\nPlease enter your operation (map, filter, or reduce).")
            print("e.g.,    Input: map 1,2,3,4,5 by * 2    Output: 2, 4, 6, 8, 10\n")
            //user Input
            let userInputOptional = readLine()?.lowercased()
            guard let userInput = userInputOptional else {
                print("Did you enter anything? Please try again.")
                continue
            }
            
            let userInputBreakdown = userInput.components(separatedBy: " ")
            sleep(1)
            print("my breakdown is \(userInputBreakdown)")
            
            guard userInputBreakdown.count == 5 else {
                print("Incorrect Spacing 😯.\nPlease enter in this format (please take note of the spaces): [higherOrderKeyWord Numbers by operator givenValue]")
                print("Correct Input: filter 1,5,2,7,3,4 by < 4 \nIncorrect Input: by1,5,2,7,3,4filter<4")
                continue
            }
            
            let higherOrderKeyword = userInputBreakdown[0]
            let arrNumsStr = userInputBreakdown[1].components(separatedBy: ",")
            let userOperator = userInputBreakdown[3]
            let givenValueStr = userInputBreakdown[4]
            
            //check if given value is a num
            guard let givenValue = Double(givenValueStr) else {
                print("Your given value is not a number.")
                continue
            }
            //check if the numbers in arrNumsStr are numbers
            guard checkStrNumsInArr(arr: arrNumsStr) else {
                print("Make sure that all the numbers in your list of numbers are numbers. Please try again 🙂.")
                print("Correct Input: 1,5,6,23,100")
                print("Incorrect Input: 1,5,r,23,100b")
                continue
            }
            
            //convert arrNumsStr to Doubles
            let arrNums: [Double] = arrNumsStr.compactMap({ strNum in Double(strNum)})
            
            //variable for output
            switch higherOrderKeyword {
            
            case "map":
                guard operators.contains(userOperator) else {
                    print("Invalid operator. Please enter one of the following:")
                    print("[\"+\", \"-\", \"*\", \"/\"]\n")
                    continue
                }
                //invoke the new mathFactory and store in calculationFunc
                let calculationFuncClosure = customMapMathFactory(operatorStr: userOperator, givenValue: givenValue)
                //invoke map use precreated closure and store the new array in the ouput
                let result = customMap(arr: arrNums, instruction: calculationFuncClosure)
                //print output
                let output = result.compactMap({numDouble in String(numDouble)})
                                    .joined(separator: ", ")
                print("Output: \(output)")
                
                
            case "filter":
                let comparingOperators = [">", "<"]     //additional feature == / != (if time permits)
                //check operators (comparing)
                guard comparingOperators.contains(userOperator) else {
                    print("Invalid operator. Please enter either \">\" or \"<\".")
                    continue
                }
                //invoke filter function, use precreate closure, and store the new array in output
                var result = [Double]()
                if userOperator == ">" {
                    result = customFilter(arr: arrNums, givenValue: givenValue, filter: greaterThanNum)
                } else if userOperator == "<" {
                    result = customFilter(arr: arrNums, givenValue: givenValue, filter: lessThanNum)
                }
                
                let output = result.compactMap({numDouble in String(numDouble)})
                                    .joined(separator: ", ")
                print("Output: \(output)")
                
                
            case "reduce":
                guard operators.contains(userOperator) else {
                    print("Invalid operator. Please enter one of the following:")
                    print("[\"+\", \"-\", \"*\", \"/\"]\n")
                    continue
                }
                let reduceClosure = mathStuffFactory(opString: userOperator)
                let result = customReduce(arr: arrNums, initial: givenValue, reduce: reduceClosure)
                let output = result
                print("Output: \(output)")


            default:
                print("Please only enter \"map\", \"filter\", or \"reduce\" for the higherOrderKeyword.")
                continue
            }
            
            break inCalculation
            
            
        case "3":
            print("\nTurning off...")
            sleep(1)
            print("Bye ✌🏾!")
            power = "off"
            break inCalculation
            
        default:
            break inCalculation
        }
    }
  
    //Calculate again or Turn-off calculator?
    while invalidInput {
        guard userChoice != "3" else {break}
        
        print("\nDo you want to calculate again?  (yes)  (no)")
        let responseOptional = readLine()?.lowercased()
        guard let response = responseOptional else {
            print("Is that a \"yes\" or \"no\"?")
            continue
        }
        
        if response == "no" {
            print("Turning off...")
            sleep(1)
            print("Bye ✌🏾!")
            power = "off"
            break
        } else if response == "yes" {
            print("")
            break
        } else {
             print("Is that a \"yes\" or \"no\"?")
            continue
        }
    }
    
}
