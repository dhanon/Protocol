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


// Protocol with an initializer that conforms to the class.
protocol tcpprotocol {

   // Initializer
   init(no1: Int)
}

class mainClass {
   var no1: Int // local storage
   init(no1: Int) {
      self.no1 = no1 // initialization
   }
}

// Class that conform protocol
class subClass: mainClass, tcpprotocol {
   var no2: Int
   init(no1: Int, no2 : Int) {
      self.no2 = no2
      super.init(no1:no1)
   }
   
   // Requires only one parameter for convenient method
   required override convenience init(no1: Int)  {
      self.init(no1:no1, no2:0)
   }
}

// Class instances
let obj1 = mainClass(no1: 20)
let obj2 = subClass(no1: 30, no2: 50)

print("res is: \(obj1.no1)")
print("res is: \(obj2.no1)")
print("res is: \(obj2.no2)")


//Protocol Inheritance
protocol ClassA {
   var no1: Int { get set }
   func calc(sum: Int)
}

protocol Result {
   func print(target: ClassA)
}

class Student2: Result {
   func print(target: ClassA) {
      target.calc(sum: 1)
   }
}

class ClassB: Result {
   func print(target: ClassA) {
      target.calc(sum: 5)
   }
}

class Student: ClassA {
   var no1: Int = 10
    
   func calc(sum: Int) {
      no1 -= sum
      print("Student attempted \(sum) times to pass")
        
      if no1 <= 0 {
         print("Student is absent for the exam")
      }
   }
}

class Player {
   var stmark: Result!
    
   init(stmark: Result) {
      self.stmark = stmark
   }
    
   func print(target: ClassA) {
      stmark.print(target: target)
   }
}

var marks = Player(stmark: Student2())
var marksec = Student()

marks.print(target: marksec)
marks.print(target: marksec)
marks.print(target: marksec)

marks.stmark = ClassB()
marks.print(target: marksec)
marks.print(target: marksec)
marks.print(target: marksec)


// Protocol with Extension

protocol Generator {
   associatedtype Element
   mutating func next() -> Element?
}

extension Array: Generator {
   mutating func next() -> Element? {
      guard !isEmpty else { return nil }
      return removeFirst()
   }
}

var items = [10, 20, 30]
while let x = items.next() {
   print(x)
}

for lists in [1, 2, 3].compactMap({ i in i * 5 }) {
   print(lists)
}

print([100, 200, 300])
print([1, 2, 3].map({ i in i * 10 }))


protocol AgeClassificationProtocol {
   var age: Int { get }
   func ageType() -> String
}

class Person: AgeClassificationProtocol {
   let firstname: String
   let lastname: String
   var age: Int

   init(firstname: String, lastname: String, age: Int) {
      self.firstname = firstname
      self.lastname = lastname
      self.age = age
   }

   func fullname() -> String {
      return firstname + " " + lastname
   }

   func ageType() -> String {
      switch age {
         case 0...2:
            return "Baby"
         case 3...12:
            return "Child"
         case 13...19:
            return "Teenager"
         case 65...:
            return "Elderly"
         default:
            return "Normal"
        }
    }
}

let obj = Person(firstname: "Mona", lastname: "Singh", age: 10)
print("Full Name: \(obj.fullname())")
print("Age Type: \(obj.ageType())")


//Protocol Conformancex
//Checking for Protocol Conformancex`
@objc protocol rectangle2 {
   var area: Double { get }
}

@objc class Circle: rectan {
   let pi = 3.1415927
   var radius: Double
   var area: Double { return pi * radius * radius }
   init(radius: Double) { self.radius = radius }
}

@objc class result: rectan {
   var area: Double
   init(area: Double) { self.area = area }
}

class sides {
   var rectsides: Int
   init(rectsides: Int) { self.rectsides = rectsides }
}
let objects: [AnyObject] = [Circle(radius: 2.0),result(area: 198),sides(rectsides: 4)]

for object in objects {
   if let objectWithArea = object as? rectan {
      print("Area is \(objectWithArea.area)")
   } else {
      print("Rectangle area is not defined")
   }
}


@objc protocol rectan {
   var area: Double { get }
}
