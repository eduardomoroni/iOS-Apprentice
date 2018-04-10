import Foundation

class Score {
  private var score: Int

  init(_ score: Int) {
    self.score = score
  }
  
  func increment(_ by: Int) {
    score += by
  }
}

extension Score: Equatable {
  static func ==(lhs: Score, rhs: Score) -> Bool {
    return lhs.score == rhs.score
  }
}
