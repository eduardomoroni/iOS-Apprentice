import Foundation

import Quick
import Nimble

@testable import BullsEye

class ScoreSpecs: QuickSpec {
  override func spec() {
    
    it ("should increment total score") {
      let score = Score(0)
      let expectedScore = Score(1)
      
      score.increment(1)
      
      expect(score == expectedScore).to(beTruthy())
    }
    
  }
}
