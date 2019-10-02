//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let x = 3
let y = 4
let z = 5
print (x+y+z)

func getSum(a: Int, b: Int, c: Int ) -> Int{
        return a+b+c
}
getSum(a: x, b: y, c: z)

let n = 128
let str = "Это стока :\(n)"

print(str)


var r = 10
repeat {
    r+=1
    print (r)
} while r <= 34

for i in 0...15 {
    print(i)
}

var j = 10
while j <= 18 {
    j+=1
    print("This is shit \(j)")
}

let arrayOfStr:[String] = ["BMW","Ford","Nissan"]
arrayOfStr[1]

