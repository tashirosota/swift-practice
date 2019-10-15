import Foundation

let inputAry : [String] = readLine()!.components(separatedBy: " ")
let number : Int  = Int(inputAry[0])!
let origin : [Character]  = Array(inputAry[1])
var target : [Character]  = Array(inputAry[2])
var times : Int = 0 
var answer : Int = 0 

while times < number {
  let firstValue : Character = target.removeFirst()
  target.append(firstValue)
  times += 1
  if target == origin {
      answer = times
  }
}

print(answer)
