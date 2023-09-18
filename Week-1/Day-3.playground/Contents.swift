//Class and struct revision
struct Partha{
    var name: String
    var company: String
}
class ParthaClass{
    //var pc = Partha()
    var age = 23
    var height = "5feet"
    
    func displayItems(){
        print(age)
    }
}
let p1 = Partha(name: "Pranjal",company: "Cedar Gate")
let pc1 = ParthaClass()

//print("\(pc1.pc.name)")
print("\(pc1.height)")
pc1.displayItems()


let pc2 = ParthaClass()
pc2.age = 25
pc2.height = "6feet"

print(pc2.age,pc2.height)

class Animal{
    var name: String
    var type: String
    
    init(name: String, type: String){
        self.name = name
        self.type = type
    }
    func dispValue(){
        print(name,type)
    }

}
var dog = Animal(name: "Dog", type: "Domestic")
dog.dispValue()

//Note: Structures and Enumerations Are Value Types
//A value type is a type whose value is copied when it’s assigned to a variable or constant, or when it’s passed to a function i.e pass by value (value gets copied when passed around)
// all the premitive types i.e Int, Double, Array are value typed



enum compassDirections: String, CaseIterable { //raw values in enum
    //case east,west,north,south
    case east = "testing rawValues in enum for east"
    case west = "testing rawValues in enum for west"
    case north = "testing rawValues in enum for north"
    case south = "testing rawValues in enum for south"
}
print(compassDirections.allCases.count)

//enum can be itirated
for cases in compassDirections.allCases {
    print(cases.rawValue)
}



var storeValue = compassDirections.east
storeValue = .north

switch storeValue {
case .east:
    print("it is east")
case .west:
    print("it is west")
case .north:
    print("it is north")
case .south:
    print("it is south")
}

func checkEnumValues(value: compassDirections) {
    print(value.rawValue)
} 

//----------------------------------
if storeValue == .east{
    print("working")
}

checkEnumValues(value: .east)

enum Normal {
    case one
    case two, three
}

let normalOne = Normal.one
if case .one = normalOne {
    print("A normal one") //prints "A normal one"
}

//---------------------------

//Associated Values
enum socialMedia {
    case youtube(subscribers: Int)
    case instagram(followers: Int)
    case facebook
}

func checkValues(value: socialMedia) {
    switch value {
    case .youtube(let subscribers) where subscribers > 10_000:
        print("eligible")
    case .instagram(let followers) where followers > 15_000:
        print("eligible")
    case .facebook, .youtube , .instagram:
        print("not eligible")
    }
}
checkValues(value: .instagram(followers: 12000))


//Inheritance

class Vechile {
    var name: String = ""
    var model: String = ""
    var type: String = ""
    
    func soundNoise() {
        print("")
    }
}
class Ferrari: Vechile {
        override func soundNoise() {
            print("zoooom")
        }
    }
var obj1 = Ferrari()
    obj1.soundNoise()
 
class F1: Ferrari {
    override func soundNoise() {
        print("Woohooo")
    }
}

var obj2 = F1()
obj2.soundNoise()


//Optionals
 
struct User {
    let name: String
    let age: Int?
}
//unrapping optionals using [If Let] (Not Preferred if there is conditions)
let user = User(name: "Partha", age: 60)
if let x = user.age {
    print("User's age is \(x)") }
    else {
        print("Please enter your age")
    }

//Guard Let
func check(age: Int?) {
    guard let age = age else {
        return
    }
    if age > 40{
        print("You are old ")
    }
}

check(age: user.age)
 
//NIL
let age1 = user.age ?? 0

//Force [Bad way since it will crash if there is NIL]

let age2 = user.age!
print(age2)

// Optional Chaining

var optionalChaining: User?
let name1 = optionalChaining?.name ?? "No name given "


// Closure
//Basic syntax

var addNumbers:(Int,Int) -> Int = {
    (num1,num2) in
//can have multiple logics/codes
    return num1 + num2
}
print(addNumbers(1,2))

var addNumbers1:(Int,Int) -> Int = {
    return $0 + $1  //Bad practice
}
print(addNumbers1(3,5))

//Typealias
//use if we need to reuse for many times

typealias addNumClosure = (Int,Int) -> Int
let addUsingTypeAliasClosure: addNumClosure = {
    (n1,n2) in
    return n1 + n2
}
print(addUsingTypeAliasClosure(9,6))

//Function call sequence without using closure

func printMsg(boolInput: Bool, msg: String) {
    if boolInput {
        print(msg)
    }
}
printMsg(boolInput: true, msg: asgMsg(name: "Hello"))
printMsg(boolInput: false, msg: asgMsg(name: "Bye"))

func asgMsg(name: String) -> String {
    print("asgMsg is called")
    return name
}
  
