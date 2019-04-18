import Foundation

/*
 Have the function ArrayRotation(arr) take the arr parameter being passed which will be an array of non-negative integers and

1. circularly rotate the array starting from the Nth element where N is equal to the first integer in the array.
2. return the new array as a string
 
 For example: if arr is [2, 3, 4, 1, 6, 10] then your program should rotate the array starting from the 2nd position because the first element in the array is 2. The final array will therefore be [4, 1, 6, 10, 2, 3].
 
 For this example your program would return 4161023. The first element in the array will always be an integer greater than or equal to 0 and less than the size of the array.
 */

func arrayRotation(_ arr: [Int]) -> Int {
    var arr = arr
    (0..<arr.count - arr[0]).forEach { (k) in
        rotateArray(arr: &arr)
    }
    var intString = arr.map({String($0)}).joined()
    return Int(intString)!
    
}

func rotateArray(arr: inout [Int], rotateRight: Bool = true) {
    if rotateRight {
        arr.insert(arr.remove(at: arr.count - 1), at: 0)
    } else {
        arr.append(arr.remove(at: 0))
    }
}


print(arrayRotation([0, 0]))


