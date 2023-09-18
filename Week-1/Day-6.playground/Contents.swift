//Optional unwrapping
//-------
//IF - LET
//--------
//execute some code only if there is a value
//doesnot exit the current scope
//if vitra ko value bahira access garna mildaina

func optionalCheck (value: Int?){
    if let number = value {
        print("There is some value and it is \(number)")
    } else {
        print("there is no value")
    }
    
}
optionalCheck(value: 50)

//GUARD - LET
//ensure there is value before proceeding with the rest of the code
//exits current scope if optional value is NIL
//yo chai function sanga combine garera use garnincha mostly and NIL cha vane function bata exit garcha
//yesko vitra ko value access garna milcha baira

func optionalCheck1 (value: Int?) {
    guard let number = value else {
        print("there is no value")
        return
    }
    print("The value is \(number)")
}
optionalCheck1(value: 20)


//Force Unwrap
//DONOT USE THIS!
var testForce: Int?
testForce = 60
var stR = testForce!

//--------------------------------------
//Optional Chaining

struct Person {
    var name: String
    var address: Address?
}

struct Address {
    var city: String
    var province: String
    var zipCode: Int?
}
let address = Address(city: "zz", province: "zz1", zipCode: 54)
let partha = Person(name: "Partha", address: address)

let zipcode = partha.address?.zipCode
if let code = zipcode {
    print("value cha \(code)")
} else {
    print("value dinu paryo, khali vayo ")
}
//func checkVal () {
    guard let code = zipcode else {
        print("khali")
        fatalError()
    }
print("value cha \(code)")


//Protocol in swift
// if we need common functionality in class we use protocols
//try to use loose coupled protocol rather than tight coupling (bounded to single entity)
//they can be inherited {good practice}

protocol Engine {
    func start()
    func stop()
}
protocol Safety {
    func releaseAirBag()
}
protocol Car: Engine,Safety {
    func applyBreak()
    func horn()

}
class Lambo: Car {
    func stop() {
        print("lambo stopped")
    }
    
    func releaseAirBag() {
        print("lambo airbags released")
    }
    
    func start() {
        print("lambo started")
    }
    
    func applyBreak() {
        print("lambo applied breaks")
    }
    
    func horn() {
        print("Zoom")
    }
}
    
class Ferrari: Car {
    func stop() {
        print("ferrari stopped")
    }
    
    func releaseAirBag() {
        print("ferrari airbags released")
    }
    
    func start() {
            print("ferrari started")
        }
        
    func applyBreak() {
            print("ferrari applied brakes")
        }
        
    func horn() {
            print("Frrrr")
        }
         
        
    }

class Person1 {
    func driveCar(car: Car) {
         car.start()
    }
}
    
let hurricaneLambo = Lambo()
let f1Ferrari = Ferrari()
//hurricaneLambo.applyBreak()
//hurricaneLambo.start()
//f1Ferrari.horn()
 
let partha1 = Person1()
partha1.driveCar(car: f1Ferrari)


//Failable initilizers
//if we need conditions met before object initilization

struct Vehicle {
    var name: String
    var age: Int
    
    init?(name: String, age: Int) {
        guard age < 0 else {
            return nil
        }
        self.name = name
        self.age = age
    }
}
let car1 = Vehicle(name: "Lambo", age: 0)
if let car1 = car1 {
    print(car1.age)
} else {
    print("input age greater than 0")
}   


