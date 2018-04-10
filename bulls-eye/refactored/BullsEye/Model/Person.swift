import Foundation

class Person {
  public var score: Score
  public var name: String
  
  init(name: String, score: Score) {
    self.name = name
    self.score = score
  }
}
