// Extentions
// if we want to extend functionality of existing class, type
// we can extend protocols,enums and so on

extension Double {
    func convertToFahrenHeit () -> Double {
        return ((self * 1.80) + 32)
    }
    
    func convertToCelcius () -> Double {
        return ((self - 32) / 1.80)
    }
}

var celciusValue: Double = 37
var fahrenheitValue: Double = 98.6

print("Celcius value \(celciusValue) in Fahrenheit is \(celciusValue.convertToFahrenHeit())")

print("Fahrenheit value \(fahrenheitValue) in Celcius is \(fahrenheitValue.convertToCelcius())")

// here we can use extention to Double type with extra feature and access that easily anytime we need
 
func greater<T: Equatable>(a: T, b: T) {
    if a == b {
        print("equal")
    } else {
        print("not equal")
    }
}

greater(a: 5, b: 6)
greater(a: "ss", b: "ss")


//func find<T: Numeric>(a: T, b: T) -> String {
//    let sum = a + b
//    return "The sum is \(sum)"
//}
//
//let sum = find(a: 10, b: 20)
////let sum1: Double = find(a: 10, b: 20)

func find<T: Numeric>(a: T, b: T) -> T {
    return a + b
}

let sum = find(a: 10.15, b: 20.89)
let sum1: Double = find(a: 10, b: 20)


func swapData<T>(x: inout T, y: inout T) {    //in-out le reference type ma change garcha
    let t = x
    x = y
    y = t
}

var a = 5.0
var b = 2.0
swapData(x: &a, y: &b)   //& le reference pathaucha
print(a,b)
var sT1 = "ss"
var sT2 = "ssw"
swapData(x: &sT1, y: &sT2)
print(sT1,sT2)

//arthmetic kaam vayema <numeric> lekhne, functionalily ma depend huncha kun protocol; kun use garni vanera
//Dictionary array haru sabai generic huncha

class Math <T:Numeric> {
    func addNum(x: T, y: T) -> T {
        return x + y
    }
    func multNum(x: T, y: T) ->T {
        return x * y
    }
}

//naya data type ma kaam garnu paryo vane naya object banayera garni

var resultStr = Math<Int>()
resultStr.addNum(x: 5, y: 6)

var resultStr2 = Math<Double>()
resultStr2.multNum(x: 6.0, y: 7.0)
 
