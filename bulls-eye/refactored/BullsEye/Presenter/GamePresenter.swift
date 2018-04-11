import Foundation

protocol GamePresenter: class {
  var view: GameViewController { get set }
  var game: Game { get set }
}

class BullsEyePresenter: GamePresenter {
  let messageGenerator: ScoreAlertGenerator
  var view: GameViewController
  var game: Game

  init(view: GameViewController, game: Game = BullsEye()) {
    self.view = view
    self.game = game
    self.messageGenerator = ScoreAlertGenerator()
    self.view.presenter = self
  }

  func hit(_ value: Int) {
    let pointScored = game.hit(value)
    view.updateScoreLabel(String(describing: pointScored))
    
    let alertMessage = messageGenerator.congratsMessage(for: pointScored)
    print(alertMessage)
  }
}
