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
let operationsSet: Set<String.SubSequence> = ["+","-","/","*"]
var exitis = false
repeat {
    let answer = Array((readLine() ?? "").split(separator: " "))
    guard answer.count >= 3 else {
        print("Please input a calculation.")
        continue
    }
    
    let x = Double(answer[0]) ?? -1
    let y = Double(answer[2]) ?? -1
    let operation = String(answer[1])
    
    if operationsSet.contains(answer[1]) {
        print(mathStuffFactory(opString: operation)(x,y))
    } else if answer[1] == "?" {
        let randomOp = String(operationsSet.randomElement() ?? "+")
        print(mathStuffFactory(opString: randomOp)(x,y))
        print("Guess the operation.")
        let randomAns = readLine() ?? ""
        if randomAns == randomOp {
            print("Correct")
        } else {
            print("Wrong")
        }
    } else {
        print("Please input a valid operation.")
    }
    print(answer)
} while exitis == false

// add more guard statements.
