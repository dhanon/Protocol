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
