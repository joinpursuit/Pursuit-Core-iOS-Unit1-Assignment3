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
let comparingOperators = [">", "<"]     //additional feature == / !=

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
                print("Invalid Operator, please enter only one of these operators: \"+\", \"-\", \"*\", \"/\", & \"?\".")
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
            print("Please enter your operation (map, filter, or reduce).")
            print("e.g.,    Input: map 1,2,3,4,5 by * 2    Output: 2,4,6,8,10")
            //user Input
            //break input into parts
                //["filter", "1,2,3,4,5", "by", "<", "4"]
            
            //store type of higherorder
            //store numbers into an array
            //store operator
            //store given value
            
            //check if given value is a num
            //check if arr are nums, if so convert them to Doubles using compactMap
            
            //variable for output
            //depending on the type of higher order function, we do different things (check higher order words)
                //filter
                    //check operators (comparing)
                    //invoke filter function, use precreate closure, and store the new array in output
                    //print output
                //map
                    //check operators (regular)
                    //build a func that returns func.  func (givenValue: num) {depends on operator (switch) return num in num *+-/ givenValue}
                    //invoke the new mathFactory and store in calculationFunc
                    //invoke map use precreated closure and store the new array in the ouput
                    //print output
                //reduce
                    //check operators (regular)
                    //given value is the initial
                    //based on the operator invoke the mathfactory function and store in calculationFunc variable
                    //invoke reduce and store output as 1 single Double
                    //print answer
            break inCalculation
            
        case "3":
            print("Turning off...")
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
