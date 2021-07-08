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

func calculator(){
    // Checking format
    print("Input your operation, (+, -, /, *). Replace operator with ? to trigger math guessing game.")
    print("Example: 42 + 12 or 42 ? 12")
    var dubA: Double
    var dubB: Double
    let response = readLine()?
        .split {$0 == " "}
        .map (String.init)
    if let responseArray = response {
        if responseArray.count != 3 {
            print("bad format!")
            calculator()
        }
        if let checkDoubleA: Double = Double(responseArray[0]) {
            dubA = checkDoubleA
        } else {
            dubA = 0.0
            print("Invalid format")
            calculator()
        }
        let symbol: String = responseArray[1]
        if symbol != "+" && symbol != "-" && symbol != "/" && symbol != "*" && symbol != "?" {
            print("Invalid operand")
            calculator()
        }
        if let checkDoubleB: Double = Double(responseArray[2]) {
            dubB = checkDoubleB
        } else {
            dubB = 0.0
            print("Invalid format")
            calculator()
        }
        if symbol == "?" {
            let operandList = ["+","-","/","*"]
            if let generateOperand = operandList.randomElement() {
                let mathOperation = mathStuffFactory(opString: generateOperand)
                let result = mathOperation(dubA, dubB)
                print("\(dubA)" + " ? " + "\(dubB)" + " = " + "\(result)")
                print("What operand do you think was used to achieve the number \(result)?\n(+) (-) (/) (*)")
                var guess = true
                repeat {
                    let response = readLine()
                        if response != generateOperand {
                            print("Nope, guess again!")
                            print("\(dubA)" + " ? " + "\(dubB)" + " = " + "\(result)")
                        } else {
                            print("Yeah! You got it right!")
                            print("\(dubA) \(generateOperand) \(dubB) = \(result)")
                            guess = false
                        }
                } while guess
            }
            
        } else {
            let mathOperation = mathStuffFactory(opString: symbol)
            let result = mathOperation(dubA, dubB)
            print("\(dubA) \(symbol) \(dubB) = \(result)")
        }
    }
    lastMenu()
}
func nightmare() {
    print("Enter your operation! Format: filter/map/reduce 1,2,3,4,5,6,7 by < 1")
    let bigList: [String] = ["<", ">", "+", "*", "/"]
    var arrayofNums = [Int]()
    var num: Int = 0
    var symbol: String = " "
    let response = readLine()?
                .split{$0 == " "}
                .map(String.init)
    if let longArray = response {
        if longArray.count != 5 {
            print("Bad format.")
            nightmare()
        }
        if longArray[0].lowercased() != "filter" && longArray[0].lowercased() != "map" && longArray[0].lowercased() != "reduce" {
            print("Please make sure you wrote either filter, map or reduce")
            nightmare()
        }
        if !longArray[1].contains(",") {
            print("Either bad format or need more than one number after filter, map or reduce")
            nightmare()
        }
        if longArray[2].lowercased() != "by" {
            print("Proper format please, (by) ")
            nightmare()
        }
        if !bigList.contains(longArray[3]) {
            print("Invalid symbol, accepts only <,>,+,*,/")
            nightmare()
        } else {
            symbol = longArray[3]
        }
        let stringOfNums: [String] = longArray[1].components(separatedBy: ",")

        arrayofNums = stringOfNums.compactMap{Int($0)}
        
        if arrayofNums.count < 2 {
            print("Please have 2 or more numbers seperated by (,)")
            nightmare()
        }
        if let oneInt: Int = Int(longArray[4]) {
            num = oneInt
        } else {
            print("Please only put an integer after the operand")
            nightmare()
        }
        switch longArray[0] {
        case "filter":
            if symbol != ">" && symbol != "<" {
                print("filter must be used with either greater than(>) or less than(<) operands")
                nightmare()
            }
            let result = myFilter(a: arrayofNums, b: symbol, c: num)
            print("The filtered value is \(result)")
        case "map":
            if symbol != "*" && symbol != "/" {
                print("map must be used with either multiplication(*) or division(/) operands")
                nightmare()
            }
            let result = myMap(a: arrayofNums, b: symbol, c: num)
            print("The mapped value is \(result)")
        case "reduce":
            if symbol != "+" && symbol != "*" {
                print("reduce must be used with either addition or multiplication operands")
                nightmare()
            }
            let result = myReduce(a: arrayofNums, b: symbol, c: num)
            print("The reduced value is \(result)")
        default :
            print("Something went wrong, not suppose to ever read this line.")
            nightmare()
        }
    }
    lastMenu()
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
func gameMenu(){
    print("1) Calculator or 2) Complicated math?")
    if let response = readLine() {
        switch response.lowercased(){
        case "1", "calculator":
            calculator()
        case "2", "complicated math":
            print("y u du dis")
            nightmare()
        default:
            print("Invalid reply")
            gameMenu()
        }
    }
}
func lastMenu() {
    print("Continue?\n1) Yes\n2) No")
    if let response = readLine() {
        switch response {
        case "1", "yes":
            print("Continue!")
            gameMenu()
        case "2", "no":
            print("LATERS")
            exit(0)
        default:
            print("Invalid response")
            lastMenu()
        }
    }
}

gameMenu()
