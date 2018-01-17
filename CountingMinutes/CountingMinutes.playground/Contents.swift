import Foundation

/*
 Using the Swift language, have the function CountingMinutes(str) take the str parameter being passed which will be two times (each properly formatted with a colon and am or pm) separated by a hyphen and
 
 1. return the total number of minutes between the two times.
 
 The time will be in a 12 hour clock format. For example: if str is 9:00am-10:00am then the output should be 60. If str is 1:00pm-11:00am the output should be 1320.
 
 */

func CountingMinutes(_ str: String) -> Int {
    var strTimes = str.split(separator: "-").map({String($0)})
    var times = [Int]()
    for x in 0..<strTimes.count {
        var strTime =  NSString(string: strTimes[x])
        let colonIdx = strTime.length > 6 ? 2 : 1
        var hours = Int(String(strTime.substring(to: colonIdx)))!
        var minutes = Int(String(strTime.substring(with: NSRange(location: colonIdx + 1, length: 2))))!
        
        var meridian = strTime.substring(from: strTime.length - 2)
        if meridian == "pm"  {
            hours += hours == 12 ? 0 : 12
        } else {
            hours = hours % 12
        }
        
        minutes = minutes + (hours * 60)
        times.append(minutes)
    }
    
    if times[1] < times[0] {
        times[1] = times[1] + (60 * 24)
    }
    var outVal = times[1] - times[0]
    return Int(outVal)
}


for testCase in ["10:00am-10:00pm", "1:00pm-11:00am", "12:30pm-12:00am", "2:30pm-12:00am", "2:30pm-6:30pm"] {
    print(CountingMinutes(testCase))
}
