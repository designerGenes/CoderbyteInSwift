//: Playground - noun: a place where people can play

import UIKit

/*
 Using the Swift language, have the function ABCheck(str) take the str parameter being passed and return the string true if the characters a and b are separated by exactly 3 places anywhere in the string at least once (ie. "lane borrowed" would result in true because there is exactly three characters between a and b). Otherwise return the string false.
 */


func ABCheck(_ str: String) -> String {
    let strArr =  Array(str.characters)
    for (z, char) in strArr.enumerated() {
        if String(char) == "a" {
            var behind = " "
            var ahead = " "
            if z - 4 >= 0 {
                behind = String(strArr[z - 4])
            }
            
            if z + 4 < strArr.count {
                ahead = String(strArr[z + 4])
            }
            if ahead.lowe == "b" || behind == "b" {
                return "true"
            }
        }
    }
    return "false"
    
}

let testCases = ["Laura sobs", "after badly", "lane borrowed"]
for testCase in testCases {
    print(ABCheck(testCase))
}
