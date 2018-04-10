import Foundation

class Score {
  var score: Int

  init(_ score: Int) {
    self.score = score
  }

  func increment(_ by: Int) {
    score += by
  }

  static func +(left: Score, right: Score) -> Score {
    return Score(left.score + right.score)
  }
}

extension Score: Equatable {
  static func ==(left: Score, right: Score) -> Bool {
    return left.score == right.score
  }
}
