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
while true {
var filterEmptyArray: [Int] = []
var mapEmptyArray: [Int] = []
var reduceEmptyArray = Int()
    
func filter (userIn: String , numArray: [Int], filterBy: (Int)) -> [Int] {
    switch userIn {
    case ">":
        
        for numbers in numArray{
            if numbers > filterBy{
                filterEmptyArray.append(numbers)
            }
        }
        
    case "<":
        
        for numbers in numArray{
            if numbers < filterBy{
                filterEmptyArray.append(numbers)
            }
            
        }
        
    default:
        print("WRONG INPUT, PLEASE CHOOSE > or < ")
        }
    return filterEmptyArray
    }
    
func map (userIn: String , numArray: [Int], mappedBy: (Int)) -> [Int] {
    switch userIn {
    case "*":
        for numbers in numArray {
            mapEmptyArray.append(numbers * mappedBy)
        }
    case "+":
        for numbers in numArray {
            mapEmptyArray.append(numbers + mappedBy)
        }
    default:
        print("WRONG INPUT, PLEASE CHOOSE + or *")
    }
    return mapEmptyArray
}
    func reduce (userIn: String , numArray: [Int], reducedBy: (Int)) -> (Int) {
        var reduceEmptyArray = reducedBy
        switch userIn {
        case "+":
            
            for numbers in numArray {
                reduceEmptyArray += numbers
            }
        case "*":
            for numbers in numArray {
                reduceEmptyArray *= numbers
            }
        default:
            print("WRONG INPUT, PLEASE CHOOSE + or *")
        }
        return reduceEmptyArray
    }

    print("Enter type of calculation REGULAR [1] OR HIGH ORDER [2] ")
    if var userChoice = readLine() {
    switch userChoice{
    case "1":
        let addition = mathStuffFactory(opString: "+")
        let subtraction = mathStuffFactory(opString: "-")
        let multiplication = mathStuffFactory(opString: "*")
        let division = mathStuffFactory(opString: "/")
        let symbols = ["+", "-", "*", "/"]
        let oparations = [addition,subtraction,multiplication,division]
        print("Please enter calculation")
        if let userChoice = readLine() {
        let userChoiceArray = userChoice.components(separatedBy: " ")
        let numbers = userChoiceArray.compactMap({Double($0)})
        switch userChoiceArray[1] {
        case "+":
            print("\(userChoice) = \(addition(numbers[0],numbers[1]))")
        case "-":
            print("\(userChoice) = \(subtraction(numbers[0],numbers[1]))")
        case "*":
            print("\(userChoice) = \(multiplication(numbers[0],numbers[1]))")
        case "/":
            print("\(userChoice) = \(division(numbers[0],numbers[1]))")
        case "?":
            let random = Int.random(in: 0...oparations.count - 1)
            print("\(userChoice) = \(oparations[random](numbers[0],numbers[1]))")
            print("Guess the oparator used: + - * /")
            if let userChoice = readLine(){
            if userChoice == symbols[random]{
                print("CORRECT!")
            } else {
                print("WRONG!")
            }
            }
        
        default:
            print("wrong")
            
            }
    }
    case "2":
        print("""
PLEASE ENTER TYPE OF CALCULATION (ENTER AS SHOWN) e.g filter 1,2,3,4,5,6 by < 5
                                                      map 1,2,4,5,6,7 by + 5
                                                      reduce 1,2,3,4,5,6,7 by * 5

""")
        userChoice = readLine()!
        let highOrderArray = userChoice.components(separatedBy: " ") //["filter", "1,2,3,4,5,6", "by", "<", "5"]
        print(highOrderArray)
        let highOrderNumArray = highOrderArray[1].components(separatedBy: ",")
        let numbersHighOrder = highOrderNumArray.compactMap({Int($0)})
        let lastNumOfHighOrder = highOrderArray.compactMap({Int($0)})
        var lastNum = Int()
        for numbers in lastNumOfHighOrder{
            lastNum = numbers
        }
        let highOrderOperator = highOrderArray[highOrderArray.count - 2]
        if userChoice.contains("filter") {
           let filterSolution = filter(userIn: highOrderOperator, numArray: numbersHighOrder, filterBy: lastNum)
            print("\(userChoice) = \(filterSolution)")
            }
        if userChoice.contains("map") {
            let mapSolution = map(userIn: highOrderOperator, numArray: numbersHighOrder, mappedBy: lastNum)
            print(mapSolution)
        }
        if userChoice.contains("reduce"){
            let reduceSolution = reduce(userIn: highOrderOperator, numArray: numbersHighOrder, reducedBy: lastNum)
            print("\(userChoice) = \(reduceSolution)")
        }

    default:
        print("WRONG INPUT")
}
}
}



