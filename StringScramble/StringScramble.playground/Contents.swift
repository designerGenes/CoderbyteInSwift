import Foundation

/*
 Using the Swift language, have the function StringScramble(str1,str2) take both parameters being passed and return the string true if a portion of str1 characters can be rearranged to match str2, otherwise return the string false. For example: if str1 is "rkqodlw" and str2 is "world" the output should return true. Punctuation and symbols will not be entered with the parameters.
 */


typealias CharIntDict = [Character: Int]

func StringScramble(_ str1: String, _ str2: String) -> String {
    var str1 = String(str1.characters.filter({str2.characters.contains($0)}))
    
    var dicts = [CharIntDict]()
    for str in [str1, str2] {
        var dict = CharIntDict()
        for x in str.characters {
            if let y = dict[x] {
                dict[x] = y + 1
            } else {
                dict[x] = 1
            }
        }
        dicts.append(dict);
    }
    
    var secondDict = dicts.last!
    for key in dicts.first!.keys {
        if let secondDictKey = secondDict[key], secondDictKey > dicts.first![key]! {
            return "false"
        }
    }
    return "true"
}

var testCases = [("heloooolwrdlla", "helloworld"), ("coodrebtqqkye", "coderbyte"), ("win33er", "niwner"),
                ("yelowrqwedlk", "yellowred"), ("lettrrkakaeaaaqq", "letter")]

for testCase in testCases {
    print(StringScramble(testCase.0, testCase.1))
}
