func passArray (arr: [Int?]) -> Int? {
    var sum: Int = 0
        for value in arr {
            if let val = value {
                sum += val
            }
        }
    return sum
}

//ARRAY
//------------------------------------------------
//protocol Reverse{
//    func reverseString(arr: [String]) -> [String]
//    func reverseInt(arr: [Int]) -> [Int]

func genArr <T>(arr: [T]) -> [T] {
    return arr.reversed()
    }

genArr(arr: [1,2,3,4,5])

//-------------------------------------------------------------------------------

func getArr <T:Numeric>(arr1: [T], arr2: [T]) -> [T] {
    var newArr: [T] = []
        for value in arr1 {
            for value2 in arr2 {
                if (newArr.contains(value) || (newArr.contains(value2))) {
                    continue
                } else {
                    newArr.append(value)
                    newArr.append(value2)
            }
        }
    }
    return newArr
}

getArr(arr1: [1,2,3,4], arr2: [5,6,7,8])

//-----------------------------------------------------------------------------------

func returnDict <T: Hashable>(arr: [T]) -> [T:Int] {
    var dict: [T:Int] = [:]
    for value in arr {
        var count: Int = 0
        for value2 in arr {
            if value == value2 {
                count = count + 1
                dict[value] = count
            }
        }
    }
    return dict
}

returnDict(arr: [1,2,1,1,2,2,1])

//--------------------------------------------------------------------------------------

//EXTENSIONS
import UIKit
extension String {
    func countLength() -> Int {
        let trimmedString = self.replacingOccurrences(of: "^\\s+|\\s+|\\s+$", with: "", options: .regularExpression)
        return trimmedString.count
    }
}
var strString: String = "P ar th a "
strString.countLength()

//-----------------------------------------------------------------------------------------------------------------------


extension Int {
    func calcFactorial() -> Int {
        var fact: Int = 1
        for i in 1...self {
            fact = fact * i
        }
        return fact
    }
}

var newInt: Int = 5
newInt.calcFactorial()

//-----------------------------------------------------

extension Double {
    func calcPercentage() -> String {
        let percentage = self * 100
        return String(format: "%.2f%%", percentage)
    }
}

var newDouble: Double = 5.20

//------------------------------------------------------
//Classes, structs, enums, and properties:

class Person {
    var name: String
    var age: Int
    var gender: String
    
    init(name: String,age: Int, gender: String) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    func dispProperties () {
        print(name,age,gender)
    }
}
var instance1 = Person(name: "Partha", age: 50, gender: "Male")
instance1.dispProperties()
//---------------------------------------------------------

struct Rectangle {
    var width: Int
    var height: Int
    var area: Int {
        get {
            return width * height
        }
    }
    func disp(){
        print(area)
    }
}

var rect1 = Rectangle(width: 5, height: 6)
rect1.disp()

//---------------------------------------------------------

enum Direction {
    case north,south,east,west
}

var dir: Direction = .east
print(dir)

//=========================================================
//SET - 2 QUESTIONS

//Define a class called `Vehicle` with properties for speed, direction, and color. Define a subclass called `Car` that has a make and a model

class Vehicle {
    var speed: Int
    var direction: String
    var color: String
    
    init(speed: Int, direction: String, color: String) {
        self.speed = speed
        self.direction = direction
        self.color = color
    }
}
class Car: Vehicle {
    var make: String
    var model: String
    
    init(speed: Int, direction: String, color: String, make: String, model: String) {
        self.make = make
        self.model = model
        super.init(speed: speed, direction: direction, color: color)
    }
}

var car1 = Car(speed: 50, direction: "East", color: "Red", make: "Something", model: "F1")

//-----------------------------------------------------------------------------------------------------
////1. Define a protocol called `Serializable` that requires an implementation of a `serialize()` method that returns a string. Implement the protocol in a //class// //called `Person` that has a name and an age, and write a function that takes an array of `Serializable` objects and returns a concatenated string //of their //serialized values.

protocol Serializable {
    func serialize() -> String
}

class Person1: Serializable {
    
    func serialize() -> String {
        return "\(name),\(age)"
    }
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

func getObjects(object: [Serializable]) -> String {
    var concatedValue: String = ""
    for value in object {
        concatedValue = concatedValue + value.serialize()
    }
    return concatedValue
}

let person1 = Person1(name: "Alice", age: 30)
let person2 = Person1(name: "Bob", age: 40)
let object: [Serializable] = [person1, person2]
let serialized = getObjects(object: object)
print(serialized)

//---------------------------------------------------------------
//2. Define a protocol called `Comparable` that requires an implementation of a `compare()` method that takes another object of the same type and returns a //Boolean value. Implement the protocol in a class called `Person` that has a name and an age, and write a function that takes an array of `Comparable` //objects and returns the object with the smallest age.

protocol Comparable {
    func compare(object: Person3) -> Bool
}
class Person3: Comparable {
    func compare(object: Person3) -> Bool {
        return self.age > object.age
    }

    var name: String
    var age: Int

    init(name: String , age: Int){
        self.name = name
        self.age = age
    }

}

func takeArray(obj: [Person3]) {
    var maxAge: Int = 0
    var maxAgePerson: Person3? = nil
    for person in obj {
        if person.age > maxAge {
            maxAge = person.age
            maxAgePerson = person
        }
    }
    if let maxAgePerson = maxAgePerson {
        print("The person with the maximum age is \(maxAgePerson.name), who is \(maxAge) years old.")
    } else {
        print("The array is empty.")
    }
}

var personObj1 = Person3(name: "Partha", age: 40)
var personObj2 = Person3(name: "Chem", age: 29)
var strObjAsArr: [Person3] = [personObj1,personObj2]
//strObjAsArr.compare()
takeArray(obj: strObjAsArr)

//Extend the `Int` class with a method that returns a Boolean value indicating whether the integer is a prime number.

extension Int {
    func checkPrime() -> Bool {
        var flag: Bool = false
        if self == 1 {
            flag = false
        }
        else if self > 1 {
            for i in 2...self {
                if (self % i) == 0 {
                    flag = true
                    break
                }
            }
        }
    return flag
    }
}

var testNum: Int = 4
testNum.checkPrime()
