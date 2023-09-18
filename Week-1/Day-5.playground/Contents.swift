var newClosure = {(num1: Int, num2: Int) -> Int in
    (num1,num2)
    return num1 * num2
}
newClosure(1,2)


struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

struct Point1 {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint1 = Point1(x: 4.0, y: 5.0)
if somePoint1.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

class Student {
    var name: String
    var roll: Int
    var depart: String
    
    init(name: String, roll: Int, depart: String) {
        self.name = name
        self.roll = roll
        self.depart = depart
    }
    
    func modifyData(name: String, roll: Int, depart: String) {
        self.name = name
        self.roll = roll
        self.depart = depart
    }
}

var student1 = Student(name: "Partha", roll: 45, depart: "CS")
student1.modifyData(name: "Chinese", roll: 100, depart: "Trainee")
print(student1.depart)


struct Point3 {
    var x = 0.0, y = 0.0, z = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY, z: deltaX)
    }
}

var somePoint3 = Point3(x: 3, y: 3)
somePoint3.moveBy(x: 1, y: 1)
print(somePoint3.x, somePoint3.z)

//Instance Methods and Type Method

class Book {

    // MARK: - Properties

    let title: String
    let author: String

    // MARK: - Initialization

    init(title: String, author: String) {
        self.title = title
        self.author = author
    }

    // MARK: - Type Methods

    static func favorites() -> [Book] {
        [
            Book(title: "LOTR", author: "Tolkien")
        ]
    }

    class func moreFavorites() -> [Book] {
        [
            Book(title: "The Hobbit", author: "Tolkien")
        ]
    }

}

Book.favorites()
Book.moreFavorites()

//Note static method chai override garna mildaina so inheritance garda "class" lekhyo vane chai milcha for type method ani enum ra struct ma chai static nai use garna parcha. yedi sub class lai function override garna dina chaina vane chai static use garni.

//Properties======================================================================================================================

//Because rangeOfFourItems is declared as a constant (with the let keyword), it isn’t possible to change its firstValue property, even though firstValue is a variable property.

//This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties.

//The same isn’t true for classes, which are reference types. If you assign an instance of a reference type to a constant, you can still change that instance’s variable properties.

//Computed Property

struct Rectangle {
    var length: Double
    var area: Double {
        get {                        // returns what value within the variable
            return length * length
        }
        set(areaValue) {               // updates (i.e sets value) the value based on conditions or as specified
            length = areaValue/length
        }
    }
}

var calArea = Rectangle(length: 20)
print(calArea.area)
calArea.area = 50
print(calArea.length)

struct optionalTest {
    var age: Int?
    var name: String
}
var instStru = optionalTest(age: 65, name: "partha")
if let age = instStru.age {
    print("age is \(age)")
}
else {
    print("print provide your name")
}

func guardLet(age: Int?) {
    guard let age = age else {
        return
    }
        if age > 30 {
            print("you are old")
        }
    }

guardLet(age: instStru.age)

let age1 = instStru.age ?? 0 //assigning default value of optional to 0 to avoid NIL

let age2 = instStru.age!
print(age2)


var optChain: optionalTest?
var name1 = optChain?.name ?? "Please Input Name"
print(name1)



