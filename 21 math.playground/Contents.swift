//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

********************  Вычисляемые свойства

class Rectangular {
    let height: Int
    let widht: Int
    let depth: Int

    var volume: Int {
        return height * widht * depth
    }

    init(height: Int, widht: Int, depth: Int){
        self.height = height
        self.widht = widht
        self.depth = depth
    }
}

let rect = Rectangular(height: 10, widht: 25, depth: 20)

rect.volume

class Person{
    var name: String
    var secondName: String

    var fullName : String {
        get{
            return name + " " + secondName
        }
        set(anotherNewValue){
            let array = anotherNewValue.components(separatedBy: " ")
            name = array[0]
            secondName = array[1]
        }
    }
    init(name: String, secondName: String){
        self.name = name
        self.secondName = secondName
    }
}

let person = Person(name: "Victor", secondName: "Korneev")
person.fullName

person.name
person.secondName
person.fullName = "Ivan Ivanov"
person.name
person.secondName

 ******** Свойства классов


class Car{
    let products: Int
    let people: Int
    let pets: Int
    let selfWeight = 1500
    let maxWeight = 2000

    var totalWeight: Int{
        return products + people + pets + selfWeight
    }
    init(products: Int, people: Int, pets: Int){
        self.products = products
        self.people = people
        self.pets = pets
    }
}

let car = Car(products: 30, people: 300, pets: 50)
car.totalWeight


func bigDataProcessingFunc() -> String {
    return "very long process"
}

class Processing {
    let smallDataProcessing = "small data processing"
    let averageDataProcessing = "average data processing"
    lazy var bigDataProcessing = bigDataProcessingFunc()
}

let process = Processing()
process.bigDataProcessing
process
