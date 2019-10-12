//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

var stop = false
var calculationList = ["+", "-", "*", "/"]

func space() {
    for _ in 0...50 {
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
    print(filterType)
    for num in inputArray {
        if num < filter && "<" == filterType {
            filteredArray.append(num)
        } else if num > filter && ">" == filterType {
            filteredArray.append(num)
        }
    }
    return filteredArray
}

while stop == false {
    space()
    print("enter the 2 number and the calculation type you want to do")
    let userInput = readLine() ?? "0"
    var calculator = ""
    var calculatorNum: [Double] = []
    var filterNum: [Int] = []
    var filterBy = Int()
    var filter = ""
    let splitInput1 = userInput.split(separator: " ", maxSplits: 1000000000)
    
    if splitInput1.contains("filter") {
        filterBy = Int(splitInput1[splitInput1.count - 1]) ?? 0
        for element in splitInput1 {
            if element != splitInput1[splitInput1.count - 1] {
                let processingOfFilter = element.split(separator: ",")
                for value in processingOfFilter {
                    if Int(value) != nil {
                        filterNum.append(Int(value)!)
                    } else if (value == "<" || value == ">") {
                        filter = String(value)
                    }
                }
            }
        }
    }
    for element in splitInput1 {
        if Double(element) != nil {
            calculatorNum.append(Double(element) ?? 0)
        } else if calculationList.contains(String(element)) {
            calculator.append(String(element))
        } else if element == "?" {
            calculator = calculationList.randomElement() ?? "+"
        }
    }
    
    if filter.count > 0 {
        let result = myFilter(inputArray: filterNum, filter: filterBy, filterType: filter)
        print("here is the filted list: \(result)")
    } else if calculatorNum.count == 2 {
        let calculationType = mathStuffFactory(opString: calculator)
        let result = calculationType(calculatorNum[0], calculatorNum[1])
        space()
        print("the result of your calculation is \(result)")
    } else {
        space()
        print("Not sure what you want to do...")
    }
    
    print("if you want to do another calculation please enter 'yes'")
    let more = readLine()?.lowercased() ?? "no"
    
    if more != "yes" {
        stop = true
    }
}







