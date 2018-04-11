import Foundation

class RandomNumberGenerator {
  func generate() -> Int {
    return 1 + Int(arc4random_uniform(100))
  }
}
