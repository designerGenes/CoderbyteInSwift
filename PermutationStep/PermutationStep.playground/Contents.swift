import UIKit

/*
  Using the Swift language, have the function PermutationStep(num) take the num parameter being passed and
 1. return the next number greater than num using the same digits.
 
 For example: if num is 123 return 132, if it's 12453 return 12534. If a number has no greater permutations, return -1 (ie. 999).
 */


func heapsAlgorithm(_ n: Int, _ a: inout [Int], _ pA: inout [[Int]]) {
    guard n > 1 else {
        print(a)
        pA.append(a)
        return
    }
    // 1. go through every possible size (n) of array slice from n-1 down to 1
    for i in 0..<n-1 {
        
        heapsAlgorithm(n-1, &a, &pA)
        // 2 if n is odd, swap last with first.  Otherwise, swap last with counter (i)
        a.swapAt(n-1, (n % 2 == 1 ? 0 : i))
    }
    heapsAlgorithm(n-1, &a, &pA)
}

func PermutationStep(_ num: Int) -> Int {
    var permArr = [[Int]]()
    var digitArr = String(num).map({Int(String($0))!})
    var slimArr = [Int]()
    heapsAlgorithm(digitArr.count, &digitArr, &permArr)
    
    for perm in permArr {
        var out = 0
        for (z, y) in perm.enumerated() {
            out += (y * Int(pow(10, Double(perm.count - 1 - z))))
        }
        slimArr.append(out)
    }
    slimArr = slimArr.sorted()
    print(slimArr)
    for x in (0..<slimArr.count).reversed() {
        if slimArr[x] == num && x < slimArr.count - 1 {
            return slimArr[x + 1]
        }
    }
    return -1
}

func PermutationStep2(_ num: Int) -> Int {
    var digitArr = String(num).map({Int(String($0))!})
    for z in (0..<digitArr.count - 1).reversed() {
        if digitArr[z] < digitArr[digitArr.count - 1] {
            var removed = digitArr.remove(at: z)
            digitArr.insert(removed, at: z)
        }
    }
    var out = 0
    for (z, d) in digitArr.enumerated() {
        out += (d * Int(pow(10, Double(digitArr.count - 1 - z))))
    }
    return out
}


//   43645
//  for (i..<end) reversed, if any other arr val is lower than arr[i], swap arr[i] and  arr[i - 1]

for testCase in [ 43645 ] {
    print(PermutationStep2(testCase))
}
