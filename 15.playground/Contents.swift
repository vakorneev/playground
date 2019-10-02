//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//let one = 1
//let two = 2
//let three = 3
//
//(one, two, three)
//
//let boy = (5, "Sergey")
//boy.0
//boy.1
//
//let (first, second, third) = (1, 2, 3)
//first
//third
//
//let greenPencil = (color: "green", length: 20, weight: 4)
//greenPencil.length
//let (greenColor, greenLength, greenWeight) = greenPencil
//
//let agesAndNames = ["Misha": 10, "Vitya": 24, "Kostya": 56]
//var age = 0
//var name = ""
//
//for (nameId, ageId) in agesAndNames {
//    if age < ageId {
//        age = ageId
//        name = nameId
//    }
//}
//age
//name
//
//var fuel: Int?
//fuel = 20
////print("\(fuel!) liters left") - ! выключавет надпись optionsl!!
//fuel = nil
//
//if let availableFuel = fuel {
//    print("\(availableFuel) liters left")
//} else {
//    print("no fuel data avaliable")
//}
//
//func checkFuel(){
//    guard let availableFuel = fuel else{
//        print("no fuel available")
//        return
//    }
//   print("\(availableFuel) liters left")
//}
//checkFuel()

//class Human {
//    var name = "Ivan"
//    var age: Int? = 30
//    var hairs = true
//
//    func description () -> String {
//        if let humanAge = age {
//            return "Hello, may name is \(name) and I'm \(humanAge) years old"
//        }else{
//            return "Hello, may name is \(name)"
//        }
//    }
//
//    init() {
//        name = "Ivan"
//        hairs = true
//
//    }
//    init(name: String, age: Int?, hair: Bool){
//        self.name = name
//        self.age = age
//        self.hairs = true
//
//    }
//
//}
//
//let human = Human()
//human.age
//human.name
//human.hairs
//let human1 = Human(name: "Vitya", age: 24, hair: false)
//human1.age
//

//********************************** Наследование

class Human {
    var name: String
    var hairs = Bool()
    var age = Int()
    
    func tellAboutMe() -> String {
            return "Hello! may name is \(name)!"
        }
    init(name: String, hairs: Bool, age: Int) {
    self.name = name
    self.hairs = hairs
    self.age = age
        
    }
}

class Child: Human {
    var toy = "Spider-Man"
    override func tellAboutMe() -> String {
        let originalText = super.tellAboutMe()
        return originalText + " And I have a toy \(self.toy), I'm \(self.age) years old. I have hairs, it's \(self.hairs)"
    }
    init(toy: String, name: String, hairs: Bool, age: Int){
        self.toy = toy
        super.init(name: name, hairs: hairs, age: age)
    }
}

let child = Child(toy: "Psp", name: "Vitya",hairs: true, age: 24)
child.tellAboutMe()
child.toy

let child1 = Child(toy: "gameboy", name: "danya", hairs: true, age: 23)
child1.tellAboutMe()
