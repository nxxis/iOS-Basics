//Revision
struct testStruct {
    var name: String
    var age: Int
    mutating func modifyName(name: String){
        self.name = name
        
    }
}
var obj = testStruct(name: "helloworld", age: 30)
obj.modifyName(name: "classic")
obj.modifyName(name: "classic2")
print(obj.name)


enum Partha{
    case Hency
    case Cutie
}

let st = Partha.Cutie
if st == .Cutie {
    print("it is working")
}

if case .Cutie = st {
    print("it is also working")
}

//Raw values in enum
enum Partha2: String {
    case Hency = "Partha is hency"
    case Cutie = "Partha is cutie"
}


var st1 = Partha2.Cutie
print(st1.rawValue)
if st1 == .Cutie{
    print("it is working")
}
var st2 = Partha2.Cutie
st2 = .Hency
switch st2{
case .Cutie:
    print("cutie")
case .Hency:
    print("Hency")
}


//Associated valued
enum SocialMedia {
    case facebook
    case instagram(followers: Int)
    case youtube(subscriber: Int)
}
func checkEligible(value: SocialMedia) {
    switch value {
    case .instagram(let followers):
        print("value is \(followers)")
    case .youtube(let subscriber):
        print("the value is \(subscriber)")
    case .facebook:
        print("it is facebook")
    }
}
checkEligible(value: .youtube(subscriber: 500))

//Function sequence without closure
func printValue(takesBool: Bool, takesString: String) {
    if takesBool {
        print(takesString)
    }
}
func takeInput(inputString: String) -> String {
    print("takeInput is called")
    return inputString
}
printValue(takesBool: false, takesString: takeInput(inputString: "partha"))
printValue(takesBool: false, takesString: takeInput(inputString: "ParthaC"))

//Closure
var newClosure: (Int,Int) -> Int = {
    (num1,num2) in
    return num1+num2
}
print(newClosure(1,5))

typealias storeIntype = (Int, Int) -> Int
var checkTypeAlias: storeIntype = { (n1, n2) in
    return n1 + n2
}
print(checkTypeAlias(5,6))
 
//using closure

func displayOutput(name: () -> String,boolValue: Bool) {
    if boolValue {
        print(name())
    }
}

func passValue(name: String) -> String {
    print("passValue is called")
    return name
}
//displayOutput(name: passValue(name: "test1"), boolValue: true) //here first passValue is called then only displayOutput is called
//displayOutput(name: passValue(name: "test2"), boolValue: false)

displayOutput(name:                        //here first passValue is called and then displayOutput is called
              { () -> String in passValue(name: "testClosure") }, boolValue: false)

//
func displayOutput1(boolValue: Bool, name: () -> String) {
    if boolValue {
        print(name())
    }
}

displayOutput1(boolValue: true) {
    passValue(name: "sudip")
}


displayOutput1(boolValue: true, name: {
    passValue(name: "sudip")
})



displayOutput(name: {
    passValue(name: "sudip")
}, boolValue: false)

//Auto Closure

func autoClosure(text:@autoclosure () -> String) {
    print("\(text())")
    
}

func testClosure(text: String) -> String {
    print("I'm in textClosure function")
    return text
}
autoClosure(text: testClosure(text: "EB Pearls"))

//More closure
//no return type

var name1 = {(name: String) in
    print("Hi you called a closure with \(name)")
}
name1("EB Pearls")

var name2: (Int, Int) -> Int = {
     $0 + $1
}
print(name2(5,6))

var name3: (String) -> String = { name in
    return name
}
name3("xyz")
