import Quick
import Nimble

@testable import BullsEye

class GameViewControllerSpecs: QuickSpec {
  override func spec() {
    describe("GameViewController") {
      describe("updateScoreLabel") {
        let viewController = GameViewController()
        
        viewController.updateScoreLabel("10")
        
        expect(viewController.scoreLabel.text).to(equal("10"))
      }
    }
  }
} 
