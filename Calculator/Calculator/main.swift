//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation
//basic arithmatic
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
//calculator loop
var condition = true
var correctMath: Set<Character> = ["+", "-", "/", "*"]
var randomSymbol: Set<Character> = ["?"]
let mathSymbolsArray = ["+", "-", "/", "*"]

pickCalculatorLoop: repeat {
    print("Your options are 1 regular🤓calculator or 2 ultra🧐calculator")
    var pickCalculator = readLine()
    switch pickCalculator {
    case "1" :
        print(" +  -  *  /  ? ")
        print("Enter your math problem.")
        let calculator1response = readLine() ?? "1 + 1"
        let calculator1Array = calculator1response.components(separatedBy: " ") // ["1", "+", "1"]
        if calculator1Array.count != 3 { continue pickCalculatorLoop }
        let operatorSymbol = calculator1Array[1]
        if correctMath.contains(Character(operatorSymbol)) {
            let operation = mathStuffFactory(opString: operatorSymbol)
            let result = operation(Double(calculator1Array[0]) ?? 0.0, Double(calculator1Array[2]) ?? 0.0)
            print(result)
            print("Would you like to calculate again?")
        } else if randomSymbol.contains(Character(operatorSymbol)) {
            let randomOperation = mathSymbolsArray.randomElement() ?? "+"
            let convertRandom = mathStuffFactory(opString: randomOperation)
            let randomCalc = convertRandom((Double(calculator1Array[0]) ?? 0.0), (Double(calculator1Array[2]) ?? 0.0))
            print(randomCalc)
        } else {
            print("Try a math problem")
        }
    case "2" :
        print("Choose an operation")
        print("Filter : < , >  example: \"Filter 1,2,3 by < 4\"")
        print("Map: number +,-,*,/ by a number. example: \"Map 1,2,3 by * 3\" = 2,4,6 ")
        print("Reduce: creating a sum of numbers, multiplying an array")
        
        //map
        var Input = readLine() ?? "0"
        var userInputArr = Input.components(separatedBy: " ")
        var numAsStringArr = userInputArr[1].components(separatedBy: ",")
        var numAsDouble = numAsStringArr.map{ Double($0) ?? Double(0.0) }
        var byNumber = userInputArr[4]
        func map(arr: [Double], closure: (Double) -> Double ) -> [Double] {
            var result = [Double]()
            for num in arr {
                result.append(closure(num))
            }
            return result
        }
        
        // filter
        func filter(arr: [Double], closure: (Double) -> Bool) -> [Double] {
            var result = [Double]()
            for num in arr {
                if closure(num) {
                    result.append(num)
                }
            }
            return result
        }
        
        //applied
        if userInputArr[0] == "map" {
            switch userInputArr[3] {
            case "*":
                let results = map(arr: numAsDouble , closure: { ($0) * (Double(byNumber) ?? 1.0) })
                print(results)
            case "+":
                let results = map(arr: numAsDouble , closure: { ($0) + (Double(byNumber) ?? 1.0) })
                print(results)
            case "-":
                let results = map(arr: numAsDouble , closure: { ($0) - (Double(byNumber) ?? 1.0) })
                print(results)
            case "/":
                let results = map(arr: numAsDouble , closure: { ($0) / (Double(byNumber) ?? 1.0) })
                print(results)
            default :
                print("Not valid")
                print("Try typing: \"Map 1,2,3 by * 3\" ")
            }
            } else if userInputArr[0] == "filter" {
                switch userInputArr[3] {
                case ">":
                    let results = filter(arr: numAsDouble , closure: { ($0) > (Double(byNumber) ?? 1.0) })
                    print(results)
                case "<":
                    let results = filter(arr: numAsDouble , closure: { ($0) < (Double(byNumber) ?? 1.0) })
                                       print(results)
                default:
                    print("Not valid")
                    print("Try typing: \"Filter 1,2,3 by < 4\" ")
                }
        }
    default :
        print("Sorry, can't do that. I'm just a calculator.")
        print("Try a math problem.")
        pickCalculator = readLine()
    }
} while condition == true


