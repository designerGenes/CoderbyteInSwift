import UIKit
import Foundation

// Prime Mover

/* Using the Swift language, have the function PrimeMover(num) return the numth prime number.
    The range will be from 1 to 10^4.
    For example: if num is 16 the output should be 53 as 53 is
        the 16th prime number.
*/


func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}

func PrimeMover(_ num: Int) -> Int {
    
    var mostRecentPrimeNumber = 2;
    
    // for each number until num
    for x in 1..<num {
        var y = mostRecentPrimeNumber + (mostRecentPrimeNumber % 2 == 0 ? 1 : 2)
        while !isPrime(y) {
            y += (mostRecentPrimeNumber % 2 == 0 ? 1 : 2)
        }
        
        mostRecentPrimeNumber = y
    }
    
    return mostRecentPrimeNumber
    
}


var testCases = [100]
for testCase in testCases {
    print(PrimeMover(testCase))
}
