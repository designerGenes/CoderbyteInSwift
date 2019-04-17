/*
 Have the function Division(num1,num2) take both parameters being passed and
 
 1. return the Greatest Common Factor.
 
 That is, return the greatest number that evenly goes into both numbers with no remainder.
 For example: 12 and 16 both are divisible by 1, 2, and 4 so the output should be 4. The range for both parameters will be from 1 to 10^3.
 */

func division(num1: Int, num2: Int) -> Int {
    if num1 == num2 {
        return num1
    }
    let largerNumber = max(num1, num2)
    let factorsOfLargerNumber = Array(1...largerNumber / 2).filter({ largerNumber % $0 == 0 })
    for factor in factorsOfLargerNumber.reversed() {
        if min(num1, num2) % factor == 0 {
            return factor
        }
    }
    return -1
}

