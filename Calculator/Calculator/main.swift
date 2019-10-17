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

//let result = closureOperation(45, 5)

print("""
Welcome to the calculator.
Please enter "1" for normal operations.
Enter "2" for higher order operations.
""")

var userChoice = readLine()
var decision = Int(userChoice!) ?? 1
decision = Int(userChoice!) ?? 2

if decision == 1{
    print("Please enter an equation. Example: 5 + 2 ")
    var userInput = readLine() ?? "0"
   // var seperator = userInput.components(separatedBy: " ")
    //var closureOperation = mathStuffFactory(opString: seperator[1])
    //var result = closureOperation(Double(seperator[0]) ?? 0.0 , Double(seperator[2]) ?? 0.0)
    //let bool = true
    
    
    //print("result of operation is: \(result)")
    //result
    
    
    func str(in input: String) -> Double {
        let seperator = userInput.components(separatedBy: " ")
        let opString = seperator[1]
        let closureOperation = mathStuffFactory(opString: opString)
        var result = 0.0
        if seperator.count != 3 {
            return result
        } else {
            result = closureOperation(Double(seperator[0]) ?? 0.0 , Double(seperator[2]) ?? 0.0)
        }
        
        return result
    }
    
    let result = str(in: userInput)
    print(result)
    
    //func str (in input: [String]) -> Double {
    //    let opString: String = seperator[1].randomElement() ?? "+"
    //    closureOperation = mathStuffFactory(opString: "")
    //    if userInput.count != 3 {
    //        return result
    //    } else if seperator[1] == "?"{
    //
    //    }
    //    else{
    //        userInput = readLine() ?? "0"
    //        print("Please enter an equation. Example: 7 + 2")
    //    }
    //    return 0.0
    //}
    
    //print("""
    //Please enter a suprise operator for a secret equation. e.g 6 ? 5
    //""")
    
    //userInput = readLine() ?? "0"
    //func randomOperator(userOperator: [String]) -> Double {
    //    let random = seperator[1] == "?"
    //    if userInput.count != 3 {
    //        if {
    //
    //            return result
    //        }
    //    }
    //    return 0.0
    //}
}


