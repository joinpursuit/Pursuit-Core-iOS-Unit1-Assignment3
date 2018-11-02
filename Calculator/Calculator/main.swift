//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation


print("This is “JT Calculator”, the most Advanced and Fun Calculator in the World.")
sleep(1)

var power = "on"
let invalidInput = true
let operators = ["+", "-", "*", "/"]

while power == "on" {
    
    var userChoice = ""
    sleep(1)
  
    print("What do you want to do?")
    print("(1) Basic Calculaor    (2) Higher-Order Calculator   (3) Turn off Calculator")
  
    if let choice = readLine() {
        if choice == "1" || choice == "2" || choice == "3" {
            userChoice = choice
        } else {
            print("You must enter \"1,\" \"2,\" or \"3\" for the input. Please try again.")
            continue
        }
    } else {
        print("Invalid Input. Please try again.")
        continue
    }
  
    inCalculation: while invalidInput {
        switch userChoice {
        case "1":   //basic calculator
            sleep(1)
            print("Please enter your operation, e.g., 1 + 2")
        
            let userInput = readLine() ?? "invalid"
            guard userInput != "invalid" else {
                print("Did you enter anything? Please try again.")
                continue
            }
         
            let userInputBreakdown = userInput.components(separatedBy: " ")
      
            guard userInputBreakdown.count == 3 else {
                if userInputBreakdown.count < 3 {
                    print("Please make sure that you have a space between the numbers and the operator.")
                    sleep(1)
                    print("Correct Input:   \"3 * 5\" \nIncorrect Input:   \"3*5\"")
                } else {
                    print("Please make sure that you have 2 numbers and 1 operator")
                    sleep(1)
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
                
                let gameOperation = mathStuffFactory(opString: randomOperator)
                let result = calculationFromString(strNum1: userOperants.num1, strNum2: userOperants.num2, instruction: gameOperation)
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
                        sleep(1)
                        print("\(userOperants.num1) \(randomOperator) \(userOperants.num2) = \(result)")
                    } else {
                        print("Sorry, it's Incorrect 😢.")
                        sleep(1)
                        print("The answer is:  \(userOperants.num1) \(randomOperator) \(userOperants.num2) = \(result)")
                    }
                    break
                }
                break inCalculation
            }
            
            sleep(1)
            let gameOperation = mathStuffFactory(opString: userOperator)
            let result = calculationFromString(strNum1: userOperants.num1, strNum2: userOperants.num2, instruction: gameOperation)
            print("\(userOperants.num1) \(userOperator) \(userOperants.num2) = \(result)")
            break inCalculation
            
        case "2":   //higher-order calculator
            
            
            break inCalculation
            
        case "3":
            print("Turning off...")
            sleep(1)
            print("Bye!")
            power = "off"
            break inCalculation
        default:
            break inCalculation
        }
    }
  
    //restart
    while invalidInput {
        guard userChoice != "3" else {break}
        print("Do you want to calculate again?  (yes)  (no)")
        if let input = readLine()?.lowercased() {
            if input == "no" {
                print("Turning off...")
                sleep(1)
                print("Bye!")
                power = "off"
            } else {
                print("Is that a \"yes\" or \"no\"?")
            }
        break inva
        }
    }
    
}

//"filter 1,2,3,4,5 by < 4"     //1, 2, 3
//["filter", "1,2,3,4,5", "by", "<", "4"]
