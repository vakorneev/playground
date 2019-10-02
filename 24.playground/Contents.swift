//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class SecretLabEmployee {

    var accessLevel = 0{
        willSet (newValue){
            print("new boss is about to come")
            print ("new access level is \(newValue)")
        }
        didSet{
            if accessLevel > 0 {
                accessToDB = true
            }else {
                accessToDB = false
            }
            print("new boss just come")
            print("last time I had access level \(oldValue)")
        }
    }

    var accessToDB = false
}

let employee = SecretLabEmployee()
employee.accessLevel
employee.accessToDB

employee.accessLevel = 1

//********* alias

typealias Meter = Int
let length: Meter = 50
let lenght1 = 30

let d: Meter = length + lenght1

typealias DoubleInteger = (Int, Int)
 let someConstant = (1,2)

typealias DictionaryType = [String: Int]
var dictionary: DictionaryType = [:]
dictionary["Car1"] = 123
dictionary
// *************** ENum

enum Movement: Int {
    case forward
    case backward
    case left
    case right
}

let movementDicrection = Movement.backward.rawValue

enum Device {
    case iPad(color: String), iPhone
    
    var year: Int {
        switch self{
        case .iPhone: return 2007
        case .iPad(let color) where color == "Black": return 2020
        case .iPad: return 2010
        }
    }
}

let yearOfProduction = Device.iPad(color: "Black").year
Device.iPhone.year

enum Character {
    enum Weapon: Int {
        case sword = 4
        case wand = 1
        
        var damage: Int {
            return rawValue * 10
        }
    }
    enum CharacterType {
        case mage
        case knight
    }
}

let cherWeapon = Character.Weapon.sword.damage

indirect enum Lunch{
    case salad
    case soup
    case meal (Lunch, Lunch)
}

let myLunch = Lunch.meal(.salad, .soup)
