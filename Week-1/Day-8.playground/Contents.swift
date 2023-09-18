//Property Wrapper
//Init private huncha yesma, so wee need to manually define init
//it is used in in authentication like while checking email validity, by making property wrapper to check the validity of email

@propertyWrapper
struct checkNumWrapper {
    var value: Int
    var wrappedValue: Int {
        get {
            return value
        }
        set {
            if newValue < 10 {
                print("give a value greater than 10")
            }
            else {
                value = newValue
            }
        }
    }
}

struct saveValue {
    @checkNumWrapper var number: Int
}

var obj1 = saveValue(number: checkNumWrapper(value: 5))
obj1.number = 5

//1. Write a function that takes an array of integers as an argument and returns the sum of all the even numbers in the array.

func sumArray(arr: [Int]) -> Int {
    var sum: Int = 0
    for value in arr {
        if value % 2 == 0 {
            sum += value
        }
    }
    print(sum)
    return sum
    
}
sumArray(arr: [5,2,6,4,8])

//2. Write a function that takes an array of strings as an argument and returns a new array with all the strings capitalized.

func capString (arr: [String]) -> [String] {
    var newArr: [String] = []
    for letter in arr {
        var newAr = letter.uppercased()
        newArr.append(newAr)
    }
    print(newArr)
    return newArr
}
capString(arr: ["Partha", "Hency", "Ho"])

//3. Write a function that takes two arrays of integers as arguments and returns a new array that contains the common elements of the two arrays.
// yesari garda mildaina kinaki dubai loop parallely gako cha ani 1st le 1st lai 2nd le 2nd lai check gareko cha.
func takeTwoArr (arr1: [Int], arr2: [Int]) -> [Int] {
    var fnAr: [Int] = []
    for (value1,value2) in zip(arr1,arr2) {  //Here if we want to iterate two loops parrallely, we use "zip" keyword
        if value1 == value2 {
            fnAr.append(value1)
        }
    }
    print(fnAr)
    return fnAr
}
takeTwoArr(arr1: [0,4,4], arr2: [4,5,6,7])

//Memory Management (Automatic Reference Counting)
 
class Test {
    var name: String
    
    init(name: String) {
        self.name = name
        print("Test class initilized")
    }
    func dispOut() {
        print("name is \(name)")
    }
    deinit {
        print("Test class de-initilized")
    }
}
if 1 == 1 {   // If condition ko values baira access garna mildaina kinaki tyo sakke pachi tyo values aafai destroy huncha
    var obT = Test(name: "EB Pearls")
    obT.dispOut()
}
// yo garda deinit call huncha kinaki object ko use chaina katai pani so swift le aafai deinit garcha i.e 0 reference count


//Error Handling

enum CarError: Error {    // here error is inbuilt protocol in swift to implement error in enum as well
    case inSufficientPetrolQty (minimumRequired: Int)
    case inSufficientAge (neededAge: Int )
}

struct Car {
    
    func nepalTour (petrolQty: Int) throws -> String {
        if petrolQty < 5 {
            //throw error
            throw CarError.inSufficientPetrolQty(minimumRequired: 5)
        }
        return "We have enough petrol for the journey"
    }
    
    
    func driveCar (age: Int) throws -> String {
        if age < 18 {
            throw CarError.inSufficientAge(neededAge: 18)
        }
        return "You have sufficient age to drive"
    }
}

 
 
let objCar = Car()
do {
    try objCar.driveCar(age: 5)}
catch CarError.inSufficientPetrolQty(let minQty) {
    print("Error occured due to insufficient petrol, minimum required petrol is \(minQty)")
}
catch CarError.inSufficientAge(neededAge: let minAge) {
    print("Error occured due to age restrictions, minimum required petrol is \(minAge)")
}


  
