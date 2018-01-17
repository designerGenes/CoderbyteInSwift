import UIKit

/*
 Using the Swift language, have the function Consecutive(arr) take the array of integers stored in arr and
 
 1. return the minimum number of integers needed to make the contents of arr consecutive from the lowest number to the highest number.
 
 For example: If arr contains [4, 8, 6] then the output should be 2 because two numbers need to be added to the array (5 and 7) to make it a consecutive array of numbers from 4 to 8. Negative numbers may be entered as parameters and no array will have less than 2 elements.
 
 */

func Consecutive(_ arr: [Int]) -> Int {
    var sortedSet = Set<Int>()
    for val in arr {
        sortedSet.insert(val)
    }
    let sortedArr = Array(sortedSet).sorted()
    var digitsMissing = 0
    for x in (1..<sortedArr.count).reversed() {
        let dist = sortedArr[x] - sortedArr[x - 1] - 1
        digitsMissing += dist
    }
    return digitsMissing
}

for testCase in [ [4, 8], [5, 10, 15], [-2,10,4] ] {
    print(Consecutive(testCase))
}
