import Foundation
// String型で取ってきたモノを分割してmapでIntにキャストしつつ返却
var intAry : [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
// sortは破壊的
intAry.sort { $0 > $1 }
let top2nums = intAry[0..<2]
intAry.sort { $0 < $1 }
let under2nums = intAry[0..<2]
// これで一発
let answer : Int = Int(String(top2nums[0]) + String(under2nums[0]))! + Int(String(top2nums[1]) + String(under2nums[1]))!

print(answer)
