import UIKit
import Foundation

/*
 Have the function PrimeChecker(num) take num and
 
 1. return 1 if any arrangement of num comes out to be a prime number, otherwise return 0.
 
 For example: if num is 910, the output should be 1 because 910 can be arranged into 109 or 019, both of which are primes.
 */

func primeChecker(num: Int) -> Int {
    for permutation in permutationsOfNumber(num: num) {
        if isPrime(num: permutation) {
            return 1
        }
    }
    return 0
}

func permute(arr: inout [Int], n: Int = -1, results: Set<[Int]> = Set<[Int]>()) -> Set<[Int]> {
    let n = n < 0 ? arr.count : n
    var results = results
    if n == 1 {
        results.insert(arr)
    } else {
        for k in 0..<n {
            for result in permute(arr: &arr, n: n - 1) {
                results.insert(result)
            }
            let l = n % 2 == 1 ? 0 : k
            let holder = arr[n - 1]
            arr[n - 1] = arr[l]
            arr[l] = holder
        }
    }
    return results
}

func permutationsOfNumber(num: Int) -> [Int] {
    var arr = String(num).compactMap({Int(String($0))})
    var decimalSet = [Int]()
    for rawIntArr in permute(arr: &arr) {
        var total = 0
        for k in 0..<rawIntArr.count {
            total += rawIntArr[k] * Int(pow(10, Double(rawIntArr.count - 1 - k)))
        }
        decimalSet.append(total)
    }

    return decimalSet
}

func isPrime(num: Int) -> Bool {
    if (num > 2 && num % 2 == 0) || num < 2 {
        return false
    }
    
    var k = 3
    while k <= Int(sqrt(Float(num))) {
        if num % k == 0 {
            return false
        }
        k += 2
    }
    return true
}


