import Foundation

class ScoreCalculator {
  func calculate (target: Int, hit: Int) -> Score {
    let difference = abs(target - hit)
    let points = 100 - difference
    let bonus = calculateBonus(difference)

    return Score(points + bonus)
  }
  
  private func calculateBonus(_ difference: Int) -> Int {
    var bonus = 0
    
    if difference == 0 {
      bonus += 100
    } else if difference < 5 {
      if difference == 1 {
        bonus += 50
      }
    }
    
    return bonus
  }
}
