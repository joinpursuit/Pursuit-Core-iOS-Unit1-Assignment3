import UIKit

func myMap (_ arr: [Int], closure: (Int) -> (Int) ) -> [Int] {
    var transformedArr = [Int]()
    for num in arr {
        transformedArr.append(closure(num))
    }
    return transformedArr
}


let answer = "filter 1,2,3,4,5,6 by > 3"
let ansArray = answer.components(separatedBy: " ")
let stringNumArray = ansArray[1].components(separatedBy: ",")
let numArray = stringNumArray.map({ (Int($0) ?? -1)  })
print(numArray)
print(ansArray)


//Numbers less than a given number
//Numbers greater than a given number

func myFilter (_ arr: [Int], closure: (Int) -> (Bool) ) -> [Int] {
    var filteredArr = [Int]()
    for num in arr {
        if closure(num) {
            filteredArr.append(num)
        }
    }
    return filteredArr
}

print(myFilter([1,2,42,42,2]) { $0 < 20 })

func myReduce (_ arr: [Int],_ initialVal: Int,_ operation: String, closure: (Int) -> (Int) ) -> Int {
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

let array = [1,3,4,3,6,6,8,2]

print(myReduce(array, 0, "+", closure: {$0}) )
