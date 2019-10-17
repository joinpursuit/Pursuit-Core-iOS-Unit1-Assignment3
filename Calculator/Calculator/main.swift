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

func customMap(_ arr: [Int], closure: (Int) -> (Int) ) -> [Int] {
    var transformedArr = [Int]()
    for num in arr {
        transformedArr.append(closure(num))
    }
    return transformedArr
}

func customFilter (_ arr: [Int], closure: (Int) -> (Bool) ) -> [Int] {
    var filteredArr = [Int]()
    for num in arr {
        if closure(num) {
            filteredArr.append(num)
        }
    }
    return filteredArr
}

func customReduce (_ arr: [Int],_ initialVal: Int,_ operation: String, closure: (Int) -> (Int) ) -> Int {
    var sum = initialVal
    for num in arr {
        if operation == "+" {
            sum += closure(num)
        } else if operation == "*" {
            sum *= closure(num)
        }
    }
    return sum
}

let operationsSet: Set<String.SubSequence> = ["+","-","/","*"]
let operationsSet1 = Set("+-/*")
let yesStatements: Set<String> = ["Sure","ok","k","why not", "only because you said so", "lol k", "yes", "y"]
var exitis = false

func randomOperator(_ x:Double, _ y:Double) {
    let randomOp = String(operationsSet.randomElement() ?? "+")
    print(mathStuffFactory(opString: randomOp)(x,y))
    print("Guess the operation.")
    let randomAns = readLine() ?? ""
    if randomAns == randomOp {
        print("Correct")
    } else if !operationsSet1.contains(Character(randomAns)) {
        print("Please enter a valid operation.")
    } else {
        print("Wrong, the operation was \(randomOp)")
    }
}
//recall function

repeat {
    print("Enter type of calculator, 1 (regular) or 2 (high order)")
    let oneOrTwo = readLine() ?? ""
    
    switch oneOrTwo {
    case "1":
        var operationDone = false
        while operationDone == false {
            print("Enter your operation, e.g 5 + 3")
            let answer = Array((readLine() ?? "").split(separator: " "))
            
            guard answer.count == 3 else {
                print("Please input a calculation.")
                sleep(1)
                continue
            }
            
            let x = Double(answer[0]) ?? -1
            let y = Double(answer[2]) ?? -1
            let operation = String(answer[1])
            
            if operationsSet.contains(answer[1]) {
                print(mathStuffFactory(opString: operation)(x,y))
            } else if answer[1] == "?" {
                randomOperator(x, y)
            } else {
                print("Please input a valid operation.")
                sleep(1)
                continue
            }
            
            operationDone = true
        }
        
    case "2":
        var operationDone = false
        while operationDone == false {
            print("Enter your operation e.g filter 1,2,4,5 by < 4")
            print("Filtered result is [1, 2]")
            let operationsForMap = Set("*/+-")
            let operationsForFilter = [">","<",">=","<=","==","!="]
            let operationsForReduce = Set("+*")
            let answer = (readLine() ?? "").components(separatedBy: " ")
            
            guard answer.count == 5 else {
                print("Incorrect input.")
                continue
            }
            
            let stringNumArray = answer[1].components(separatedBy: ",")
            let numArray = stringNumArray.map({ (Int($0) ?? -1)  })
            
            if answer[0] == "map" && operationsForMap.contains(Character(answer[3]) ) {
                switch answer[3] {
                case "+":
                    print(customMap(numArray, closure: {$0 + (Int(answer[4]) ?? -1) } ) )
                case "-":
                    print(customMap(numArray, closure: {$0 - (Int(answer[4]) ?? -1) } ) )
                case "/":
                    print(customMap(numArray, closure: {$0 / (Int(answer[4]) ?? -1) } ) )
                case "*":
                    print(customMap(numArray, closure: {$0 * (Int(answer[4]) ?? -1) } ) )
                default:
                    print("Error occured, wrong logical operation.")
                    sleep(1)
                    continue
                }
                operationDone = true
                
            } else if answer[0] == "filter" && operationsForFilter.contains(answer[3]) {
                switch answer[3] {
                case ">":
                    print(customFilter(numArray, closure: { $0 > (Int(answer[4]) ?? -1) }) )
                case "<":
                    print(customFilter(numArray, closure: { $0 < (Int(answer[4]) ?? -1) }) )
                case ">=":
                    print(customFilter(numArray, closure: { $0 >= (Int(answer[4]) ?? -1) }) )
                case "<=":
                    print(customFilter(numArray, closure: { $0 <= (Int(answer[4]) ?? -1) }) )
                case "==":
                    print(customFilter(numArray, closure: { $0 == (Int(answer[4]) ?? -1) }) )
                case "!=":
                    print(customFilter(numArray, closure: { $0 != (Int(answer[4]) ?? -1) }) )
                default:
                    print("Error occured, wrong logical operation.")
                    sleep(1)
                    continue
                }
                operationDone = true

            } else if answer[0] == "reduce" && operationsForReduce.contains(Character(answer[3])) {
                print(customReduce(numArray, Int(answer[4]) ?? -1, answer[3], closure: {$0}))
                operationDone = true
            }
        }
    default:
        print("Please input a valid answer.")
        continue
    }
    
    print("Would you like to play again?")
    let yesOrNo = readLine() ?? ""
    if !yesStatements.contains(yesOrNo) {
        break
    }
    
} while exitis == false

