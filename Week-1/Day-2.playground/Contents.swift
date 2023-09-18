/*About Swift
variables are initialized before use
array out-bouds are checked
integers are checked for overflow
optionals are handeled explicitly
error handling,memory manage automatically
overall swift has more compile time error than runtime error
*/

//Functions

func greet1(name: String) -> String{
    return "Hello!" + name + "!"
}
greet1(name: "Partha")

print(greet1(name: "Sudip"))

//String interpolation
// Print ma chai \() diyera value access garna milcha vane return or string declare garda simply variable name lekhda pani huncha

func sayHelloWorld() -> String{
     "Hello World"
}
print(sayHelloWorld())

//-------------------------------------------------
func greetAgain(p: String) -> String {
    return "Hello again, " + p + "!"
}
print(greetAgain(p: "Anna"))

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(p: person) //Here, the function greetAgain takes p argument as varible person
    } else {
        return greet(person: person,alreadyGreeted: false)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
//-------------------------------------------------

func test(name: String){
    print("HELLO \(name)")
}
test(name: "PARTHA")

//Multiple return values as tuple
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
minMax(array: [4,5,70,6,1,10,50])

//Variadic Parameters
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)

// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)

//inout parameters
//reference type convert garcha

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//------------------------------------------------------------------------------
//Define a variable called mathFunction, which has a type of ‘a function that takes two Int values, and returns an Int value.’ Set this new variable to refer to the function called addTwoInts.”

func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
//function parameter as parameter type
var mathFunction : (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")

//----------------------------------------------------------------------------------
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

//Loops
let nArray=["Partha","Sudip","Pranjal","Chemjong"]
for player in nArray where player == "Partha"{
    print(player)
}

for i in 0...24{
    print(i)
}

//Raw Value Enum

enum Animals: String{
    case Rhino = "Popular in Chitwan"
    case Monkey = "Popular in Kathmandu"
    case Tiger = "Popular in Bardiya"
}

//func aboutAnimals(on animal: Animals){ //Here on is label to make code readable and only used in function call
//    print(animal.rawValue)
//}
//aboutAnimals(animal: .Tiger)
 
func aboutAnimals(animal: Animals){
    switch animal {
    case .Monkey:
        print("Popular in KTM")
    case .Rhino:
        print("Popular in CTWN")
    case .Tiger:
        print("Popular in Bardiya")
    }
}
 
aboutAnimals(animal: .Tiger)


let scoreRank = 79
func determineGrade(score: Int){
    switch score {
    case 0:
        print("Study Hard")
    case 1..<40:
        print("Third Div")
    case 40..<60:
        print("Second Div")
    case 60..<80:
        print("First Div")
    case 80...100:
        print("Distinction")
    default:
        print("Error")
    }
}
determineGrade(score: scoreRank)
    
class Animal{
    var name: String
    var age: Int
    var type: String
    
    init(name:String, age: Int, type:String){
        self.name = name
        self.age = age
        self.type = type
    }
    func printValue(){
        print(name)
    }
    
}
let cat = Animal(name:"Dog", age:5, type: "Domestic")
cat.printValue()

