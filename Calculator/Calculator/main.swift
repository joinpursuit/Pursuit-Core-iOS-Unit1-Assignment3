//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

var stop = false
let calculationList: Set<String> = ["+", "-", "*", "/"]

func space() {
    for _ in 0...70 {
        print()
    }
}

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

func myFilter(inputArray: [Int], filter: Int, filterType: String) -> [Int] {
    var filteredArray: [Int] = []
    
    for num in inputArray {
        if num < filter && "<" == filterType {
            filteredArray.append(num)
        } else if num > filter && ">" == filterType {
            filteredArray.append(num)
        }
    }
    return filteredArray
}

func myMaps(inputArray numList: [Int], inputInt: Int, mapType: String) -> [Int] {
    var result = [Int]()
    
    if mapType == "*" {
        for num in numList {
            result.append(num * inputInt)
        }
    } else if mapType == "/" {
        for num in numList {
            result.append(num / inputInt)
        }
    }
    
    
    return result
}

func myReduce(inputArray: [Int], startingNumber: Int, reduceType: String) -> Int {
    var result = Int()
    let inputType = ["-", "+", "*"]
    result = startingNumber
    print(result)
    
    if reduceType == inputType[0] {
        for num in inputArray {
            result -= num
        }
    } else if reduceType == inputType[1] {
        for num in inputArray {
            result += num
        }
    } else if reduceType == inputType[2] {
        for num in inputArray {
            result *= num
        }
    }
    
    return result
}

func inputStrSepration(input: String) -> [String] {
    var userInputArr = [String]()
    var word = ""
    
    for (index, str) in input.lowercased().enumerated() {
        if index == 0 && (str == " " || str == ",") {
            continue
        } else if str == " " || str == "," {
            userInputArr.append(word)
            word = ""
        } else {
            word += String(str)
        }
        
        if index == input.count - 1 {
            userInputArr.append(word)
        }
    }
    return userInputArr
}

while stop == false {
    space()
    print("enter the 2 number and the calculation type you want to do")
    let userInput = readLine() ?? "0"
    var calculator = ""
    var calculatorNum: [Double] = []
    var numberList: [Int] = []
    var actionType = ""
    var splitInputArr = inputStrSepration(input: userInput)
    var wordCheck = Set(splitInputArr)
    var inputNumber = Int(splitInputArr[splitInputArr.count - 1]) ?? 0
    
    for (index, value) in splitInputArr.enumerated() where index != splitInputArr.count - 1 {
        if wordCheck.contains("filter") && wordCheck.contains("<") {
            actionType = "<"
        } else if wordCheck.contains("filter") && wordCheck.contains(">") {
            actionType = ">"
        } else if wordCheck.contains("reduce") && wordCheck.contains("+") {
            actionType = "+"
        } else if wordCheck.contains("reduce") && wordCheck.contains("-") {
            actionType = "-"
        } else if wordCheck.contains("reduce") && wordCheck.contains("*") {
            actionType = "*"
        } else if wordCheck.contains("map") && wordCheck.contains("*") {
            actionType = "*"
        } else if wordCheck.contains("map") && wordCheck.contains("/") {
            actionType = "/"
        }
        
        if Int(value) != nil {
            numberList.append(Int(value)!)
        }
    }
    
    
    func calculation() {
        for element in splitInputArr {
            if Double(element) != nil {
                calculatorNum.append(Double(element) ?? 0)
            } else if calculationList.contains(String(element)) {
                calculator.append(String(element))
            } else if element == "?" {
                calculator = calculationList.randomElement() ?? "+"
            }
        }
    }
    
    if wordCheck.contains("filter") {
        if actionType.count > 0 {
            let result = myFilter(inputArray: numberList, filter: inputNumber, filterType: actionType)
            print("here is the filtered list: \(result)")
        } else {
            print("I got into the filter but wasn't sure what to do with it")
        }
    } else if wordCheck.contains("reduce") {
        if numberList.count != 0 && actionType.count > 0 {
            let result = myReduce(inputArray: numberList, startingNumber: inputNumber, reduceType: actionType)
            print("here is the reduced result is: \(result)")
        } else {
            print("I got into the reduce but wasn't sure what to do with it")
        }
    } else if wordCheck.contains("map") {
        if numberList.count != 0 && actionType.count > 0 {
            print(numberList)
            let result = myMaps(inputArray: numberList, inputInt: inputNumber, mapType: actionType)
            print("here is the mapped list: \(result)")
        } else {
            print("I got into the map but wasn't sure what to do with it")
        }
    } else {
        calculation()
        if calculatorNum.count == 2 {
            let calculationType = mathStuffFactory(opString: calculator)
            let result = calculationType(calculatorNum[0], calculatorNum[1])
            space()
            print("the result of your calculation is \(result)")
        } else {
            space()
            print("Not sure what you want to do...")
        }
    }
    
    print("if you want to do another calculation please enter 'yes'")
    let more = readLine()?.lowercased() ?? "no"

    if more != "yes" {
        stop = true
    }
    
    splitInputArr.removeAll()
    
}










