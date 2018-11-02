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
func myFilter(arr:[Int], closure: (Int) -> Bool) -> [Int] {
    var newArr = [Int] ()
    for num in arr {
        if closure (num) {
            newArr.append(num)
        }
    }
    return newArr
}

func customMap(arr:[Int], closure: (Int) -> Int) -> [Int] {
    var newArr = [Int]()
    for num in arr {
        let newNum = closure(num)
        newArr.append(newNum)
    }
    return newArr
}

func myReduce(arr: [Int], closure: (Int,Int) -> Int, given: Int ) -> Int {
    var currenttotal = given
    for num in arr {
        currenttotal = closure(currenttotal, num)
    }
    return currenttotal
}

var operatorsArr = ["+", "-", "/", "*", "?"]     //? means its just a space ? is what the operator would be, but the user won't see it
var higherFuncs = ["map", "fiter", "reduce"]     // this is a global array
var newArrforHigherfuncs = ["+", "*", "/", "<", ">"]  // this is a new array for the higher order func part, if we just added all this in operatorsArr it would break our code

var usingCalculator = true
while usingCalculator {
    print("Welcome, Namaste. Enter type of calculation 1(regular) 2(high order)?")
    let userInput = readLine()
    guard let userInputunwrapped = userInput else  {
        continue
    }
    switch userInputunwrapped {
    case "1":
        print("give me your operation")
        guard let userInputunwrapped = readLine () else {
            continue
        }
        let userArray = userInputunwrapped.components(separatedBy: " ")     // .components separates with whatever separatedBy: "whatever is in here"
        guard userArray.count == 3 else {
            print("That does not compute!")
            continue
        }
        guard let firstnumber = Double (userArray[0]) else {
            print("Please enter a number")
            continue
        }
        guard let secondnumber = Double (userArray[2]) else {
            print("Please enter a number")
            continue
        }
        guard operatorsArr.contains (userArray [1]) else {
            print("Please use a valid operator")
            continue
        }
        switch userArray[1] {
        case "+":
            let answer = mathStuffFactory(opString: "+")(firstnumber, secondnumber) // mind blown! answer is type closure :D
            print(answer)
        case "-":
            let answer = mathStuffFactory(opString: "-")(firstnumber, secondnumber)
            print(answer)
        case "/":
            let answer = mathStuffFactory(opString: "/")(firstnumber, secondnumber)
            print(answer)
        case "*":
            let answer = mathStuffFactory(opString: "*") (firstnumber, secondnumber)
            print(answer)
        case "?":
            let randomnumber = Int.random(in: 0...3)    // stuck here // this is our way of getting a random operator
            var randomoperator = ""
            switch randomnumber {
            case 0:
                randomoperator = "+"   // we're assigning the operator based on the number
            case 1:
                randomoperator = "-"
            case 2:
                randomoperator = "/"
            case 3:
                randomoperator = "*"
            default:
                print("has to be one of the four operators")
            }
            let answer = mathStuffFactory(opString: randomoperator)(firstnumber, secondnumber)
            print(answer)
            print("Guess the operator?")
            
            guard let userInput = readLine () else {
                continue
            }
            if userInput == randomoperator {
                print("yay!")
            } else {
                print("nay!")
            }
            
        default:
            print("")
            
        }
    case "2":
        print("choose a high order function e.g filter 1,5,2,7,3,4 by < 4")
        let userInput = readLine ()
        guard let userInputunwrapped = readLine() else {
            continue
        }
        let highFuncArray = userInputunwrapped.components(separatedBy: " ")  // doing the same thing as before, separating by space
        guard highFuncArray.count == 5 else {
            print("Please enter as shown in example.")
            continue
        }
        guard highFuncArray.contains(highFuncArray[0]) else {
            print("That's not right, try again.")
            continue
        }
        let numArrayOfstrings = userInputunwrapped.components(separatedBy: ",")
        var arrayOfints = [Int]()
        for number in numArrayOfstrings {
            if let num = Int(number) {
                arrayOfints.append(num)
            }
        }
        guard highFuncArray[2] == "by" else {
            print("Please enter the word (by)")
            continue
        }
        guard newArrforHigherfuncs.contains(highFuncArray[3]) else {
            print("Please enter a valid operation")
            continue
        }
        guard let userNum = Int(highFuncArray[4]) else {      // we made this variable for our given num which is 4
            print("Enter a valid number.")
            continue
        }
        var userOperator = highFuncArray[3]
        var higherOrderword = highFuncArray[0]
        switch higherOrderword {
        case "filter":                               // myFilter(arr:[Int], closure: (Int) -> Bool) -> [Int]
            if userOperator == "<" {
                print(myFilter(arr: arrayOfints, closure: { (num) -> Bool in
                    return num < userNum
                }))
            } else if userOperator == ">"  {
                print(myFilter(arr: arrayOfints, closure: { (num) -> Bool in
                    return num > userNum
                }))
            } else {
                print("for filter please use, > or <")
            }
        case "map":
            if userOperator == "*" {
                print(customMap(arr: arrayOfints, closure: { (num) -> Int in
                    return num * userNum
                }))
            } else if userOperator == "/" {
                print (customMap(arr: arrayOfints, closure: { (num) -> Int in
                    return num / userNum
                }))
            }
        case "reduce":
            if userOperator == "+" {
                print(myReduce(arr: arrayOfints, closure: { (num1, num2) -> Int in
                    return num1 + num2
                }, given: userNum) )                                               // here is where we use the variable for our given num; 4
            }
            else if userOperator == "*" {
                print(myReduce(arr: arrayOfints, closure: { (num1, num2) -> Int in
                    return num1 * num2
                }, given: userNum))
            }
        default:
            print("Use a valid entry e.g, filter, map or reduce")
        }
    default:
        print("invalid")
    }
}
