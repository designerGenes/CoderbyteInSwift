import Foundation

/*
 Have the function DashInsertII(str)

 1. insert dashes ('-') between each two odd numbers and
 2. insert asterisks ('*') between each two even numbers in str.
 
 For example: if str is 4546793 the output should be 454*67-9-3.
 Don't count zero as an odd or even number.
 */

func dashInsertII(raw: String) -> String {
    let rawIntArr = raw.compactMap({Int(String($0))})
    var out = ""
    (0..<rawIntArr.count - 1).forEach { k in
        let l = rawIntArr[k]
        let r = rawIntArr[k + 1]
        let matchingEvens = (l % 2 + r % 2) < 1 && (l != 0 && r != 0)
        let matchingOdds = (l % 2 + r % 2) > 1 && (l != 0 && r != 0)
        out += String(rawIntArr[k]) + (matchingEvens ? "*" : matchingOdds ? "-" : "")
    }
    out += String(rawIntArr[rawIntArr.count - 1])
    return out
}

print(dashInsertII(raw: "56647304"))
