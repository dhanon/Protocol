import UIKit

protocol Shape {
    func area() -> Double
}

class Circle: Shape {
    var radius: Double
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return .pi * radius * radius
    }
}

class Rectangle: Shape {
    var width: Double
    var height: Double
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func area() -> Double {
        return width * height
    }
}

func printArea(title: String, of shape: Shape) {
    print("\(title) \(shape.area())")
}

let circle = Circle(radius: 5)
let rectangle = Rectangle(width: 10, height: 5)

printArea(title: "Area of Circle:", of: circle)   // Extending behavior without modifying the original function
printArea(title: "Area of Rectangle:", of: rectangle)


// create a protocol that conforms by a class.
protocol classa {

   // Properties
   var marks: Int { get set }
   var result: Bool { get }
   
   // Method
   func attendance() -> String
   func markssecured() -> String
}

// Protocol
protocol classb: classa {
   
   // Properties
   var present: Bool { get set }
   var subject: String { get set }
   var stname: String { get set }
}

// Class that conform Protocol
class classc: classb {
   var marks = 96
   let result = true
   var present = false
   var subject = "Swift 4 Protocols"
   var stname = "Protocols"
   
   func attendance() -> String {
      return "The \(stname) has secured 99% attendance"
   }
   
   func markssecured() -> String {
      return "\(stname) has scored \(marks)"
   }
}

// Instance of class
let studdet = classc()
studdet.stname = "Swift 4"
studdet.marks = 98

// Accessing methods and properties
print(studdet.markssecured())

print(studdet.marks)
print(studdet.result)
print(studdet.present)
print(studdet.subject)
print(studdet.stname)


// Protocol with mutating method requirements.
protocol daysofaweek {
   // Mutating method
   mutating func display()
}

// Enumeration that conforms to the Protocol
enum days: daysofaweek {
   case sun, mon, tue, wed, thurs, fri, sat
    
   mutating func display() {
      switch self {
         case .sun:
            print("Sunday")
         case .mon:
            print("Monday")
         case .tue:
            print("Tuesday")
         case .wed:
            print("Wednesday")
         case .thurs:
            print("Thursday")
         case .fri:
            print("Friday")
         case .sat:
            print("Saturday")
      }
   }
}

// Instance of enumeration
var res = days.wed
res.display()
