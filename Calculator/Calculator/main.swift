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

func menu1(){
    print("1) Calculator or 2) High Order Math?")
    if let response = readLine() {
        switch response.lowercased(){
        case "1", "Calculator":
            calc()
        case "2", "High Order math":
            print("High Order Math Time")
            highOrder()
        default:
            print("Invalid reply")
            menu1()
        }
    }
}


func calc(){
    // Checking format
    print("Pick your operation, (+, -, /, *). Use ? to start your math guessing game.")
    print("Example: 1 + 1 or 3 ? 6")
    var double1: Double
    var double2: Double
    let response = readLine()?
        .split {$0 == " "}
        .map (String.init)
    if let responseArray = response {
        if responseArray.count != 3 {
            print("Incorrect. Format wrong.")
            calc()
        }
        if let checkDoubleA: Double = Double(responseArray[0]) {
            double1 = checkDoubleA
        } else {
            double1 = 0.0
            print("Incorrect. Format wrong.")
            calc()
        }
        let operand: String = responseArray[1]
        if operand != "+" && operand != "-" && operand != "/" && operand != "*" && operand != "?" {
            print("Incorrect. Operand wrong")
            calc()
        }
        if let checkDoubleB: Double = Double(responseArray[2]) {
            double2 = checkDoubleB
        } else {
            double2 = 0.0
            print("Incorrect. Format wrong.")
            calc()
        }
        if operand == "?" {
            let operandList = ["+","-","/","*"]
            if let generateOperand = operandList.randomElement() {
                let mathOperation = mathStuffFactory(opString: generateOperand)
                let result = mathOperation(double1, double2)
                print("\(double1)" + " ? " + "\(double2)" + " = " + "\(result)")
                print("What operand do you think was used to get this answer \(result)?\n(+) (-) (/) (*)")
                var guess = true
                repeat {
                    let response = readLine()
                    if response != generateOperand {
                        print("Sorry, try again!")
                        print("\(double1)" + " ? " + "\(double2)" + " = " + "\(result)")
                    } else {
                        print(" You got it right!!!!!")
                        print("\(double1) \(generateOperand) \(double2) = \(result)")
                        guess = false
                    }
                } while guess
            }
            
        } else {
            let mathOperation = mathStuffFactory(opString: operand)
            let result = mathOperation(double1, double2)
            print("\(double1) \(operand) \(double2) = \(result)")
        }
    }
    menu2()
}
func highOrder() {
    print("Enter your operation! Format: filter/map/reduce 1,2,3,4,5,6,7 by < 1")
    let list: [String] = ["<", ">", "+", "*", "/"]
    var arrayofNums = [Int]()
    var num: Int = 0
    var operand2: String = " "
    let response = readLine()?
        .split{$0 == " "}
        .map(String.init)
    if let longArray = response {
        if longArray.count != 5 {
            print("Bad format.")
            highOrder()
        }
        if longArray[0].lowercased() != "filter" && longArray[0].lowercased() != "map" && longArray[0].lowercased() != "reduce" {
            print("Make sure you wrote either filter, map or reduce")
            highOrder()
        }
        if !longArray[1].contains(",") {
            print("You wrote  bad format or you need more than one number after your filter. Use map or reduce")
            highOrder()
        }
        if longArray[2].lowercased() != "by" {
            print("Use correct format please, (by) ")
            highOrder()
        }
        if !list.contains(longArray[3]) {
            print("Invalid!I only accepts only <,>,+,*,/")
            highOrder()
        } else {
            operand2 = longArray[3]
        }
        let stringOfNums: [String] = longArray[1].components(separatedBy: ",")
        
        arrayofNums = stringOfNums.compactMap{Int($0)}
        
        if arrayofNums.count < 2 {
            print(" 2 or more numbers must be seperated by (,)")
            highOrder()
        }
        if let oneInt: Int = Int(longArray[4]) {
            num = oneInt
        } else {
            print("Only intergers go after the operand")
            highOrder()
        }
        
        switch longArray[0] {
        case "filter":
            if operand2 != ">" && operand2 != "<" {
                print("You must use either greater than(>) or less than(<) operands")
                highOrder()
            }
            let result = myFilter(a: arrayofNums, b: operand2, c: num)
            print("The filtered value is \(result)")
        case "map":
            if operand2 != "*" && operand2 != "/" {
                print("You must use either multiplication(*) or division(/) operands")
                highOrder()
            }
            let result = myMap(a: arrayofNums, b: operand2, c: num)
            print("The mapped value is \(result)")
        case "reduce":
            if operand2 != "+" && operand2 != "*" {
                print("You must use either addition or multiplication operands")
                highOrder()
            }
            let result = myReduce(a: arrayofNums, b: operand2, c: num)
            print("The reduced value is \(result)")
        default :
            print("Invalid Try again.")
            highOrder()
        }
    }
    menu2()
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

func menu2() {
    print("Would you like to Continue?\n1) Yes\n2) No")
    if let response = readLine() {
        switch response {
        case "1", "yes":
            print("Ok!")
            menu1()
        case "2", "no":
            print("Good Bye")
            exit(0)
        default:
            print("Incorrect response")
            menu2()
        }
    }
}


menu1()

