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
    let score = Score(ScoreType.maxScore.rawValue - difference)
    let bonus = calculateBonus(difference)

    return score + bonus
  }

  private func calculateBonus(_ difference: Int) -> Score {
    var bonus = 0
    
    if difference == 0 {
      bonus += Bonus.perfect.rawValue
    } else if difference == 1 {
      bonus += Bonus.almost.rawValue
    }

    return Score(bonus)
  }
}
