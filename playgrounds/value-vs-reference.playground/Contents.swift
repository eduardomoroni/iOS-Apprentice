import UIKit

class Point: CustomStringConvertible {
    var x: Float = 0
    var y: Float = 0
    
    init (x: Float, y: Float) {
        self.x = x
        self.y = y
    }
    
    var description: String {
        return "{ x: \(x), y: \(y) }"
    }
}

struct Shape {
    var center: Point
}

var initialPoint = Point(x: 0, y: 0)
var circle = Shape(center: initialPoint)
var square = Shape(center: initialPoint)

square.center.x = 5
circle.center
