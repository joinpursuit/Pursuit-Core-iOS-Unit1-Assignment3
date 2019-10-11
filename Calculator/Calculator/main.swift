//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

func mathStuffFactory(opString: String) -> (Double, Double) -> Double {      // closure
  switch opString {
  case "+":
    return {x, y in x + y }     // shorthand syntax
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

let operationClosure = mathStuffFactory(opString: "+")
let result = operationClosure(45, 5)
print(result)

