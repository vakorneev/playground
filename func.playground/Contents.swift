//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

// 1. Простая функция, ничего не принимает и ничего не возвращает.

func sayHello() { // -> () - Для полной записи, но она не нужна или -> Void
  print("Hello")
}

sayHello()

// 2. Функция, принимающая один параметр

func oneParam(param: Int){
  var param = param
  param += 1
}

oneParam(param: 11)

// 3. Функция, не принимающая значений, но возвращает значение

func returnValue() -> Int{
  return 10
}
let a = returnValue()
a

// 4. Функция, принимающая несколько параметров и возвращающая значение

func giveMeYour(name: String, secondName: String) -> String{
  return "Your name is \(name) and your second name is \(secondName)"
}
giveMeYour(name: "Victor", secondName: "Korneev")

// 5. Функция, принимающая массив в качестве параметра и использующая функцию для работы

func calcMoneyIn(array: [Int]) -> Int {
  var sum = 0
  func sayMoney(){
    print(sum)
  }

  array.forEach {
    sum += $0
  }

  sayMoney()
  return sum
}

calcMoneyIn(array: [1, 2, 3, 4, 5])

// 6. Функция, которая принимает переменное число параметров

func findSum(ofIntegers integers: Int...) -> Int {
  var sum = 0
  integers.forEach {
    sum += $0
  }
  return sum
}

findSum(ofIntegers: 1,2,3,4,5,6)

// 7. Имена параметор функции

func sum(_: Int) -> Int {
  return 10
}

// 8. Функция в качетсве возвращаемого значения

func whatToDo(missed: Bool) -> ((Int) -> Int){
  func missCountUp(input: Int) -> Int {return input + 1}
  func missCountDown(input: Int) -> Int {return input - 1}

  return missed ? missCountUp : missCountDown
}

whatToDo(missed: true)
