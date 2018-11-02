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

func part1(){
print("Please select your operation +, -, /, * ")
    var number1: Double
    var number2: Double
    let response = readLine()?
        .split {$0 == " "}
        .map (String.init)
    if let responseArray = response {
        if responseArray.count != 3 {
            print("Incorrect choice, try again")
            part1()
        }
        if let checkDoubleA: Double = Double(responseArray[0]) {
            number1 = checkDoubleA
        } else {
            number1 = 0.0
            print("Incorrect choice, try again")
            part1()
        }
        let symbol: String = responseArray[1]
        if symbol != "+" && symbol != "-" && symbol != "/" && symbol != "*" && symbol != "?" {
            print("Incorrect choice, try again")
            part1()
        }
        if let checkDoubleB: Double = Double(responseArray[2]) {
            number2 = checkDoubleB
        } else {
            number2 = 0.0
            print("Incorrect choice, try again")
            part1()
        }
        if symbol == "?" {
            let operandList = ["+","-","/","*"]
            if let generateOperand = operandList.randomElement() {
                let mathOperation = mathStuffFactory(opString: generateOperand)
                let result = mathOperation(number1, number2)
                print("\(number1)" + " ? " + "\(number2)" + " = " + "\(result)")
                print("What do you think was the correct operator used \(result)?\n(+) (-) (/) (*)")
                var guess = true
                repeat {
                    let response = readLine()
                    if response != generateOperand {
                        print("Incorrect choice, try again")
                        print("\(number1)" + " ? " + "\(number2)" + " = " + "\(result)")
                    } else {
                        print("Correct choice, you do not have to try again")
                        print("\(number1) \(generateOperand) \(number2) = \(result)")
                        guess = false
                    }
                } while guess
            }
            } else {
            let mathOperation = mathStuffFactory(opString: symbol)
            let result = mathOperation(number1, number2)
            print("\(number1) \(symbol) \(number2) = \(result)")
        }
    }
    closingMenu()
}
func Part2() {
    print("Please choose from one of these following options: filter/map/reduce 1,2,3,4,5,6,7 by < 1")
    let operationsArray: [String] = ["<", ">", "+", "*", "/"]
    var numberArray = [Int]()
    var numero: Int = 0
    var operand: String = " "
    let response = readLine()?
        .split{$0 == " "}
        .map(String.init)
    if let responseArray = response {
        if responseArray.count != 5 {
            print("Incorrect choice.")
            Part2()
        }
        if responseArray[0].lowercased() != "filter" && responseArray[0].lowercased() != "map" && responseArray[0].lowercased() != "reduce" {
            print("Please choose either filter, map, or reduce. It's really not that hard")
            Part2()
        }
        if !responseArray[1].contains(",") {
            print("You've almost got it, try again")
            Part2()
        }
        if responseArray[2].lowercased() != "by" {
            print("Follow the options EXACTLY (don't blame me blame the assignment) ")
            Part2()
        }
        if !operationsArray.contains(responseArray[3]) {
            print("Incorrect choice, pick one of these <,>,+,*,/")
            Part2()
        } else {
            operand = responseArray[3]
        }
        let SecondaryArray: [String] = responseArray[1].components(separatedBy: ",")
        
        numberArray = SecondaryArray.compactMap{Int($0)}
        
        if numberArray.count < 2 {
            print("Por favor, include multiple numbers by (,)")
            Part2()
        }
        if let oneInt: Int = Int(responseArray[4]) {
            numero = oneInt
        } else {
            print("Please stop messing this up")
            Part2()
        }
        switch responseArray[0] {
        case "filter":
            if operand != ">" && operand != "<" {
                print("Incorrect choice, try again")
                Part2()
            }
            let result = myFilter(a: numberArray, b: operand, c: numero)
            print("The filtered value is \(result)")
        case "map":
            if operand != "*" && operand != "/" {
                print("Incorrect choice, try again")
                Part2()
            }
            let result = myMap(a: numberArray, b: operand, c: numero)
            print("The mapped value is \(result)")
        case "reduce":
            if operand != "+" && operand != "*" {
                print("Incorrect choice, try again")
                Part2()
            }
            let result = myReduce(a: numberArray, b: operand, c: numero)
            print("The reduced value is \(result)")
        default :
            Part2()
        }
    }
    closingMenu()
}
func myFilter(a:[Int], b: String, c: Int) -> [Int] {
    var array = [Int]()
    if b == "<" {
        for i in a {
            if i < c {
                array.append(i)
            }
        }
    } else {
        for i in a {
            if i > c {
                array.append(i)
            }
        }
    }
    return array
}
func myMap(a:[Int], b: String, c: Int) -> [Int] {
    var array = [Int]()
    if b == "*" {
        for i in a {
            array.append(i * c)
        }
    } else {
        for i in a {
            array.append(i + c)
        }
    }
    return array
}
func myReduce(a:[Int], b: String, c: Int) -> [Int] {
    var array = [Int]()
    var total: Int = 0
    if b == "+" {
        for i in a {
            total += i
        }
        total += c
    } else {
        total = 1
        for i in a {
            total *= i
        }
        total *= c
    }
    array.append(total)
    return array
}
func openingMenu(){
    print("1) Calc or 2) Very difficult to create?")
    if let response = readLine() {
        switch response.lowercased(){
        case "1", "Calc":
            part1()
        case "2", "very difficult to create":
            print("This was much harder than the other calc")
            Part2()
        default:
            print("Please select something else")
            openingMenu()
        }
    }
}
func closingMenu() {
    print("Continue?\n1) Yes\n2) No")
    if let response = readLine() {
        switch response {
        case "1", "yes":
            print("Here we go again")
            openingMenu()
        case "2", "no":
            print("Thank you")
            exit(0)
        default:
            print("Don't be a smartass")
            closingMenu()
        }
    }
}
openingMenu()


