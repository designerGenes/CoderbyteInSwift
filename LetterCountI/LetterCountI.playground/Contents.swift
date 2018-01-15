//: Playground - noun: a place where people can play

import UIKit

/*
 Using the Swift language, have the function LetterCountI(str) take the str parameter being passed and
 - return the first word with the greatest number of repeated letters.
     For example: "Today, is the greatest day ever!" should return greatest because it has 2 e's (and 2 t's) and it comes before ever which also has 2 e's.
     If there are no words with repeating letters return -1.
     Words will be separated by spaces.
 */


func LetterCountI(_ str: String) -> String {
    let strArr = str.split(separator: " ")
    var repeatedCharCounts = [Int]()
    for str in strArr {
        var mutStr = String(str).lowercased()
        var charCounter = [Character: Int]()
        while !mutStr.isEmpty {
            let popChar = mutStr.removeFirst()
            if let existingVal = charCounter[popChar] {
                charCounter[popChar] = existingVal + 1
            } else {
                charCounter[popChar] = 1
            }
        }
        let sumOfRepeated = Array(charCounter.values).filter({$0 > 1}).reduce(0, +)
        repeatedCharCounts.append(sumOfRepeated)
    }

    if let highestVal = repeatedCharCounts.sorted(by: {$0 > $1}).first, let idx = repeatedCharCounts.index(of: highestVal), highestVal > 0 {
        return String(strArr[idx])
    }
    return "-1"
}

let testCases = ["Hello apple pie", "No words", "Today, is the greatest day ever!" ]

for testCase in testCases {
    print(LetterCountI(testCase))
}

