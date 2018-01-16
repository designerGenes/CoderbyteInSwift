
//: Playground - noun: a place where people can play

import UIKit

/*
 Using the Swift language, have the function SecondGreatLow(arr) take the array of numbers stored in arr and
 1. return the second lowest and second greatest numbers, respectively, separated by a space.
 
 For example: if arr contains [7, 7, 12, 98, 106] the output should be 12 98. The array will not be empty and will contain at least 2 numbers. It can get tricky if there's just two numbers!
 */

func SecondGreatLow(_ arr: [Int]) -> String {
    var arrSet = Set<Int>()
    for val in arr {
        arrSet.insert(val)
    }
    let sortedArr = Array(arrSet).sorted(by: {$0 < $1})
    let idxs: (Int, Int) = arr.count > 2 ? (1, sortedArr.count - 2) : (1, 0)
    return "\(sortedArr[idxs.0]) \(sortedArr[idxs.1])"
}

for testCase in [[1, 42, 42, 180], [7, 7, 12, 98, 106], [4, 90], [1, 2, 3, 3]] {
    print(SecondGreatLow(testCase))
}

