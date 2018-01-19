import UIKit

/*
 Using the Swift language, have the function MeanMode(arr) take the array of numbers stored in arr and
 
 1. return 1 if the mode equals the mean,
 2. return 0 if they don't equal each other

 (ie. [5, 3, 3, 3, 1] should return 1 because the mode (3) equals the mean (3)).
The array will not be empty, will only contain positive integers, and will not contain more than one mode.
 */

// mode: val that occurs most frequently
// mean: average


func MeanMode(_ arr: [Int]) -> Int {
    let mean = arr.reduce(0, +) / arr.count
    var mode = 0
    var counter = [Int: Int]()
    for val in arr {
        if let curVal = counter[val] {
            counter[val] = curVal + 1
        } else {
            counter[val] = 1
        }
    }
    let sortedCounter = counter.sorted(by: {$0.value > $1.value})
    mode = sortedCounter.first!.key
    return mode == mean ? 1 : 0
}

for testCase in [ [1, 2, 3], [4, 4, 4, 6, 22], [5, 3, 3, 3, 1] ] {
    print(MeanMode(testCase))
}
