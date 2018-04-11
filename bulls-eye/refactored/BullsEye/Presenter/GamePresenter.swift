import Foundation

protocol GamePresenter: class {
  weak var view: GameViewController? { get set }
  var game: Game { get set }
  
  func hit(_ value: Int)
  func newGame()
}

class BullsEyePresenter: GamePresenter {
  let messageGenerator: ScoreAlertGenerator
  weak var view: GameViewController?
  var game: Game

  init(view: GameViewController, game: Game = BullsEye()) {
    self.view = view
    self.game = game
    self.messageGenerator = ScoreAlertGenerator()
    self.view?.presenter = self
  }

  func hit(_ value: Int) {
    let pointScored = game.hit(value)
    view?.updateScoreLabel(String(describing: pointScored))
    
    print(pointScored)
    
    let alertMessage = messageGenerator.congratsMessage(for: pointScored)
    print(alertMessage)
  }
  
  func newGame() {
    
  }
}
