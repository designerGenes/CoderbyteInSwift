import UIKit



func permutations(_ n:Int, _ a: inout [Int], _ pA: inout [[Int]])   {
    if n == 1 {
        pA.append(a)
        return
    }
    for i in 0..<n-1 {
        permutations(n-1,&a, &pA)
        a.swapAt(n-1, (n%2 == 1) ? 0 : i)
    }
    permutations(n-1, &a, &pA)
}

func heapsAlgorithm(_ n: Int, _ a: inout [Int], _ pA: inout [[Int]]) {
        guard n > 1 else {
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



for testCase in [123] {
    var permutationArray = [[Int]]()
    
    var digitArr = String(testCase).characters.map({Int(String($0))!})
    print(digitArr)
    heapsAlgorithm(digitArr.count, &digitArr, &permutationArray)
    print(permutationArray)
}

