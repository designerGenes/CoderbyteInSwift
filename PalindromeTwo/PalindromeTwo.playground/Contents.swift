import Foundation

/*
 Using the Swift language, have the function PalindromeTwo(str) take the str parameter
 being passed and return the string true if the parameter is a palindrome, (the string
 is the same forward as it is backward) otherwise return the string false. The parameter
 entered may have punctuation and symbols but they should not affect whether the string
 is in fact a palindrome. For example: "Anne, I vote more cars race Rome-to-Vienna"
 should return true.
 */

func isPalindrome(_ str: String) -> Bool {
    let strArr = Array(str.characters)
    for x in 0..<(strArr.count/2) {
        if strArr[x] != strArr[strArr.count - 1 - x] {
            return false
        }
    }
    return true
}


func PalindromeTwo(_ str: String) -> String {
    let str = str.lowercased()
    let goodCharSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
    
    let strippedString = str.components(separatedBy: goodCharSet.inverted).reduce("", +)
    return isPalindrome(strippedString) ? "true" : "false"
    
}

let testCases = ["Noel - sees Leon", "A war at Tarawa!"]

for testCase in testCases {
    print(PalindromeTwo(testCase))
}
