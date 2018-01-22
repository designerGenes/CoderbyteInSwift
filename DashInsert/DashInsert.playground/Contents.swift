
import UIKit

/*
Using the Swift language, have the function DashInsert(str)
 
 1. insert dashes ('-') between each two odd numbers in str.
 
 For example: if str is 454793 the output should be 4547-9-3. Don't count zero as an odd number.
 */

func DashInsert(_ str: String) -> String {
    var strArr = Array(str)
    var insertIdxs = [Int]()
    for x in 0..<(strArr.count - 1) {
        if Int(String(strArr[x]))! % 2 == 1 && Int(String(strArr[x + 1]))! % 2 == 1 {
            insertIdxs.append(x + 1)
        }
    }
    for (z, idx) in insertIdxs.enumerated() {
        strArr.insert("-", at: idx + z)
    }
    return String(strArr)
}

for testCase in [99946, 56730, 4547023] {
    let strTestCase = String(testCase)
    print(DashInsert(strTestCase))
}
