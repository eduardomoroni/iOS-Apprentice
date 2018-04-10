import Foundation

import Quick
import Nimble

@testable import BullsEye

class ScoreCalculatorSpecs: QuickSpec {
  override func spec() {
    let calculator: ScoreCalculator = ScoreCalculator()
    
    describe("bonuses scenarios") {
      it ("should gives perfect bonus value if user hits bull eye") {
        let targetValue = 50
        let score = calculator.calculate(target: targetValue, hit: targetValue)
        let expectedScore = Score(Bonus.perfect.rawValue + ScoreType.maxScore.rawValue)
        
        expect(expectedScore == score).to(beTruthy())
      }
      
      it ("should gives almost bonus value if user misses bull eye by one") {
        let targetValue = 50
        let score = calculator.calculate(target: targetValue, hit: targetValue - 1)
        let expectedScore = Score(Bonus.almost.rawValue - 1 + ScoreType.maxScore.rawValue)
        
        expect(expectedScore == score).to(beTruthy())
      }
    }
  }
}
