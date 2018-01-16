//: Playground - noun: a place where people can play

import UIKit

/*
  Using the Swift language, have the function CaesarCipher(str,num)
 1. take the str parameter and perform a Caesar Cipher shift on it using the num parameter as the shifting number.
 2. Punctuation, spaces, and capitalization should remain intact.
 
 A Caesar Cipher works by shifting each letter in the string N places down in the alphabet (in this case N will be num).
 For example if the string is "Caesar Cipher" and num is 2 the output should be "Ecguct Ekrjgt".
 
 */

func shiftChar(char: Character, by shiftDistance: Int) -> Character {
    var stringChar = String(char)
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    if let baseIdx = alphabet.index(of: Character(stringChar.lowercased())) {
        let shiftedIdx = (baseIdx + shiftDistance) % alphabet.count
        return Character(stringChar) == alphabet[baseIdx] ? alphabet[shiftedIdx] : Character(String(alphabet[shiftedIdx]).uppercased())
    }
    return char
}

func CaesarCipher(_ str: String, _ num: Int) -> String {
    
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    var charArr = Array(str)
    for z in 0..<charArr.count {
        if alphabet.contains(Character(String(charArr[z]).lowercased())) {
            charArr[z] = shiftChar(char: charArr[z], by: num)
        }
    }
    return String(charArr)
}

for testCase in [("Caesar Cipher", 2), ("Hello", 4),("abc", 0), ("this has some punctuation, he said  ", 1)] {
    print(CaesarCipher(testCase.0, testCase.1))
}

