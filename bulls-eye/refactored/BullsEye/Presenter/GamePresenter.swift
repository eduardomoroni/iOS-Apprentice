import Foundation

protocol GamePresenter: class {
  weak var view: GameViewController? { get set }
  var game: Game { get set }
  var score: Score { get }
  var round: Int { get }
  var target: Int { get }
  
  func hit(_ value: Int)
  func newGame()
}

class BullsEyePresenter: GamePresenter {
  let messageGenerator: ScoreAlertGenerator
  weak var view: GameViewController?
  var game: Game

  var target: Int {
    get {
      return self.game.target
    }
  }
  
  var round: Int {
    get {
      return self.game.round
    }
  }
  
  var score: Score {
    get {
      return self.game.score
    }
  }
  
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
    view?.updateRoundLabel(String(round))
    view?.updateTargetLabel(String(target))
    view?.updateScoreLabel(String(describing: score))
  }
}
