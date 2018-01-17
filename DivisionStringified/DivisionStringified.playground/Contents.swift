//: Playground - noun: a place where people can play

import UIKit
 /*
 Using the Swift language, have the function DivisionStringified(num1,num2) take both parameters being passed,
 1. divide num1 by num2, and
 2. return the result as a string with properly formatted commas.
 
 If an answer is only 3 digits long, return the number with no commas (ie. 2 / 3 should output "1"). For example: if num1 is 123456789 and num2 is 10000 the output should be "12,346".

 */

func DivisionStringified(_ num1: Int, _ num2: Int) -> String {
    let rawNum = Int((Double(num1) / Double(num2)).rounded())
    if rawNum > 999 {
        var numArr = Array(String(rawNum))
        var insertIdxs = [Int]()
        
        for x in (0..<numArr.count).reversed() {
            if (numArr.count - x - 1) % 3 == 0 && x < numArr.count - 1 {
                insertIdxs.append(x)
            }
        }
        
        for (z, insertIdx) in insertIdxs.enumerated() {
            numArr.insert(",", at: insertIdx + 1)
        }
        return String(numArr)
    }
    return String(rawNum)
}

for testCase in [(123456789, 10000), (5, 2), (6874, 67)] {
    print(DivisionStringified(testCase.0, testCase.1))
}
