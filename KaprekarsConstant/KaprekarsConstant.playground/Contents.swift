import UIKit

/*
 Have the function KaprekarsConstant(num) take the num parameter being passed which will be a 4-digit number with at least two distinct digits. Your program should perform the following routine on the number:
 1. Arrange the digits in descending order and in ascending order (adding zeroes to fit it to a 4-digit number), and subtract the smaller number from the bigger number. Then
 2. repeat the previous step.
 
 Performing this routine will always cause you to reach a fixed number: 6174. Then performing the routine on 6174 will always give you 6174 (7641 - 1467 = 6174). Your program should return:
 
 1. the number of times this routine must be performed until 6174 is reached.
 
 For example: if num is 3524 your program should return 3 because of the following steps: (1) 5432 - 2345 = 3087, (2) 8730 - 0378 = 8352, (3) 8532 - 2358 = 6174.
 
 */

func intToArr(raw: Int) -> [Int] {
    var arr = String(describing: raw).compactMap({Int(String($0))})
    while arr.count < 4 {
        arr.insert(0, at: 0)
    }
    return arr
}

func arrToInt(arr: [Int]) -> Int {
    var out = 0
    for (k, val) in arr.enumerated() {
        out += val * Int(pow(10, Double(arr.count - k - 1)))
    }
    return out
}

func flipNumber(raw: Int) -> Int {
    return arrToInt(arr: intToArr(raw: raw).reversed())
}

func kaprekarsConstant(num: Int, count: Int = 0) -> Int {
    if num == 6174 {
        return count
    }
    
    let ascendingArr = intToArr(raw: num).sorted()
    let ascendingInt = arrToInt(arr: ascendingArr)
    let descendingInt = arrToInt(arr: ascendingArr.reversed())
    let diff = max(ascendingInt, descendingInt) - min(ascendingInt, descendingInt)
    return kaprekarsConstant(num: diff, count: count + 1)
}



for ex in [2111] {
    print(kaprekarsConstant(num: ex))
    
    
}
