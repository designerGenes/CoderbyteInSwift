import UIKit

/*
 Using the Swift language, have the function SwapCase(str) take the str parameter and
 
 1. swap the case of each character.
 
 For example: if str is "Hello World" the output should be hELLO wORLD.
 Let numbers and symbols stay the way they are.
 */

func isLetter(char: Character) -> Bool {
    return Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").contains(char)
}

func isLowercase(char: Character) -> Bool {
    return Array("abcdefghijklmnopqrstuvwxyz").contains(char)
}

func SwapCase(_ str: String) -> String {
    var charArr = Array(str)
    for z in 0..<charArr.count {
        let char = charArr[z]
        if isLetter(char: char) {
            charArr[z] = isLowercase(char: char) ? String(char).uppercased().first! : String(char).lowercased().first!
        }
    }
    return String(charArr)
}


for testCase in ["Hello-LOL","Sup DUDE!!?", "Hello World"] {
    print(SwapCase(testCase))
}
