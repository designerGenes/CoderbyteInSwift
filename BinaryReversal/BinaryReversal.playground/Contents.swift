import Foundation
import UIKit

/*
 Have the function BinaryReversal(str) take the str parameter being passed, which will be a positive integer,
 
 1. take its binary representation (padded to the nearest N * 8 bits), reverse that string of bits, and then finally
 2. return the new reversed string in decimal form.
 
 For example: if str is "47" then the binary version of this integer is 101111 but we pad it to be 00101111. Your program should reverse this binary string which then becomes: 11110100 and then finally return the decimal version of this string, which is 244.
 */

func binaryReversal(raw: Int) -> Int {
    var paddedBinaryString = String(raw, radix: 2)
    var x = 0
    while x * 8 < paddedBinaryString.count {
        x += 1
    }
    
    while (paddedBinaryString.count - (8 * (x - 1))) < 8 {
        paddedBinaryString.insert("0", at: paddedBinaryString.startIndex)
    }

    let reversedBinaryString = String(paddedBinaryString.reversed())
    return Int(reversedBinaryString, radix: 2) ?? -1
}


print(binaryReversal(raw: 213))
