import Foundation

enum Bonus: Int {
  case perfect = 100
  case almost = 50
}

enum ScoreType: Int {
  case maxScore = 100
}

class ScoreCalculator {
  func calculate (target: Int, hit: Int) -> Score {
    let difference = abs(target - hit)
    let points = ScoreType.maxScore.rawValue - difference
    let bonus = calculateBonus(difference)

    return Score(points + bonus)
  }

  private func calculateBonus(_ difference: Int) -> Int {
    if difference == 0 {
      return Bonus.perfect.rawValue
    } else if difference == 1 {
      return Bonus.almost.rawValue
    }

    return 0
  }
}
