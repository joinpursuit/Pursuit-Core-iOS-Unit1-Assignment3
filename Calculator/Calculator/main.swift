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

func myMaps(inputArray numList: [Int], inputInt mulBy: Int) -> [Int] {
    var result = [Int]()
    
    for num in numList {
        result.append(num * mulBy)
    }
    
    return result
}

func myReduce(inputArray: [Int], startingNumber: Int, reduceType: String) -> Int {
    var result = Int()
    let inputType = ["-", "+"]
    result = startingNumber
    
    if reduceType == inputType[0] {
        for num in inputArray {
            result -= num
        }
    } else if reduceType == inputType[1] {
        for num in inputArray {
            result += num
        }
    }
    
    return result
}

while stop == false {
    space()
    print("enter the 2 number and the calculation type you want to do")
    let userInput = readLine() ?? "0"
    var calculator = ""
    var calculatorNum: [Double] = []
    var numberList: [Int] = []
    var inputNumber = Int()
    var filterType = ""
    var reduceType = ""
    let splitInput1 = userInput.split(separator: " ")
    let wordCheck = splitInput1[0]
    
    func stringSepration() {
        var processingOfFilter: [Substring.SubSequence] = []
        inputNumber = Int(splitInput1[splitInput1.count - 1]) ?? 0
        for element in splitInput1 where element != splitInput1[splitInput1.count - 1] {
            processingOfFilter = element.split(separator: ",")
            for value in processingOfFilter {
                if Int(value) != nil {
                    numberList.append(Int(value)!)
                } else if (value == "<" || value == ">") {
                    filterType = String(value)
                } else if (value == "+" || value == "-") {
                    reduceType = String(value)
                }
            }
        }
    }
    
    func calculation() {
        for element in splitInput1 {
            if Double(element) != nil {
                calculatorNum.append(Double(element) ?? 0)
            } else if calculationList.contains(String(element)) {
                calculator.append(String(element))
            } else if element == "?" {
                calculator = calculationList.randomElement() ?? "+"
            }
        }
    }
    
    switch wordCheck {
    case "filter":
        stringSepration()
        
        if filterType.count > 0 {
            let result = myFilter(inputArray: numberList, filter: inputNumber, filterType: filterType)
            print("here is the filted list: \(result)")
        } else {
            print("I got into the filter but wasn't sure what to do with it")
        }
    case "reduce":
        stringSepration()
        if numberList.count != 0 && reduceType.count > 0 {
            let result = myReduce(inputArray: numberList, startingNumber: inputNumber, reduceType: reduceType)
            print("here is the reduced list: \(result)")
        } else {
            print("I got into the reduce but wasn't sure what to do with it")
        }
    case "map":
        stringSepration()
        if numberList.count != 0 && inputNumber != 0 {
            print(numberList)
            let result = myMaps(inputArray: numberList, inputInt: inputNumber)
            print("here is the mapped list: \(result)")
        } else {
            print("I got into the map but wasn't sure what to do with it")
        }
    default:
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
}







