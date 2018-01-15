import UIKit
import Foundation

/*
 Using the Swift language, have the function BinaryConverter(str)
     return the decimal form of the binary value. For example: if 101 is passed return 5, or if 1000 is passed return 8.
 */



func BinaryConverter(_ str: String) -> String {
    let digitArr = str.map({Int(String($0))!})
    var total = 0
    for (z, digit) in digitArr.enumerated() {
        if digit > 0 {
            total += Int(pow(Double(2), Double(digitArr.count - z - 1)))
        }
    }
    return String(total)
}


var testCases = ["0", "100101", "011", "1000", "101"]

for testCase in testCases {
    print(BinaryConverter(testCase))
}
