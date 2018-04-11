import Quick
import Nimble

@testable import BullsEye

class GamePresenterSpecs: QuickSpec {
  override func spec() {
    describe("GamePresenter") {
      describe("init") {
        it ("starts with a GameViewController") {
          let view = GameViewController()
          let presenter = GamePresenter(view: view)
          
          expect(presenter.view).to(equal(view))
        }
        
        it ("starts with a Game instance") {
          let presenter = GamePresenter(view: GameViewController())
          
          expect(presenter.game).to(beAKindOf(Game.self))
        }
      }
        
        describe("hit") {
            it("calls the Game's hit method with proper value") {
                let gameMock = GameMock()
                let presenter = GamePresenter(view: GameViewController(), game: gameMock)
                let value = 10
                
                presenter.hit(value)
            }
            
            it("calls the View to update the score") {
                let value = 65
                let gameMock = GameMock()
                let viewMock = GameViewControllerMock()
                let presenter = GamePresenter(view: viewMock, game: gameMock)
              
                presenter.hit(value)
                
                expect(viewMock.didCallUpdateScoreLabel).to(beTrue())
            }
        }
    }
  }
}

class GameViewControllerMock: GameViewController {
    var didCallUpdateScoreLabel = false
    var didCallUpdateScoreLabelWithValue: String?
    
    override func updateScoreLabel(_ label: String) {
        didCallUpdateScoreLabel = true
        didCallUpdateScoreLabelWithValue = label
    }
}

class GameMock: Game {
    var round: Int = 0
    var target: Int = 0
    var score: Score = Score(0)
    
    func newRound() {
        
    }
    
    func hit(_ value: Int) -> Score {
        return Score(0)
    }
}
