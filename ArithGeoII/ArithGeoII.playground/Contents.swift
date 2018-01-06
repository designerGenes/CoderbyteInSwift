import Foundation

/*
 Using the Swift language, have the function ArithGeoII(arr) take the array of numbers stored in arr and
 1. return the string "Arithmetic" if the sequence follows an arithmetic pattern or
 2. return "Geometric" if it follows a geometric pattern.
 3. If the sequence doesn't follow either pattern return -1.
 
 An arithmetic sequence is one where the difference between each of the numbers is consistent, where as in a geometric sequence, each term after the first is multiplied by some constant or common ratio. Arithmetic example: [2, 4, 6, 8] and Geometric example: [2, 6, 18, 54].
 
 Negative numbers may be entered as parameters, 0 will not be entered, and no array will contain all the same elements.
 */

func isArith(_ arr: [Int]) -> Bool {
    var isArith = true
    return isArith
}


func ArithGeoII(_ arr: [Int]) -> String {
    var isArith = true
    var isGeome = true
    
    var delta = arr[1] - arr[0]
    var ratio = arr[1] / arr[0]
    
    for x in 1..<arr.count - 1 {
        var y = arr[x]
        var z = arr[x + 1]
        
        if z - y != delta {
            print("z - y: \(z - y) vs ∆: \(delta)")
            isArith = false
        }
        
        if Float(z) / Float(y) != Float(ratio) {
            isGeome = false
        }
    }
    return isGeome ? "Geometric" : isArith ? "Arithmetic" : "-1"
}

//var testCases = [ [1, 2, 3, 4], [10,110,210,310,410], [1, 5, 9], [-3,-4,-5,-6,-7], [2, 4, 8, 16, 32 ], [2, 6, 18, 54], [1, 10, 100, 1000], [128, 32, 8, 2], [-2, -4, -6, -8] ]

var testCases = [[-3,-4,-5,-6,-7]]
/*
 -4 * -3 = 12
 -5 * -4 = 20
 -6 * -5 = 30
 
 */
for testCase in testCases {
    print(ArithGeoII(testCase))
}
