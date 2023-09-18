protocol Comparable {
    func compare(object: Self) -> Bool
}
class Being: Comparable {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    func compare(object: Being) -> Bool {
        return self.age < object.age
    }

}

var objectPerson = [Being(name: "Partha", age: 5),
                    Being(name: "Pranjal", age: 10),
                    Being(name: "Roshan", age: 20)]

var objectAnimal = [Being(name: "Dog", age: 20),
                    Being(name: "Cat", age: 10),
                    Being(name: "Chicken", age: 2)]

var objectNil: [Being] = []


func takeArrObj<T: Comparable>(objectGet: [T]) -> T? {
    guard !objectGet.isEmpty else {
            return nil
        }
    var object = objectGet[0]
    for value in objectGet {
        if value.compare(object: object) {
            object = value
        }
    }
    return object
}

takeArrObj(objectGet: objectPerson)
takeArrObj(objectGet: objectAnimal)

takeArrObj(objectGet: objectNil)

var strValue: Int? = objectAnimal.first?.age
if let value = strValue {
    print(value)
} else {
    print("no value")
}

//Define a protocol called `Parsable` that requires an implementation of a `parse()` method that takes a string and returns an object of the conform//ing //type. Implement the protocol in a struct called `Rectangle` that has properties for width and height, and write a function that takes a string in the //format "width,height" and returns a `Rectangle` object.

//protocol Parsable {
//    func parse(string: String) -> Self
//}
//
//struct Rectangle: Parsable {
//    func parse(string: String) -> Rectangle {
//        return
//    }
//
//    var width: Int
//    var height: Int
//
//    func takesString()
//}

//1. Write a function that takes a dictionary with string keys and integer values as an argument and returns a new dictionary that contains the keys sorted in //descending order by their values.


//func takesDict(dict: [String:Int]) -> [String:Int] {
//    var newDict: [String:Int] = [:]
//    var newArr: [Int] = []
//    var dictValues = dict.values
//    for values in dictValues {
//        newArr.append(values)
//    }
//    var sortedArr = newArr.sorted()
//    print(sortedArr)
//        for value in sortedArr {
//            for (key,_) in dict {
//                newDict[key] = value
//        }
//    }
//return newDict
//       }
//takesDict(dict: ["Partha":5, "Pranjal":10,"Roshan":15 ])

//Write a function that takes a dictionary with string keys and integer values and returns the key with the median value.

func takeDict(dict: [String:Int]) -> String? {
    var newArr: [Int] = []
    for (_,values) in dict {
        newArr.append(values)
    }
    var sortedArr = newArr.sorted()
    var median: Int = 0
    if newArr.count % 2 == 0 {
        var middle = sortedArr.count / 2
        median = (sortedArr[middle] + sortedArr[middle - 1]) / 2
        
    } else {
        let middle = sortedArr.count / 2
                median = sortedArr[middle]
        }
    
    for (key,values) in dict {
        if values == median {
            return key
        }
    }
    return nil
}

takeDict(dict: ["Partha":5, "Pranjal": 10, "Roshan": 15])

//Write a function that takes a dictionary with string keys and integer values and returns the key with the largest difference between its value and the average value of all the values

func takesDict(dict: [String:Int]) -> String? {
    var newArr: [Int] = []
    for (_,values) in dict {
        newArr.append(values)
    }
    var sum: Int = 0
    for value in newArr {
        sum = value + value
    }
    var average: Int = sum / newArr.count
    var maxVal: Int = 0
    
    for (key,values) in dict {
        if values > average && values > maxVal {
            maxVal = values
            return key
        }
    }
    return nil
}

takesDict(dict: ["Partha":5, "Pranjal": 10, "Roshan": 15])


//Write a function that takes an optional integer as an argument and returns the sum of all the digits of the integer.

func takesInt(num: Int?) -> Int? {
    var sum: Int = 0
    if var value = num {
        while value != 0 {
            sum = sum + value % 10
            value = value / 10
        }
        return sum
    }
    return nil
}

takesInt(num: 123)


//Write a function that takes an optional array of integers as an argument and returns the maximum product that can be obtained by multiplying any three elements in the array.

func optArr(intArr: [Int]?) -> Int? {
    if var value = intArr {
        var sortedArr = value.sorted(by: >)
        return (sortedArr[0] * sortedArr[1] * sortedArr[2])
        }
    return nil
    }
optArr(intArr: [1,2,3,4,5])


//Write a function that takes an array of any type and returns a new array that contains only the elements that are instances of a specific class or subclass.


//func genArr<T> (arr: [T]?) -> [T]? {
//
//}

