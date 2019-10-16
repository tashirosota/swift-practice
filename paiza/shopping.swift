import Foundation 

enum Item : Int {
    case food = 5
    case book = 3
    case clothing = 2
    case other = 1
}

func itemName(_ number : Int) -> Item {
    let itemValue : Item
    switch number {
    case 0:
      itemValue = .food
    case 1:
      itemValue = .book
    case 2:
      itemValue = .clothing
    case 3:
      itemValue = .other
    default: 
      itemValue = .food
    }
    return itemValue
}

let times = Int(readLine()!)!
var sumPoint : Int = 0
var sumItemPrices : [Item: Int] = [
  .food: 0,
  .book: 0,
  .clothing: 0,
  .other: 0
]

// https://qiita.com/makopy_inside/items/f9d61e5d3fabff8fab1d
// こいつは辞書型にまとめてから計算してやらないとダメ

for _ in 1...times {
    let inputs : [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let item = itemName(inputs[0])
    sumItemPrices[item] = sumItemPrices[item]! + inputs[1]
}

for sumItemPrice in sumItemPrices {
   sumPoint += sumItemPrice.value / 100 * sumItemPrice.key.rawValue
}

print(sumPoint)