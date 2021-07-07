//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

while  !false{
  
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
   print("ENTER TYPE OF CALCULATION REGULAR [1], HIGH ORDER [2]")
let userInput = readLine()!
switch userInput {
 case "1":
let addition = mathStuffFactory(opString: "+")
let subtraction = mathStuffFactory(opString: "-")
let multipliy = mathStuffFactory(opString: "*")
let divide = mathStuffFactory(opString: "/")
let operation = ["+", "-", "*", "/"]
var namesOfOperation = [addition,subtraction,multipliy,divide]

    print("Enter your type of calculation below")

if let userInput = readLine() {
let userChoice = userInput.components(separatedBy: " ")
let nums = userChoice.compactMap({Double($0)})
    
switch userChoice[1] {
  case "+":
    print(addition(nums[0],nums[1]))
  case "-":
    print(subtraction(nums[0],nums[1]))
  case "*":
    print(multipliy(nums[0],nums[1]))
  case "/":
    print(divide(nums[0],nums[1]))
  case "?":
let numR = Int.random(in: 0...namesOfOperation.count - 1)
   print(namesOfOperation[numR](nums[0],nums[1]))
   print("Choose an aperator to complite the logic + - * /)")
let userInput = readLine()
if userInput == operation[numR] {
   print("That's rigth")
   print(" ")
} else {
   print("It was not the right operation symbol")
    }
  default:
   print("Sorry, enter your calculation")
    }
}
case "2": //second part
var someFilter1: [Int] = []
var mapArr: [Double] = []
var emptyReduce = [0]
    
func someFilter(string: String, arr:[Int], filter:(Int)) -> [Int] {
 switch string {
   case ">":
     for number in arr {
      if number > filter {
       someFilter1.append(number)
        }
      }
case "<":
  for numbers in arr {
     if numbers < filter {
        someFilter1.append(numbers)
        }
      }
default:
  print("Sorry, I did not understand")
   }
return someFilter1
}
 
func someMapNumber(strin1:String, arr1:[Double], mapNum:(Double)) -> [Double] {
  switch strin1 {
    case"/":
      for number in arr1{
        mapArr.append(number / mapNum)
          }
case "*":
   for number in arr1 {
      mapArr.append(number * mapNum)
        }
default:
  print("?")
  }
    return mapArr
}

func reduceNumbers(string: String, array: [Int], reduceN:(Int)) -> (Int) {
 var emptyReduce =  reduceN
 switch string {
   case"*":
   for numbers in array  {
      emptyReduce *= numbers
         }
   case "+":
    for numbers in array {
       emptyReduce += numbers
         }
        
default:
    print("???")
    }
  return emptyReduce
}
     print("ENTER CALCULATION, FILTER, MAP, REDUCE")
if let userInput = readLine()?.lowercased() {
   let separate = userInput.components(separatedBy: " ") //["MAP", "1,2,3,4,5", "BY", "*", "5"]
   let separate1 = separate[1].components(separatedBy: ",") // ["1", "2", "3", "4", "5"]
   let separate2 = separate1.compactMap({Int($0)}) // [1, 2, 3, 4, 5]
//    let useArryOfString = separate.compactMap({Int($0)})
   let userArr = separate.compactMap({Int($0)})
   let doubleArray = separate1.compactMap() {Double($0)}
     print(doubleArray)
   var lastNum = Int ()
   let doubleLastNum = separate.compactMap() {Double($0)}

    
for numbers in userArr{
     lastNum = numbers
}
let operator1 =  separate[3]
 switch separate[0]{
  case "filter":
let filterOperation = someFilter(string:operator1 , arr: separate2, filter: lastNum)
    print(filterOperation)
  case "map":
let mapOperation = someMapNumber(strin1: operator1, arr1: doubleArray, mapNum: doubleLastNum[0])
    print(mapOperation)
  case "reduce":
let reduceOperation = reduceNumbers(string: operator1, array: separate2, reduceN: lastNum)
    print(reduceOperation)
default:
    print("?")
      }
}
default:
      print("WRONG INPUT")
    }
}



