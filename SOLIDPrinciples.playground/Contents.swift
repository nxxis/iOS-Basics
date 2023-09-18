import UIKit
// Single Responsibility Principle
/// one class with only one responsibility, rather than using many functions
/// making different class with different responsibilty

struct EmployeeModel {
    let name: String
    let address: String
    let age: Int
}

class HttpHandler {
    func getDataFromEmployee() -> String
    {
        "data fetched"
    }
}

class Parser {
    func parseApi(emp: String) -> String {
        "API Parsed"
    }
}

class Employee {
    let _httpHandeler: HttpHandler
    let _parser: Parser
    
    init(httpHandler: HttpHandler, parser: Parser) {
        self._httpHandeler = httpHandler
        self._parser = parser
    }
    
    func getEmployeData() {
        let employeResponse = _httpHandeler.getDataFromEmployee()
        let employeeDataArray = _parser.parseApi(emp: employeResponse)
    }
}

let obj = Employee(httpHandler: HttpHandler(), parser: Parser())


protocol Printable {
    func printDetails() -> String
}
class Car: Printable {
    let name: String
    let color: String
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    func printDetails() -> String {
        return "I have \(self.color) color \(self.name)."
    }
}
class Bike: Printable {
    let name: String
    let color: String
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    func printDetails() -> String {
        return "I have \(self.name) bike of color \(self.color)."
    }
}

class Logger {
    func printData() {
        let vehicles: [Printable] = [Car(name: "BMW", color: "Red"),
                                  Car(name: "Audi", color: "Black"),
                            Bike(name: "Honda CBR", color: "Black"),
                              Bike(name: "Triumph", color: "White")]
        vehicles.forEach { vehicle in
            print(vehicle.printDetails())
        }
    }
}

let obj1: () = Logger().printData()


// Open-Closed Principle
protocol Shape {
    func calculateArea() -> Double
}
 
class Rectangle: Shape {
    let height: Double
    let width: Double
    
    init(height: Double, width: Double)
    {
        self.height = height
        self.width = width
    }
    
    func calculateArea() -> Double {
        return height * width
    }
}

class Circle: Shape {
    let radius: Double
    
    init(radius: Double)
    {
        self.radius = radius
    }
    
    func calculateArea() -> Double {
        return Double.pi * radius * radius
    }
}

class AreaCalculator {
    func area(shape: Shape) -> Double  {
        return shape.calculateArea()
    }
}
let areaCalculator = AreaCalculator()
let objRect = Rectangle(height: 50, width: 60)
let objCircle = Circle(radius: 5)
areaCalculator.area(shape: objCircle)

//======================================================================

// Notification Names
extension Notification.Name {
    static let studentNotification = Notification.Name("StudentNotification")
}

// Student Class
class Student {
    func communicate() {
        NotificationCenter.default.post(name: .studentNotification, object: self, userInfo: ["message": "Something interesting to share!"])
    }
}

// Teacher Class
class Teacher {
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .studentNotification, object: nil)
    }
    
    @objc func handleNotification(_ notification: Notification) {
        if let message = notification.userInfo?["message"] as? String {
            print("Teacher: \(message)")
        }
    }
}

// Usage
let student = Student()
let teacher = Teacher()

student.communicate()
