import UIKit

/*
 Using the Swift language, have the function SimpleMode(arr)
 1. take the array of numbers stored in arr and
 2. return the number that appears most frequently (the mode).
 
 For example: if arr contains [10, 4, 5, 2, 4] the output should be 4. If there is more than one mode return the one that appeared in the array first (ie. [5, 10, 10, 6, 5] should return 5 because it appeared first). If there is no mode return -1. The array will not be empty.
 */

func SimpleMode(_ arr: [Int]) -> Int {
    var occs = [Int: (Int, Int)]() // [val: (first occurrence, count)]
    for (z, val) in arr.enumerated() {
        if let curVal = occs[val] {
            occs[val]!.1 = curVal.1 + 1
        } else {
            occs[val] = (z, 1)
        }
    }
    
    let sortedOccs = Array(occs.sorted(by: { $0.1 < $1.1 })).filter({$0.value.1 > 1})
    
    if !sortedOccs.isEmpty {
        if sortedOccs.count > 1 {
            let topTwo = sortedOccs[0..<2]
            if topTwo[0].value.1 == topTwo[1].value.1 {
                return topTwo.sorted(by: {$0.value.0 < $1.value.0})[0].key
            } else {
                return topTwo.sorted(by: {$0.value.1 > $1.value.1})[0].key
            }
        } else {
            return sortedOccs[0].key
        }
    }
    return -1
}

for testCase in [[1,2,2,3], [4,5,1,6,7,8,100,200,1000,5], [4,4,5,6,7,8,8,8,8,8], [5,5,2,2,1], [3,4,1,6,10], [5, 10, 10, 6, 5]] {
    print(SimpleMode(testCase))
}
