//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let a = 3
let b = 1

if a==b {
 print("Ты Умница")
}else{
    print("Hello, World")
}

let isSunny = true
var action = ""

if isSunny{
    action = "I will go for a walk!"
} else {
 action = "I will sit at home"
}

action = isSunny ? "I will go for a walk" : "I will st at home"
// Одно и тоже, но первый вариант более читабельный
// ~= диапазон чисел

let nameAndFingers = ["Ivan": 20, "Vitalik": 18, "Danya": 2]

for (name, fingers) in nameAndFingers{
    print("Pyro name is \(name) and number of fingers \(fingers)")
}

let totalScore = 100
switch totalScore {
case 10:
    print("You are not jedi")
case 20:
    print("You're almost not jedi")
case 100:
    print("You're a jedi")
default:
    break
}

for i in stride(from: 0, through: 16, by: 2){
    print(i)
}

var timer = 5
print("Couting down")

repeat{
    print(timer)
    timer -= 1
}while timer > 0

print("START!")
