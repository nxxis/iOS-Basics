//Tuple
var dSp = ("Hello","Partha")
var checkType: (String,String) = ("Test","Type")
var (greetD,nameD) = dSp
print(greetD)
print(dSp.0)

//We can do this way also
var dSp1 = (name: "Partha", greeting: "Hi")
print(dSp1.name)

print("Insane Revision \(dSp1.name)")

var strValue: Dictionary = ["Helllo": "World"]

//We can do this way also
var strValue1: [String:String] = ["Hello" : "World", "Hi" : "Swift"]
strValue1["Hello"]

//Function
//Practice question
func takeArray (arr1: [Int], arr2: [Int]) -> [Int] {
    var strNewAr: Array<Int> = []
    for i in arr1 {
        for j in arr2 {
            if (strNewAr.contains(i)) {
                continue
            }
            else if (i == j) {
                strNewAr.append(i)
            }
        }
    }
    return strNewAr
}

takeArray(arr1: [1,2,1,5,], arr2: [1,9,5,2,6])


enum Cities: String, CaseIterable {
    case Bharatpur = "Popular for Rhino"
    case Kathmandu = "Popular for toutist"
}

func enumDisp (cities: Cities) {
    switch cities {
    case .Bharatpur:
        print("you are in bharatpur that is \(Cities.Bharatpur.rawValue)")
    case .Kathmandu:
        print("you are in kathmandu that is \(Cities.Kathmandu.rawValue)")
    }
}
enumDisp(cities: .Kathmandu)

var caseIt = Cities.allCases.count
var checkVal = Cities.Kathmandu.rawValue
print(Cities.allCases.count)
for i in Cities.allCases {
    print(i.rawValue)
}

enum testAsVal {
    case name(String)
}

var pasVal = testAsVal.name("Partha")

let marksObt = 80
func calcGrade(grade: Int) {
    switch grade {
    case ..<40:
        print("You've failed! Study Hard")
    case 40..<60:
        print("Second Div")
    case 60..<80:
        print("First Div")
    case 80..<100:
        print("Distinction")
    default:
        print("error")
    }
}

calcGrade(grade: 80)

//Class

class Person {
    var name: String
    var address: String
    
    init(name: String, address: String){
        self.name = name
        self.address = address
    }
    
    func dispVal(){
        print(name + " " + "Lives In" + " " + address)
    }
}

let obj1 = Person(name: "Partha", address: "Hattiban")
obj1.dispVal()

class Student: Person {
    var school: String
    init(name: String, address: String, school: String) {
        self.school = school
        super.init(name: name, address: address)  //yedi base class ma pahilai initilize gareko cha like name = "name" testo bela super.init ma kei arguments lekhnu pardaina
    }
}
let student1 = Student(name: "Ching", address: "Kupandole", school: "St.xaviers")
print(student1.name)

var a: Int? = 5
if let a = a {
    print("value is there i.e \(a)")
}
else {
    print("give value")
}

func optionalUnwrap(value: Int?) {
    guard let value = value else {
        return
    }
    if value < 0 {
        print("please give value greater than 0")
    }
}

optionalUnwrap(value: -1)

//Struct
// as we know that struct is value type so it is immutable in nature hence we need to use "mutating" keyword if we need to modify property of struct
// since there is two "name" i.e one property of struct and other is in function.Hence, we are using self.name = name to replacing the "name" property of sturct with function "name"

struct mutateValue {
    var name: String
    mutating func modifyStructProperty (name: String) {
        self.name = name
    }
}
var obj2 = mutateValue(name: "Partha")
obj2.modifyStructProperty(name: "Sudip")
print(obj2.name)


struct  optionalStruct {
    func intIdentifier(BankBalance: Int? = nil){
        
        guard let BankBalance = BankBalance else {
            print("unknown")
            return
        }
        if BankBalance % 2 == 0 {
            print("EVen")
        }
        else{
            print("Odd")
        }
       
    }
    
}

var number = optionalStruct()
number.intIdentifier()
