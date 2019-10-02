//: A UIKit based Playground for presenting user interface
 // Первый урок

import UIKit
import PlaygroundSupport

var str = "Hello, World"
let y = 10

for i in 0..<5{
    print("i равен: \(i)")
}

let label = UILabel (frame: CGRect(x: 0, y: 0, width: 100, height: 100))
label.backgroundColor = UIColor.red
label.text = str

label.layer.cornerRadius = 50
label.layer.masksToBounds = true

label

Второй урок

let x: Character = "q"
let y: String = "Russia Federation"
let z: Double = 1.00009 //15 знаков после запятой
let w: Float = 1.00002 //6 знаков после запятой
let i: Int = 123
let b: Bool = true //false

var a = 14

let defaultName = "Steve"
var name: String? = nil

let myName = name ?? defaultName

let g = false
let t = g ? 10 : 30

let temp = 10
let wind = 3

if temp >= 10 && wind <= 5 {
    print("!")
}

let bool1 = true
let bool2 = !bool1

let arrayOne = Array<Int>()
let arrayTwo = [Int]()
var arrayThree: [Int] = []
let arrayFour = [1, 2, 3, 4]
let arrayFive = [Int](repeating: 10, count: 6)

arrayThree += arrayFive
arrayThree
arrayThree[1...3] = [15]
arrayThree

arrayThree.count - 1
arrayThree.append(100)
arrayThree.insert(111, at: 1)
arrayThree.remove(at: 2)

let dictOne = Dictionary<String, String>()
let dictTwo = [String: String]()
let dictThree: [String: String] = [:]
var namesAges = ["Ivan": 25, "Vitya": 24, "Natasha": 23]
namesAges.count
namesAges.isEmpty
namesAges["Ivan"]
let deletedAge = namesAges.updateValue(36, forKey: "Vitya")
namesAges

let setOne: Set = [1, 2, 3, 4]
let setTwo: Set = [4, 3, 5, 6, 7, 8]

let allValueArray = setOne.union(setTwo).sorted() //Объединие и сортировка
let commonValuesSets = setOne.intersection(setTwo) //Ищет схожие данные в сете

let notRepeatedValuesArray = setOne.symmetricDifference(setTwo).sorted() // ищет не схожие данные
