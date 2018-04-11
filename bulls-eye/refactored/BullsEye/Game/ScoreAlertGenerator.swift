import Foundation

class ScoreAlertGenerator {
  func congratsMessage(for score: Score) -> Alert {
    let perfectPoints = Bonus.perfect.rawValue + ScoreType.maxScore.rawValue
    let points = score.points
    let message = "You scored \(points) points"
    
    let title: String
    
    if points == perfectPoints {
      title = "Perfect!"
    } else if points >= perfectPoints - 50 {
      title = "You almost had it!"
    } else if points >= perfectPoints - 100 {
      title = "Pretty good!"
    } else {
      title = "Not even close..."
    }

    return Alert(title: title, message: message)
  }
}
