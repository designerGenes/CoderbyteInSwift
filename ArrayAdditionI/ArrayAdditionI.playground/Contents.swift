//: Playground - noun: a place where people can play

import UIKit
import Foundation

 /*
  Using the Swift language, have the function ArrayAddition(arr) take the array of numbers stored in arr and return the string true if
 any combination of numbers in the array can be added up to equal
 the largest number in the array, otherwise return the string false.
 
 For example: if arr contains [4, 6, 23, 10, 1, 3] the output should return true because 4 + 6 + 10 + 3 = 23.
 
 The array will not be empty, will not contain all the same elements, and may contain negative numbers.
*/

func allPossiblePermutations(of arr: [Int], size: Int? = nil) -> [[Int]]  {
    let size = size ?? arr.count
    var out = [[Int]]()
    guard size <= arr.count else {
        return out
    }
    
    var newSeq = [Int]()
    for z in 0..<size {
        newSeq.append(z)
    }
    out.append(newSeq)
    
    while true {
        var i: Int = size - 1
        for p in (0...i).reversed() { // find incrementable val
            if newSeq[p] != arr.count - size + p {
                i = p
                break
            } else if p < 1 {
                return out
            }
        }
        
        newSeq[i] = newSeq[i] + 1
        if i + 1 < size {
            for z in i + 1..<size {
                newSeq[z] = newSeq[z - 1] + 1;
            }
        }
       
        out.append(newSeq)
    }

    return out
}

func getSubset(of arr: [Int], idxs: [Int]) -> [Int] {
    return idxs.map({arr[$0]})
}

func ArrayAddition(_ arr: [Int]) -> String {
    var arr = arr.sorted()
    let maxSum = arr.reduce(0, +)
    let highestNumber = arr.removeLast()
    if maxSum - highestNumber < highestNumber {
        return "false"
    }
    
    var allPossibleP = [[Int]]()
    for z in 2...arr.count {
        let permutations = allPossiblePermutations(of: arr, size: z)
        let mappedPermutations = permutations.map({ getSubset(of: arr, idxs: $0) })
        let reducedPermutations = mappedPermutations.map({$0.reduce(0, +)})
        if reducedPermutations.contains(highestNumber) {
            return "true"
        }
        allPossibleP = allPossibleP + mappedPermutations
    }
    return "false"
}

let testCases = [ [1, 2, 3, 4, 50], [5,7,16,1,2], [3,5,-1,8,13] ]

for testCase in testCases {
    print(ArrayAddition(testCase))
}

