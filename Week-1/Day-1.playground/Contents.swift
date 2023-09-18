//variable declaration
var marksScored: Int = 0
var isPassed: Bool = true
var percentageScored: Double = 0.94
//swift is weak typed language i.e we dont need to define variable type explicitly

//let is used to define constants i.e immutable
let myName = "Sudip Sharma"


//myName="Partha" not possible since it is a constant

marksScored = 50
print(marksScored)

//once the "variable" is declared we dont need to specify it everytime i.e a constant or a variable or type
isPassed = false
print(isPassed)

//array
//is in the order and can be changed i.e mutable

var newArray = [12,56,23,89]
//we can not define empty array without explicitly mentioning its type

var arraySecond: [Int] = []

newArray.count
newArray.first
newArray.last
newArray[2]

//? means it will get error if the array is empty, so we use optional

newArray.append(56)
print(newArray)

//if we want to insert an element in a particular postition then we use insert

newArray.insert(23, at: 3)
print(newArray)
//sort in ascending order
newArray.sort()
//sort in descending order
newArray.reversed()
//suffles the array
newArray.shuffle()

//set is unordered i.e order gets random everytime we print and can not have duplicate values and is good in performance than array

//new SET is declared as follow

var newSet: Set<Int> = [1,2,9,8,5,4]

//we can also make existing array to SET as;
//it automatically removes duplicate elements from the given array

var newArray1 = Set(newArray)
print(newSet)
print(newArray1)

//SET uses hashing and directly points to the particular element which is faster (Comstant time even though the set is large) than array since array checks for every element

newSet.contains(5)
newSet.insert(56)
print(newSet)

//Extras
var x:Int = 0, y: Double = 6.0; print(x,y)

var nSting: String
nSting = "Partha"
print(nSting)

var c,d,e,f: String
//c = 10 not possible

var `var` = 15 //keyword can be used as variable name

var parthaPrint: String = "Partha"
var welCome: String = "Hi!, My name is \(parthaPrint)"    //Stirng Interpolation
print(welCome)

var ran: Int = 5
var dRan: Double = 7.6
var sum = Double(ran) + dRan
print(sum)

let parthaIsHancy = true
let parthaIsCute = false

if parthaIsHancy {
    print("He is Handsome")
}
else {
    print("He is cute")
}
if parthaIsCute {
    print("It is True")
}
else {
    print("It is False")
    }

//Tuple and its decomposition

let msgPrompt = (404,"Not Found")
let (statusCode,codeMeaning) = msgPrompt
let (statusCodes,_) = msgPrompt
print(statusCode)
print(codeMeaning)

let numS: [Int] = [1,2,3,4,5]
print(numS)
print(msgPrompt.0)
print(msgPrompt.1)
print("the number is \(msgPrompt.0)")

let parthaMesg = (codes: 404, msg: "Partha not found")
print(parthaMesg.codes)
print("\(parthaMesg.codes) \(parthaMesg.msg)")

let aNum = "Partha"
let cvt = Int(aNum)

let pNum = "504"
let rNum = Int(pNum)


let devices: [String:String] = ["Phone": "iPhone 11 Pro Max",
                                "Desktop": "Mac mini",
                                "Laptop": "Dell Inspiron 7577",
]
devices["Phone"]


//functions

func happyMe(name: String)
{
    print(name)
    
}

happyMe(name: "Partha")


func addNumber(firstNumber: Int, secondNumber: Int) -> Int
{
    
    return firstNumber + secondNumber
}

addNumber(firstNumber: 5, secondNumber: 6)


(1,"apple")>(2,"apple")
 (3,"Partha")==(3,"Partha")

var parth1 = 101
var parth2 = true
var parth3 = parth1 + (parth2 ? 10 : 30)

func sayHello(name: String?){
    if name != nil{
        print("Hello\(name!)")}
        else{
            print("Pass the value")
        }
}
sayHello(name: "Partha")
sayHello(name: "")
sayHello(name: nil)


let names = ["Anna", "Alex", "Brian", "Jack"]
for i in names {
    print("Hello, \(i)")
}

let lst = ["Partha":"EB Pearls","Pranjal":"Cedar Gate","Sudip":"Docsumo"]
for (i,j) in lst{
    print("\(i) works in \(j)")
}


struct Car {
    
    // MARK: - Properties
    var name: String
    var type: String
    var model: String
    var isFav: Bool
    
    
}
var cars: [Car] = [Car(name: "Ferrari", type: "Sports", model: "F1", isFav: true),
    Car(name: "Lambo", type: "Sports", model: "Ruvelto", isFav: true)
]

