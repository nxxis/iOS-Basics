//GENERICS
//Here Numeric, Equatable are protocols

func sumGenric <T: Numeric>(a: T, b: T) -> T {
    return a + b
}

sumGenric(a: 5.5, b: 6.00102)

func compGeneric <T: Equatable> (x: T, y: T) {
    if x == y {
        print("equal")
    }
    else {
        print("not equal")
    }
}

compGeneric(x: "Hi", y: "Hi")
compGeneric(x: 5, y: 6)


//We can create new objects if we need to work on different data type using same generic function


class Math <T> {
    func testGene<T>(a: inout T , b: inout T) {
        let t = a
        a = b
        b = t
    }
}
var num1 = 5
var num2 = 6

var str1 = "Partha"
var str2 = "Moon"

print("value before swap num1: \(num1) and num2: \(num2)")
print("value before swap str1: \(str1) and str2: \(str2)")

var intObj = Math<Int>()
intObj.testGene(a: &num1, b: &num2)

var strObj = Math<String>()
strObj.testGene(a: &str1, b: &str2)

print("value after swap num1: \(num1) and num2: \(num2)")
print("value after swap str1: \(str1) and str2: \(str2)")

//Extensions

extension Float {
    func cnvt2F () -> Float {
        return ((self * 1.80) + 32)
    }
    
    func cnvt2C () -> Float {
        return ((self - 32) / 1.80)
    }
}

var degreeC: Float = 37
var degreeF: Float = 98.6

print("\(degreeC) degree celcius is \(degreeC.cnvt2F()) in fahrenheit")

print("\(degreeF) degree celcius is \(degreeF.cnvt2C()) in fahrenheit")

//Property Wrapper
// it maybe class or struct
// it uses wrappedValue and init

@propertyWrapper
struct validateString {
    var inputString: String = ""  // yo kina initilize gareko vane tala value pass garda hamplai wrapped value ma check garnu cha ra valid vaye matra yesma store garni vayera init ma narakheko
    
    init (wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
    var wrappedValue: String {
        get {
            return inputString
            }
        set {
            if (newValue.count > 15 || newValue.count < 5) {
                print("give a valid name")
            }
            else {
                inputString = newValue
            }
        }
    }
}

struct getInput {
    @validateString var name: String
}
var person = getInput(name: "4564725")


//--------------------------------------------------------------------------------------------
//PROPERTY WRAPPER WITH ERROR HANDLING, PROPERTY OBSERVER AND COMPUTED PROPERTY (GET - SET)
//--------------------------------------------------------------------------------------------


enum inputError: Error {
    case invalidName (nameRequirement: String)
    case invalidAge (ageRequirement: String)
}

@propertyWrapper
struct ValidateAge {
    var age: Int = 10 {
        didSet {
            notifyUserAfter()
        }
        willSet {
            notifyUserBefore()
        }
    }
    init (wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }
    var wrappedValue: Int {
        get {
            return age
        }
        set {
            do {
                try checkAge (age: newValue)
                age = newValue
            }
            catch inputError.invalidAge(let ageReq) {
                print("Error Occured!: \(ageReq)")
            }
            catch {
                print("Error Occured")
            }
        }
    }
    
    func notifyUserAfter() {
        print("There have been some modifications done in your age; the new age is: \(age)")
    }
    func notifyUserBefore() {
        print("Modification Trigerred; age before modification: \(age)")
    }
    
    func checkAge (age: Int) throws {
        if (age <= 0) {
            throw inputError.invalidAge(ageRequirement: "Age can not be less or equal to zero ")
        }
        else if (age >= 125) {
            throw inputError.invalidAge(ageRequirement: "Are you immortal? Age is above 124 yrs? lol!!")
        }
    }
}



@propertyWrapper
struct ValidateName {     //Property Observer
    var name: String = "Sudip" {
        didSet {
            notifyUserAfter()
        }
        willSet {
            notifyUserBefore()
        }
    }
    init (wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
    var wrappedValue: String {
        get {
            return name
        }
        set {
            do {
                try checkString (name: newValue)
                name = newValue
            }
            catch inputError.invalidName(let nameReq) {
                print("Error Occured!: \(nameReq)")
            }
            catch {
                print("Error Occured")
            }
        }
    }
    
    func notifyUserAfter() {
        print("There have been some modifications done in your name; the new name is \(name)")
    }
    func notifyUserBefore() {
        print("Modification Trigerred; name before modification: \(name)")
    }
    
    func checkString (name: String) throws {
        if (name.count < 5) {
            throw inputError.invalidName(nameRequirement: "Minimum characters required is 5")
        }
        else if (name.count > 15) {
            throw inputError.invalidName(nameRequirement: "Maximum 15 character supported")
        }
    }
}


struct getInput1 {
    @ValidateName var name: String
    @ValidateAge var age: Int
}

var person2 = getInput1(name: "Partha", age: 120)

//QUESTIONS-------------------------------------------------------
//DICTIONARY
func dictWithMax (dict: [String:Int]) -> Int {
    var strMaxVal: Int = 0
    for (_,value) in dict {
        for valuees in dict.values {
            if valuees > value {
                 strMaxVal = valuees
            }
        }
    }
    
    return strMaxVal
}
print("maximum value for given dictionary is: \(dictWithMax(dict: ["Partha" : 5, "Sudip" : 6, "Chem" : 10]))")


//----------------------------------------------------------------------------
func twoDict (dict1: [String:Int], dict2: [String:Int]) -> [String:Int] {
    var newDict: [String:Int] = [:]
    for (key1,value1) in dict1 {
        for (key2,value2) in dict2 {
            if (key1 == key2) {
                newDict[key1] = value1 + value2
            }
        }
    }
    return newDict
}

print("\(twoDict(dict1: ["Partha" : 5, "Sudip" : 6, "Chem" : 10], dict2: ["Partha" : 10, "Sudip1" : 1, "Chem" : 3]))")


//-------------------------------------------------------------------------------

func nilDict (dict1: [String:Int?]) -> [String:Int?] {
    var newDict: [String:Int?] = [:]
    for (key,value) in dict1 {
        if let value = value {
            newDict[key] = value
        } else {
            continue
        }
    }
    return newDict
}

nilDict(dict1: ["Partha":6, "Sudip": nil])

//-------------------------------------------------------------------------------
//OPTIONALS

func takeOptinalInt (int1: Int?) -> String {
    if let value = int1 {
        if (value % 2 == 0) {
            return "Even"
        }
        else {
            return "Odd"
        }
    }
    return "Unknown"
}
print(takeOptinalInt(int1: nil))

//-------------------------------------------------------------------------------

func countStringLength (str: String?) -> Int? {
    if let value = str {
        return value.count
    }
    else {
        return nil
    }
}
var strVal = countStringLength(str: nil)

//-------------------------------------------------------------------------------

func nilArr (arr: [Int]?) -> Int? {
    var sum: Int = 0
    if let value = arr {
        for arrVal in value {
            sum = arrVal + arrVal
        }
    }
    return sum
}
var arrPass = nilArr(arr: [1,2,3,4])


//-----------------------------------------------------------------------------
//PROTOCOLS

protocol Drawable {
    func draw()
}
class Circle: Drawable {
    func draw() {
        print("simple protocol implemented")
    }
}

var newObj = Circle()
newObj.draw()

//-----------------------------------------------------------------------------

protocol Sortable {
    func sort()
}
class Person: Sortable {
    func sort() {
        print(age,name)
    }
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var personObj = Person(name: "Partha", age: 23)
personObj.sort()

//------------------------------------------------------------------------------

protocol Movable {
    func move()
}
class Car: Movable {
    func move() {
        print(speed,colour)
    }
    var speed: Int
    var colour: String
    
    init(speed: Int, colour: String) {
        self.colour = colour
        self.speed = speed
    }
}

var carObj = Car(speed: 50, colour: "Red")
carObj.move()
