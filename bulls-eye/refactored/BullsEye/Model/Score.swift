import Foundation

class Score {
  internal(set) var points: Int

  init(_ score: Int) {
    self.points = score
  }

  func increment(_ by: Int) {
    points += by
  }

  static func +(left: Score, right: Score) -> Score {
    return Score(left.points + right.points)
  }
}

extension Score: Equatable {
  static func ==(left: Score, right: Score) -> Bool {
    return left.points == right.points
  }
}

extension Score: CustomStringConvertible {
  var description: String {
    return "\(self.points)"
  }
}
