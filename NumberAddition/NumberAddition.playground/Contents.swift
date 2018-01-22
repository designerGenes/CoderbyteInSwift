import UIKit

/*
 Using the Swift language, have the function NumberSearch(str) take the str parameter,
 
 1. search for all the numbers in the string,
 2. add them together,
 3. then return that final number.
 
 For example: if str is "88Hello 3World!" the output should be 91. You will have to differentiate between single digit numbers and multiple digit numbers like in the example above. So "55Hello" and "5Hello 5" should return two different answers. Each string will contain at least one letter or symbol.
 */


func NumberAddition(_ str: String) -> Int {
    let numArr = Array("1234567890")
    var charArr = Array(str)
    var ranges = [Range<Int>]()
    var x = 0
    while x < charArr.count {
        if numArr.contains(charArr[x]) {
            var dist = x + 1
            while dist < charArr.count && numArr.contains(charArr[dist]) {
                dist += 1
            }
            ranges.append(Range(x..<dist))
            x = dist
        }
        x += 1
    }
    return ranges.map({Int(String(charArr[$0]))!}).reduce(0, +)
}

for testCase in ["10 2One Number*10", "75Number9", "55Hello", "5Hello 5"] {
    print(NumberAddition(testCase))
}


